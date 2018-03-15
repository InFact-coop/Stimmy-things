module Data.Hotspots exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


hotspotCoordsDecoder : Decoder HotspotCoords
hotspotCoordsDecoder =
    decode HotspotCoords
        |> required "bottom" float
        |> required "height" float
        |> required "left" float
        |> required "right" float
        |> required "top" float
        |> required "width" float
        |> required "x" float
        |> required "y" float


decodeHotspots : Value -> Result String Hotspots
decodeHotspots =
    decodeValue hotspotsDecoder


defaultHotspotCoords : HotspotCoords
defaultHotspotCoords =
    HotspotCoords 0 0 0 0 0 0 0 0


defaultHotspots : Hotspots
defaultHotspots =
    Hotspots defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords defaultHotspotCoords


hotspotsDecoder : Decoder Hotspots
hotspotsDecoder =
    decode Hotspots
        |> required "head" hotspotCoordsDecoder
        |> required "face" hotspotCoordsDecoder
        |> required "shoulders" hotspotCoordsDecoder
        |> required "chest" hotspotCoordsDecoder
        |> required "arms" hotspotCoordsDecoder
        |> required "belly" hotspotCoordsDecoder
        |> required "hands" hotspotCoordsDecoder
        |> required "legs" hotspotCoordsDecoder
        |> required "feet" hotspotCoordsDecoder
