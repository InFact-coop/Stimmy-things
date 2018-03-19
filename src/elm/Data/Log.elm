module Data.Log exposing (..)

import Data.Face exposing (faceToInt)
import Helpers.Utils exposing (isNewListEntry)
import Types exposing (..)


defaultLog : Log
defaultLog =
    Log 0 "" 0 0 [] [] 0


addFeelingToLog : Log -> Feeling -> Log
addFeelingToLog log feeling =
    if isNewListEntry feeling log.preFeelings then
        { log | preFeelings = log.preFeelings ++ [ feeling ] }
    else
        { log | preFeelings = List.filter (\x -> x /= feeling) log.preFeelings }


addPreFaceToLog : Face -> Log -> Log
addPreFaceToLog face oldLog =
    { oldLog | preFace = (faceToInt face) }
