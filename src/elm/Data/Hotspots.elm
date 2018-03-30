module Data.Hotspots exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


hotspotCoordsDecoder : Decoder HotspotCoords
hotspotCoordsDecoder =
    decode HotspotCoords
        |> required "name" decodeHotspotBodyPart
        |> required "bottom" float
        |> required "height" float
        |> required "left" float
        |> required "right" float
        |> required "top" float
        |> required "width" float
        |> required "x" float
        |> required "y" float


decodeHotspotBodyPart : Decoder BodyPart
decodeHotspotBodyPart =
    string
        |> andThen
            (\string ->
                case string of
                    "head" ->
                        succeed Head

                    "face" ->
                        succeed Face

                    "shoulders" ->
                        succeed Shoulders

                    "chest" ->
                        succeed Chest

                    "belly" ->
                        succeed Belly

                    "arms" ->
                        succeed Arms

                    "hands" ->
                        succeed Hands

                    "legs" ->
                        succeed Legs

                    "feet" ->
                        succeed Feet

                    _ ->
                        succeed NoBodyPart
            )


decodeHotspots : Value -> Result String Hotspots
decodeHotspots =
    decodeValue hotspotsDecoder


hotspotNames : List String
hotspotNames =
    [ "head", "face", "shoulders", "chest", "arms", "belly", "hands", "legs", "feet" ]


defaultHotspotCoords : HotspotCoords
defaultHotspotCoords =
    HotspotCoords NoBodyPart 0 0 0 0 0 0 0 0


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
