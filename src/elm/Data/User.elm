module Data.User exposing (..)

import Data.Avatar exposing (decodeAvatar)
import Data.SkinColour exposing (decodeSkinColour)
import Helpers.Utils exposing (unionTypeToString)
import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as Encode exposing (..)
import Types exposing (..)


decodeUser : Decoder User
decodeUser =
    decode User
        |> optional "userId" Decode.string ""
        |> optional "avatar" decodeAvatar Avatar1
        |> optional "skinColour" decodeSkinColour SkinColour1
        |> optional "name" Decode.string ""


defaultUser : User
defaultUser =
    User "" Avatar1 SkinColour1 ""


normaliseUser : Model -> Encode.Value
normaliseUser model =
    Encode.object
        [ ( "avatar", Encode.string <| unionTypeToString model.avatar )
        , ( "skinColour", Encode.string <| toString model.skinColour )
        , ( "name", Encode.string model.avatarName )
        , ( "userId", Encode.string model.userId )
        ]
