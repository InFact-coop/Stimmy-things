module Data.Hotspots exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Types exposing (..)


hotspotCoordsDecoder : Decoder HotspotCoords
hotspotCoordsDecoder =
    decode HotspotCoords
        |> required "name" decodeBodyPart
        |> required "bottom" float
        |> required "height" float
        |> required "left" float
        |> required "right" float
        |> required "top" float
        |> required "width" float
        |> required "x" float
        |> required "y" float


decodeBodyPart : Decoder BodyPart
decodeBodyPart =
    string
        |> andThen
            (\string ->
                case string of
                    "Head" ->
                        succeed Head

                    "Face" ->
                        succeed Face

                    "Shoulders" ->
                        succeed Shoulders

                    "Chest" ->
                        succeed Chest

                    "Belly" ->
                        succeed Belly

                    "Arms" ->
                        succeed Arms

                    "Hands" ->
                        succeed Hands

                    "Legs" ->
                        succeed Legs

                    "Feet" ->
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
