module Components.PillButton exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString, ifThenElse)
import Helpers.Style exposing (classes)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : LogStage -> Model -> Feeling -> Html Msg
feelingButton logStage model feeling =
    div
        [ classes
            [ "flex f5 lh-f5 justify-center br-pill pa1 pointer w5 h2 mb4"
            , ifThenElse (highlightSelectedFeeling logStage model feeling) "bg-light-green green" "bg-green white"
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
