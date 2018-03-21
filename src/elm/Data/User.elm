module Data.User exposing (..)

import Data.Avatar exposing (decodeAvatar)
import Data.SkinColour exposing (decodeSkinColour)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


decodeUser : Decoder User
decodeUser =
    decode User
        |> required "userId" string
        |> required "avatar" decodeAvatar
        |> required "skinColour" decodeSkinColour
        |> required "name" string
