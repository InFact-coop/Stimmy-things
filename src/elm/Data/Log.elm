module Data.Log exposing (..)

import Data.Face exposing (faceToInt)
import Helpers.Utils exposing (isNewListEntry)
import Types exposing (..)


defaultLog : Log
defaultLog =
    Log 0 "" 0 0 [] [] 0


addPreFeelingToLog : Log -> Feeling -> Log
addPreFeelingToLog log feeling =
    if isNewListEntry feeling log.preFeelings then
        { log | preFeelings = log.preFeelings ++ [ feeling ] }
    else
        { log | preFeelings = List.filter (\x -> x /= feeling) log.preFeelings }


addPreFaceToLog : Face -> Log -> Log
addPreFaceToLog face oldLog =
    { oldLog | preFace = (faceToInt face) }


addPostFeelingToLog : Log -> Feeling -> Log
addPostFeelingToLog log feeling =
    if isNewListEntry feeling log.postFeelings then
        { log | postFeelings = log.postFeelings ++ [ feeling ] }
    else
        { log | postFeelings = List.filter (\x -> x /= feeling) log.postFeelings }


addPostFaceToLog : Face -> Log -> Log
addPostFaceToLog face oldLog =
    { oldLog | postFace = (faceToInt face) }
