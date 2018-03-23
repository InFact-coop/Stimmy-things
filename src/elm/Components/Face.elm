module Components.Face exposing (..)

import Data.Face exposing (urlFromFace, faceToInt)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Helpers.Utils exposing (ifThenElse)
import Types exposing (..)


face : LogStage -> Model -> Face -> Html Msg
face logStage model face =
    div [ onClick <| ToggleFace logStage face, class <| (highlightSelectedFace logStage model face) ]
        [ img [ src (urlFromFace face) ] []
        ]


highlightSelectedFace : LogStage -> Model -> Face -> String
highlightSelectedFace logstage model face =
    let
        selectedFace =
            (if logstage == Pre then
                model.newLog.preFace
             else
                model.newLog.postFace
            )
    in
        ifThenElse ((faceToInt face) == selectedFace) "face-container b--green" "face-container b--white"
