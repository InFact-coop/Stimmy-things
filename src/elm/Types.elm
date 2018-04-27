module Types exposing (..)

import Http exposing (..)
import Time exposing (..)
import Transit


type View
    = CreateAvatar
    | NameAvatar
    | Landing
    | Emergency
    | Onboarding
    | StimInfo
    | StimPreparation
    | StimFinish
    | StimTimer
    | StimRecap
    | AddStim
    | About
    | Splash
    | ShareModal
    | DeleteModal
    | Blog


type Trilean
    = Yes
    | No
    | Neutral


type alias Model =
    Transit.WithTransition
        { view : View
        , userId : String
        , avatar : Avatar
        , avatarName : String
        , skinColour : SkinColour
        , stims : List Stim
        , logs : List Log
        , newStim : Stim
        , newLog : Log
        , counter : Time
        , timeSelected : Time
        , timerStatus : TimerStatus
        , paused : Bool
        , vidSearchString : String
        , videos : List Video
        , videoStatus : RemoteData
        , showNav : Trilean
        , stimMenuShowing : Maybe BodyPart
        , hotspots : Hotspots
        , selectedStim : Stim
        , stimsWithUser : List StimWithUser
        , stimInfoDestination : View
        , lastOnboarding : Bool
        }


type Avatar
    = Avatar1
    | Avatar2
    | Avatar3
    | Avatar4
    | Avatar5
    | Avatar6


type SkinColour
    = SkinColour1
    | SkinColour2
    | SkinColour3
    | SkinColour4
    | SkinColour5
    | SkinColour6
    | SkinColour7
    | SkinColour8
    | SkinColour9
    | SkinColour10
    | SkinColour11
    | SkinColour12
    | SkinColour13
    | SkinColour14


type Face
    = Face1
    | Face2
    | Face3
    | Face4
    | Face5


type alias Stim =
    { stimId : String
    , bodyPart : BodyPart
    , stimName : String
    , instructions : String
    , videoSrc : Maybe String
    , shared : Bool
    , userId : String
    , actionsDisplaying : Bool
    , thumbnail : Maybe String
    , showVideo : Bool
    }


type BodyPart
    = Head
    | Face
    | Shoulders
    | Chest
    | Belly
    | Arms
    | Hands
    | Legs
    | Feet
    | NoBodyPart


type alias Log =
    { timeTaken : Time
    , stimId : String
    , preFace : Int
    , postFace : Int
    , preFeelings : List Feeling
    , postFeelings : List Feeling
    , dateTime : Time
    }


type Feeling
    = Happy
    | Hyper
    | Motivated
    | Anxious
    | Cheerful
    | Angry
    | Excited
    | Bored
    | Sad
    | Annoyed
    | Relaxed
    | Frustrated


type RemoteData
    = NotAsked
    | Loading
    | ResponseFailure
    | ResponseSuccess


type alias Video =
    { id : String
    , title : String
    , description : String
    , thumbnail : String
    }


type TimerControl
    = Start
    | Stop
    | Pause
    | Restart


type TimerStatus
    = Started
    | Stopped
    | Paused


type LogStage
    = Pre
    | Post


type Quadrant
    = TopLeft
    | TopRight
    | BottomLeft
    | BottomRight


type alias HotspotCoords =
    { name : BodyPart
    , bottom : Float
    , height : Float
    , left : Float
    , right : Float
    , top : Float
    , width : Float
    , x : Float
    , y : Float
    }


type alias Hotspots =
    { head : HotspotCoords
    , face : HotspotCoords
    , shoulders : HotspotCoords
    , chest : HotspotCoords
    , arms : HotspotCoords
    , belly : HotspotCoords
    , hands : HotspotCoords
    , legs : HotspotCoords
    , feet : HotspotCoords
    }


type alias DBLog =
    { timeTaken : Time
    , stimId : String
    , preFace : Int
    , postFace : Int
    , preFeelings : List String
    , postFeelings : List String
    , dateTime : Time
    }


type alias User =
    { userId : String
    , avatar : Avatar
    , skinColour : SkinColour
    , name : String
    }


type alias DBData =
    { user : User
    , stims : List Stim
    , logs : List Log
    }


type alias StimWithUser =
    { stim : Stim
    , user : User
    }


type Msg
    = NoOp
    | UpdateVideoSearch String
    | CallVideoRequest
    | ReceiveVideos (Result Http.Error (List Video))
    | SetTime String
    | SetTimeFromText String
    | ChangeView View
    | Tick Time
    | AdjustTimer TimerControl
    | ToggleFeeling LogStage Feeling
    | ToggleFace LogStage Face
    | StopTimer
    | RepeatStim
    | ChangeViewFromTimer View
    | SaveLog
    | SaveOrUpdateUser
    | SaveStim Stim
    | ToggleNav
    | TransitMsg (Transit.Msg Msg)
    | NavigateTo View
    | ReceiveHotspotCoords (Result String Hotspots)
    | ReceiveUpdatedLogs (List DBLog)
    | ReceiveStimList (Result String (List Stim))
    | UpdateNewStimVideo String
    | ToggleStimMenu BodyPart
    | ToggleBodypart BodyPart
    | ReceiveInitialData (Result String DBData)
    | ReceiveUserSaveSuccess Bool
    | GoToStim Stim
    | GoToRandomStim
    | AddExerciseName String
    | AddHowTo String
    | AddAvatarName String
    | AddStimWithoutBodyPart
    | ReceiveFirebaseStims (Result String (List StimWithUser))
    | ShareStim Stim
    | ImportStim Stim
    | NavigateToStimInfo
    | KeyDown String Int
    | KeyDownFromName Int
    | ChangeSkinColour
    | ReceiveLastOnboarding Bool
    | ToggleActionButtons Stim
    | NavigateToShareModal Stim
    | NavigateToDeleteModal Stim
    | DeleteStim Stim
    | ReceiveDeleteStimSuccess Bool
    | UpdateAvatar { src : String, skinColour : String }
    | ShowVideo Stim
