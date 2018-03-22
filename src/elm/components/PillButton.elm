module Components.PillButton exposing (..)

import Helpers.Style exposing (bodyFont, classes)
import Helpers.Utils exposing (ifThenElse, unionTypeToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Model -> Feeling -> Html Msg
feelingButton logStage model feeling =
    div
        [ classes
            [ "flex white justify-center br-pill pa1 pointer feeling-button h2 mb4"
            , bodyFont
            , ifThenElse (highlightSelectedFeeling logStage model feeling) "bg-light-green" "bg-green"
            ]
        , onClick (ToggleFeeling logStage feeling)
        ]
        [ text (unionTypeToString feeling) ]


bodyButton : BodyPart -> Html Msg
bodyButton bodypart =
    div [ class "w-25 flex justify-center bg-green br4 pa1 pointer mh2 mv2", onClick (ToggleBodypart bodypart) ] [ text (unionTypeToString bodypart) ]


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
