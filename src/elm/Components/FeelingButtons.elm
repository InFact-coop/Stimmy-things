module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Feeling -> Html Msg
feelingButton logStage feeling =
    div [ class "flex white f5 lh-f5 justify-center bg-green br-pill pa1 pointer w5 h2 mb4", onClick (ToggleFeeling logStage feeling) ] [ text (unionTypeToString feeling) ]
