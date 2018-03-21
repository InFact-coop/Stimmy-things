module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString, ifThenElse)
import Helpers.Style exposing (classes)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Model -> Feeling -> Html Msg
feelingButton logStage model feeling =
    div
        [ classes
            [ "flex white f5 lh-f5 justify-center br-pill pa1 pointer w5 h2 mb4"
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
