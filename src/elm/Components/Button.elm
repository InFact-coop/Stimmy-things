module Components.Button exposing (..)

import Helpers.Style exposing (bodyFont, classes)
import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


rectButton : String -> Msg -> Html Msg
rectButton buttonText msg =
    button
        [ classes
            [ "bg-green br2 white pv3 bn w-100 outline-0"
            , bodyFont
            ]
        , onClick msg
        ]
        [ text buttonText ]


stimButton : String -> Msg -> String -> Html Msg
stimButton buttonText msg colour =
    button
        [ classes
            [ "br2 white pv3 bn w-100 outline-0"
            , bodyFont
            , colour
            ]
        , onClick msg
        ]
        [ text buttonText ]
