module Requests.GetVideos exposing (..)

import Http exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


getVideos : Model -> Cmd Msg
getVideos model =
    Http.send ReceiveVideos (getVideosRequest model)


getVideosRequest : Model -> Request (List Video)
getVideosRequest model =
    Http.get ("/api/v1/youtube?q=" ++ model.vidSearchString) (list videoDecoder)


videoDecoder : Decoder Video
videoDecoder =
    decode Video
        |> required "id" string
        |> required "title" string
        |> required "description" string
        |> required "thumbnail" string
