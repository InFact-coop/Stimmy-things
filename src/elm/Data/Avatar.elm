module Data.Avatar exposing (..)

import Types exposing (..)
import Json.Decode exposing (..)


decodeAvatar : Decoder Avatar
decodeAvatar =
    Json.Decode.map (stringToAvatar) string


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
