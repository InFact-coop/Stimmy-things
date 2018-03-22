module Data.Stim exposing (..)

import Data.Hotspots exposing (decodeBodyPart)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


defaultStim : Stim
defaultStim =
    Stim "" Chest "" "" Nothing False ""


decodeStim : Decoder Stim
decodeStim =
    decode Stim
        |> required "stimId" string
        |> required "bodyPart" decodeBodyPart
        |> required "stimName" string
        |> required "instructions" string
        |> required "videoSrc" (maybe string)
        |> required "shared" bool
        |> required "userId" string


addBodypart : BodyPart -> Stim -> Stim
addBodypart bodypart stim =
    { stim | bodyPart = bodypart }


addExerciseName : String -> Stim -> Stim
addExerciseName string stim =
    { stim | stimName = string }


addHowTo : String -> Stim -> Stim
addHowTo string stim =
    { stim | instructions = string }
