module Types exposing (..)

import Navigation


type Route
    = Home


type alias Model =
    { route : Route
    }


type Msg
    = NoOp
    | UrlChange Navigation.Location
