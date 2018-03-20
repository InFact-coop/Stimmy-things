module Data.Database exposing (..)

import Data.Feelings exposing (stringToFeeling)
import Data.Hotspots exposing (decodeBodyPart)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


decodeInitialData : Value -> Result String DBData
decodeInitialData =
    decodeValue databaseDecoder


databaseDecoder : Decoder DBData
databaseDecoder =
    decode DBData
        |> required "user" decodeUser
        |> required "stims" (list decodeStim)
        |> required "logs" (list decodeLog)


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


decodeUser : Decoder User
decodeUser =
    decode User
        |> required "userId" string
        |> required "avatar" decodeAvatar
        |> required "skinColour" decodeSkinColour
        |> required "name" string


decodeFeeling : Decoder Feeling
decodeFeeling =
    Json.Decode.map (stringToFeeling) string


decodeAvatar : Decoder Avatar
decodeAvatar =
    Json.Decode.map (stringToAvatar) string


decodeSkinColour : Decoder SkinColour
decodeSkinColour =
    Json.Decode.map (stringToSkinColour) string


stringToAvatar : String -> Avatar
stringToAvatar avatarStr =
    case avatarStr of
        "Avatar1" ->
            Avatar1

        "Avatar2" ->
            Avatar2

        "Avatar3" ->
            Avatar3

        "Avatar4" ->
            Avatar4

        "Avatar5" ->
            Avatar5

        "Avatar6" ->
            Avatar6

        _ ->
            Avatar1


stringToSkinColour : String -> SkinColour
stringToSkinColour avatarStr =
    case avatarStr of
        "SkinColour1" ->
            SkinColour1

        "SkinColour2" ->
            SkinColour2

        "SkinColour3" ->
            SkinColour3

        "SkinColour4" ->
            SkinColour4

        "SkinColour5" ->
            SkinColour5

        "SkinColour6" ->
            SkinColour6

        "SkinColour7" ->
            SkinColour7

        _ ->
            SkinColour1
