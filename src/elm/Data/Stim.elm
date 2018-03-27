module Data.Stim exposing (..)

import Helpers.Utils exposing (stringToMaybe, unionTypeToString)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as Encode
import Types exposing (..)


defaultStim : Stim
defaultStim =
    Stim "" NoBodyPart "" "" Nothing False ""


decodeStim : Decoder Stim
decodeStim =
    let
        log =
            Debug.log ("in decode Stim")
    in
        decode Stim
            |> required "stimId" string
            |> required "bodyPart" decodeBodyPartDB
            |> required "stimName" string
            |> required "instructions" string
            |> required "videoSrc" (Json.Decode.map stringToMaybe string)
            |> required "shared" bool
            |> required "userId" string


decodeStimList : Value -> Result String (List Stim)
decodeStimList =
    decodeValue (list decodeStim)


addBodypart : BodyPart -> Stim -> Stim
addBodypart bodypart stim =
    { stim | bodyPart = bodypart }


decodeBodyPartDB : Decoder BodyPart
decodeBodyPartDB =
    string
        |> andThen
            (\string ->
                case string of
                    "Head" ->
                        succeed Head

                    "Face" ->
                        succeed Face

                    "Shoulders" ->
                        succeed Shoulders

                    "Chest" ->
                        succeed Chest

                    "Belly" ->
                        succeed Belly

                    "Arms" ->
                        succeed Arms

                    "Hands" ->
                        succeed Hands

                    "Legs" ->
                        succeed Legs

                    "Feet" ->
                        succeed Feet

                    "head" ->
                        succeed Head

                    "face" ->
                        succeed Face

                    "shoulders" ->
                        succeed Shoulders

                    "chest" ->
                        succeed Chest

                    "belly" ->
                        succeed Belly

                    "arms" ->
                        succeed Arms

                    "hands" ->
                        succeed Hands

                    "legs" ->
                        succeed Legs

                    "feet" ->
                        succeed Feet

                    _ ->
                        succeed NoBodyPart
            )


addExerciseName : String -> Stim -> Stim
addExerciseName string stim =
    { stim | stimName = string }


addHowTo : String -> Stim -> Stim
addHowTo string stim =
    { stim | instructions = string }


normaliseStim : Stim -> Encode.Value
normaliseStim stim =
    Encode.object
        [ ( "stimId", Encode.string stim.stimId )
        , ( "stimName", Encode.string stim.stimName )
        , ( "bodyPart", Encode.string <| unionTypeToString stim.bodyPart )
        , ( "instructions", Encode.string stim.instructions )
        , ( "videoSrc", Encode.string <| Maybe.withDefault "" stim.videoSrc )
        , ( "userId", Encode.string stim.userId )
        , ( "shared", Encode.bool stim.shared )
        ]
