port module Ports exposing (..)

import Types exposing (..)
import Json.Decode exposing (..)
import Data.Hotspots exposing (decodeHotspots)


port initCarousel : () -> Cmd msg


port initHotspots : () -> Cmd msg


port recieveHotspotCoords : (Json.Decode.Value -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ recieveHotspotCoords
            (decodeHotspots
                >> RecieveHotspotCoords
            )
        ]
