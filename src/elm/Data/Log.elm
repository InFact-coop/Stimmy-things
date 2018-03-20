module Data.Log exposing (..)

import Data.Face exposing (faceToInt)
import Data.Feelings exposing (decodeFeeling, stringToFeeling)
import Helpers.Utils exposing (isNewListEntry, unionTypeToString)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Time exposing (Time)
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


decodeLog : Decoder Log
decodeLog =
    decode Log
        |> required "timeTaken" float
        |> required "stimId" string
        |> required "preFace" int
        |> required "postFace" int
        |> required "preFeelings" (list decodeFeeling)
        |> required "postFeelings" (list decodeFeeling)
        |> required "dateTime" float


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


addTimeTaken : Model -> Model
addTimeTaken model =
    { model | newLog = updateTime (model.timeSelected - model.counter) model.newLog }


updateTime : Time -> Log -> Log
updateTime time log =
    { log | timeTaken = time }


normaliseDBLog : Log -> DBLog
normaliseDBLog log =
    { log
        | preFeelings = List.map unionTypeToString log.preFeelings
        , postFeelings = List.map unionTypeToString log.postFeelings
    }


normaliseLog : DBLog -> Log
normaliseLog log =
    { log
        | preFeelings = List.map stringToFeeling log.preFeelings
        , postFeelings = List.map stringToFeeling log.postFeelings
    }
