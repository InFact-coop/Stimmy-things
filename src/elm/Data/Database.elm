module Data.Database exposing (..)

import Data.Log exposing (decodeLog)
import Data.Stim exposing (decodeStim)
import Data.User exposing (decodeUser)
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


dbDataToModel : DBData -> Model -> Model
dbDataToModel { stims, logs, user } model =
    { model
        | stims = stims
        , logs = logs
        , avatarName = user.name
        , avatar = user.avatar
        , skinColour = user.skinColour
        , userId = user.userId
    }
