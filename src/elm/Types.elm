module Types exposing (..)

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
    , skinColour : SkinColour
    , stims : List Stim
    , logs : List Log
    , newStim : Stim
    , newLog : Log
    , counter : Time
    , timeSelected : Time
    , timerStatus : TimerStatus
    , paused : Bool
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


type SkinColour
    = SkinColour1
    | SkinColour2
    | SkinColour3
    | SkinColour4
    | SkinColour5
    | SkinColour6
    | SkinColour7


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
    }


type alias DBStim =
    { stimId : String
    , bodyPart : String
    , stimName : String
    , instructions : String
    , videoSrc : String
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


type Msg
    = NoOp
    | UrlChange Navigation.Location
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
    | ReceiveHotspotCoords (Result String Hotspots)
    | ReceiveUpdatedLogs (List DBLog)
    | ToggleStimMenu BodyPart
    | ReceiveInitialData (Result String DBData)
