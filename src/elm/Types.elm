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
    , counter : Int
    , paused : Bool
    }


type Avatar
    = Alien


type AvatarSkinColour
    = Green


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
    = Chest


type alias Log =
    { timeTaken : Int
    , stimId : String
    , preFace : Int
    , postFace : Int
    , preFeelings : List Feeling
    , postFeelings : List Feeling
    , dateTime : Time
    }


type Feeling
    = Happy


type Msg
    = NoOp
    | UrlChange Navigation.Location
