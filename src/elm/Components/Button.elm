module Components.Button exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


rectButton : String -> Msg -> Html Msg
rectButton buttonText msg =
    button
        [ class "flex items-center justify-center bg-green br2 w-100 white pa2 ma2"
        , onClick msg
        ]
        [ text buttonText ]
