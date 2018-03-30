module Data.Database exposing (..)

import Data.Log exposing (decodeLog, defaultLog)
import Data.Stim exposing (decodeStim)
import Data.User exposing (decodeUser, defaultUser)
import Helpers.Utils exposing (ifThenElse)
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
        |> optional "logs" (list decodeLog) []


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
