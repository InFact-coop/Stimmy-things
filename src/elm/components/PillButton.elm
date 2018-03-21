module Components.PillButton exposing (..)

import Helpers.Utils exposing (unionTypeToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Feeling -> Html Msg
feelingButton logStage feeling =
    div [ class "w-40 flex justify-center bg-green br4 pa1 pointer", onClick (ToggleFeeling logStage feeling) ] [ text (unionTypeToString feeling) ]


bodyButton : BodyPart -> Html Msg
bodyButton bodypart =
    div [ class "w-25 flex justify-center bg-green br4 pa1 pointer mh2 mv2", onClick (ToggleBodypart bodypart) ] [ text (unionTypeToString bodypart) ]
