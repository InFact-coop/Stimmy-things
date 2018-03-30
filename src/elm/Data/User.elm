module Data.User exposing (..)

import Data.Avatar exposing (decodeAvatar)
import Data.SkinColour exposing (decodeSkinColour)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


decodeUser : Decoder User
decodeUser =
    decode User
        |> optional "userId" string ""
        |> optional "avatar" decodeAvatar Avatar1
        |> optional "skinColour" decodeSkinColour SkinColour1
        |> optional "name" string ""


defaultUser : User
defaultUser =
    User "" Avatar1 SkinColour1 ""
