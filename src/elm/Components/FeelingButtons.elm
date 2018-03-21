module Components.FeelingButtons exposing (..)

import Helpers.Style exposing (bodyFont, classes)
import Helpers.Utils exposing (ifThenElse, unionTypeToString)
import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Model -> Feeling -> Html Msg
feelingButton logStage model feeling =
    div
        [ classes
            [ "flex white justify-center br-pill pa1 pointer w5 h2 mb4"
            , bodyFont
            , ifThenElse (highlightSelectedFeeling logStage model feeling) "bg-light-green" "bg-green"
            ]
        , onClick (ToggleFeeling logStage feeling)
        ]
        [ text (unionTypeToString feeling) ]


highlightSelectedFeeling : LogStage -> Model -> Feeling -> Bool
highlightSelectedFeeling logstage model feeling =
    let
        feelings =
            (if logstage == Pre then
                model.newLog.preFeelings
             else
                model.newLog.postFeelings
            )
    in
        List.member feeling feelings
