port module Ports exposing (..)

import Time
import Types exposing (..)
import Json.Decode exposing (..)
import Data.Hotspots exposing (decodeHotspots)


port initCarousel : () -> Cmd msg


port initHotspots : () -> Cmd msg


port recieveHotspotCoords : (Json.Decode.Value -> msg) -> Sub msg


timeSubscription : Model -> Sub Msg
timeSubscription model =
    case model.timerStatus of
        Stopped ->
            Sub.none

        Paused ->
            Sub.none

        Started ->
            Time.every Time.second Tick


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ recieveHotspotCoords
            (decodeHotspots
                >> RecieveHotspotCoords
            )
        , timeSubscription model
        ]
