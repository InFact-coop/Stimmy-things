module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Feeling -> Model -> Html Msg
feelingButton logStage feeling model =
    div [ class "flex white f5 lh-f5 justify-center br-pill pa1 pointer w5 h2 mb4" ++ (highlightSelectedFeeling <| (logStage feeling model)), onClick (ToggleFeeling logStage feeling) ] [ text (unionTypeToString feeling) ]


highlightSelectedFeeling : LogStage -> Feeling -> Model -> String
highlightSelectedFeeling logstage feeling model =
    let
        list =
            (if logstage == Pre then
                model.newLog.preFeelings
             else
                model.newLog.postFeelings
            )
    in
        case (List.member <| feeling list) of
            True ->
                " bg-light-green"

            False ->
                " bg-green"
