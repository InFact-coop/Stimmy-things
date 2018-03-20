module Components.Button exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


rectButton : String -> Msg -> Html Msg
rectButton buttonText msg =
    button
        [ class "flex items-center justify-center bg-green br2 white pa2 ma5 w-100"
        , onClick msg
        ]
        [ text buttonText ]
