module Data.Hotspots exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


hotspotDecoder : Decoder HotspotCoords
hotspotDecoder =
    decode HotspotCoords
        |> required "bottom" float
        |> required "height" float
        |> required "left" float
        |> required "right" float
        |> required "top" float
        |> required "width" float
        |> required "x" float
        |> required "y" float


decodeHotspotCoords : Value -> Result String HotspotCoords
decodeHotspotCoords =
    decodeValue hotspotDecoder
