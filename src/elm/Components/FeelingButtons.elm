module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Feeling -> Html Msg
feelingButton logStage feeling =
    div [ class "w-40 flex justify-center bg-green br4 pa1 pointer", onClick (ToggleFeeling logStage feeling) ] [ text (unionTypeToString feeling) ]
