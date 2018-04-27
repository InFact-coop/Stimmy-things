module Components.PillButton exposing (..)

import Helpers.Style exposing (bodyFont, classes, smallFont)
import Helpers.Utils exposing (ifThenElse, unionTypeToString)
import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


highlightSelectedBodypart : Model -> BodyPart -> Bool
highlightSelectedBodypart model bodyPart =
    bodyPart == model.newStim.bodyPart


bodyButton : Model -> BodyPart -> Html Msg
bodyButton model bodyPart =
    div
        [ classes
            [ smallFont
            , "w-25 flex justify-center bg-green br4 pa1 pointer mh2 mv2"
            , ifThenElse (highlightSelectedBodypart model bodyPart) "bg-light-green green" "bg-green white"
            ]
        , onClick (ToggleBodypart bodyPart)
        ]
        [ text (unionTypeToString bodyPart) ]
