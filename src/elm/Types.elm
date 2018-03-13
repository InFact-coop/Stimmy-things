module Types exposing (..)

import Navigation


type Route
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
    { route : Route
    }


type Msg
    = NoOp
    | UrlChange Navigation.Location
