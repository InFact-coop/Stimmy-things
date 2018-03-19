module Data.Log exposing (..)

import Data.Face exposing (faceToInt)
import Helpers.Utils exposing (isNewListEntry)
import Types exposing (..)


defaultLog : Log
defaultLog =
    { timeTaken = 0
    , stimId = ""
    , preFace = 0
    , postFace = 0
    , preFeelings = []
    , postFeelings = []
    , dateTime = 0
    }


addFeeling : LogStage -> Feeling -> Log -> Log
addFeeling logStage feeling log =
    let
        updateFeeling =
            case logStage of
                Pre ->
                    updatePreFeelings

                Post ->
                    updatePostFeelings

        accessFeeling =
            case logStage of
                Pre ->
                    .preFeelings

                Post ->
                    .postFeelings
    in
        if isNewListEntry feeling <| accessFeeling log then
            updateFeeling (accessFeeling log ++ [ feeling ]) log
        else
            updateFeeling (List.filter (\x -> x /= feeling) (accessFeeling log)) log


addFace : LogStage -> Face -> Log -> Log
addFace logStage face log =
    let
        updateFace =
            case logStage of
                Pre ->
                    updatePreFace

                Post ->
                    updatePostFace
    in
        updateFace (faceToInt face) log


updatePreFeelings : List Feeling -> Log -> Log
updatePreFeelings feelings log =
    { log | preFeelings = feelings }


updatePostFeelings : List Feeling -> Log -> Log
updatePostFeelings feelings log =
    { log | postFeelings = feelings }


updatePreFace : Int -> Log -> Log
updatePreFace faceInt log =
    { log | preFace = faceInt }


updatePostFace : Int -> Log -> Log
updatePostFace faceInt log =
    { log | postFace = faceInt }
