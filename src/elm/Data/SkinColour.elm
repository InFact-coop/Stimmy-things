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

        "SkinColour8" ->
            SkinColour8

        "SkinColour9" ->
            SkinColour9

        "SkinColour10" ->
            SkinColour10

        "SkinColour11" ->
            SkinColour11

        "SkinColour12" ->
            SkinColour12

        "SkinColour13" ->
            SkinColour13

        "SkinColour14" ->
            SkinColour14

        _ ->
            SkinColour7


avatarSkinColourSelection : SkinColour -> String
avatarSkinColourSelection skinColour =
    case skinColour of
        SkinColour1 ->
            "./assets/CreateAvatar/paint_btn_1.svg"

        SkinColour2 ->
            "./assets/CreateAvatar/paint_btn_2.svg"

        SkinColour3 ->
            "./assets/CreateAvatar/paint_btn_3.svg"

        SkinColour4 ->
            "./assets/CreateAvatar/paint_btn_4.svg"

        SkinColour5 ->
            "./assets/CreateAvatar/paint_btn_5.svg"

        SkinColour6 ->
            "./assets/CreateAvatar/paint_btn_6.svg"

        SkinColour7 ->
            "./assets/CreateAvatar/paint_btn_7.svg"

        SkinColour8 ->
            "./assets/CreateAvatar/paint_btn_8.svg"

        SkinColour9 ->
            "./assets/CreateAvatar/paint_btn_9.svg"

        SkinColour10 ->
            "./assets/CreateAvatar/paint_btn_10.svg"

        SkinColour11 ->
            "./assets/CreateAvatar/paint_btn_11.svg"

        SkinColour12 ->
            "./assets/CreateAvatar/paint_btn_12.svg"

        SkinColour13 ->
            "./assets/CreateAvatar/paint_btn_13.svg"

        SkinColour14 ->
            "./assets/CreateAvatar/paint_btn_14.svg"
