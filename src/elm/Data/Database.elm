module Data.Database exposing (..)

import Data.Stim exposing (decodeStim)
import Data.User exposing (decodeUser, defaultUser)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


decodeInitialData : Value -> Result String DBData
decodeInitialData =
    decodeValue databaseDecoder


databaseDecoder : Decoder DBData
databaseDecoder =
    decode DBData
        |> optional "user" decodeUser defaultUser
        |> required "stims" (list decodeStim)


dbDataToModel : DBData -> Model -> Model
dbDataToModel { stims, user } model =
    { model
        | stims = stims
        , avatarName = user.name
        , avatar = user.avatar
        , skinColour = user.skinColour
        , userId = user.userId
    }
