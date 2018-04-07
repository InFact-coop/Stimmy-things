module Components.Button exposing (..)

import Helpers.Style exposing (bodyFont, classes)
import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


rectButton : String -> Msg -> Html Msg
rectButton buttonText msg =
    button
        [ classes
            [ "bg-green br2 white pv3 bn w-100"
            , bodyFont
            ]
        , onClick msg
        ]
        [ text buttonText ]


shareStimButton : String -> Msg -> Html Msg
shareStimButton buttonText msg =
    button
        [ classes
            [ "bg-green br2 white pv3 bn w-100"
            , bodyFont
            ]
        , onClick msg
        ]
        [ text buttonText ]
