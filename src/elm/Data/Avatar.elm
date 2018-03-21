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


avatarHeadSelection : Avatar -> String
avatarHeadSelection avatar =
    case avatar of
        Avatar1 ->
            "./assets/avatar_1_head.svg"

        Avatar2 ->
            "./assets/avatar_2_head.svg"

        Avatar3 ->
            "./assets/avatar_3_head.svg"

        Avatar4 ->
            "./assets/avatar_4_head.svg"

        Avatar5 ->
            "./assets/avatar_5_head.svg"

        Avatar6 ->
            "./assets/avatar_6_head.svg"
