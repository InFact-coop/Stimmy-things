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


type Msg
    = NoOp
    | UrlChange Navigation.Location
    | MakeCarousel
    | SetTime String
    | ChangeView View
    | Tick Time
    | AdjustTimer TimerControl
    | ToggleFeeling LogStage Feeling
    | ToggleFace LogStage Face
    | StopTimer
    | RepeatStim
