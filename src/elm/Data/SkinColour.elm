module Data.SkinColour exposing (..)

import Types exposing (..)
import Json.Decode exposing (..)


decodeSkinColour : Decoder SkinColour
decodeSkinColour =
    Json.Decode.map (stringToSkinColour) string


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
