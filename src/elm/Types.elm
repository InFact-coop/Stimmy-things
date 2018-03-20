module Types exposing (..)

import Http exposing (..)
import Navigation
import Time exposing (..)


type View
    = CreateAvatar
    | NameAvatar
    | Landing
    | StimInfo
    | StimPreparation
    | StimTimer
    | StimRecap
    | AddStim
    | AddStimSuccessModal
    | Moodboard
    | About
    | ShareModal
    | Blog


type Trilean
    = Yes
    | No
    | Neutral


type alias Model =
    { view : View
    , userId : String
    , avatar : Avatar
    , avatarName : String
    , avatarSkinColour : AvatarSkinColour
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
    }


type Avatar
    = Avatar1
    | Avatar2
    | Avatar3
    | Avatar4
    | Avatar5
    | Avatar6


type AvatarSkinColour
    = Skin1
    | Skin2
    | Skin3
    | Skin4
    | Skin5
    | Skin6
    | Skin7


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
    , videoUrl : Maybe String
    , shared : Bool
    , userId : String
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
    | Optimistic
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


type Msg
    = NoOp
    | UrlChange Navigation.Location
    | UpdateVideoSearch String
    | CallVideoRequest
    | ReceiveVideos (Result Http.Error (List Video))
    | SetTime String
    | ChangeView View
    | Tick Time
    | AdjustTimer TimerControl
    | ToggleFeeling LogStage Feeling
    | ToggleFace LogStage Face
    | StopTimer
    | RepeatStim
    | SaveLog
    | ToggleNav
    | RecieveHotspotCoords (Result String Hotspots)
    | ReceiveUpdatedLogs (List DBLog)
    | ToggleStimMenu BodyPart
    | ToggleBodypart BodyPart
