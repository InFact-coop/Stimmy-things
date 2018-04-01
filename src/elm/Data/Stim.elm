module Data.Stim exposing (..)

import Data.BodyPart exposing (stringToBodyPart)
import Helpers.Utils exposing (stringToMaybe, unionTypeToString)
import Data.BodyPart exposing (stringToBodyPart)
import Data.User exposing (defaultUser, decodeUser)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as Encode
import Random exposing (Generator)
import Random.List
import Types exposing (..)


defaultStim : Stim
defaultStim =
    Stim "" NoBodyPart "" "" Nothing False ""


decodeStim : Decoder Stim
decodeStim =
    decode Stim
        |> required "stimId" string
        |> required "bodyPart" (Json.Decode.map stringToBodyPart string)
        |> required "stimName" string
        |> required "instructions" string
        |> required "videoSrc" (Json.Decode.map stringToMaybe string)
        |> required "shared" bool
        |> required "userId" string


decodeStimList : Value -> Result String (List Stim)
decodeStimList =
    decodeValue (list decodeStim)


firebaseDecoder : Decoder FirebaseData
firebaseDecoder =
    decode FirebaseData
        |> required "stim" decodeStim
        |> optional "user" decodeUser defaultUser


decodeFirebaseData : Value -> Result String (List FirebaseData)
decodeFirebaseData =
    decodeValue (list firebaseDecoder)


addBodypart : BodyPart -> Stim -> Stim
addBodypart bodypart stim =
    { stim | bodyPart = bodypart }


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


generateRandomStim : Model -> Generator Stim
generateRandomStim model =
    Random.List.shuffle model.stims
        |> Random.map retrieveFirstStim


retrieveFirstStim : List Stim -> Stim
retrieveFirstStim listStim =
    listStim
        |> List.head
        |> Maybe.withDefault defaultStim
