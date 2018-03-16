port module Ports exposing (..)

import Time
import Types exposing (..)


port initCarousel : () -> Cmd msg


subscriptions : Model -> Sub Msg
subscriptions model =
    timeSubscription model


timeSubscription : Model -> Sub Msg
timeSubscription model =
    case model.timerStatus of
        Stopped ->
            Sub.none

        Paused ->
            Sub.none

        Started ->
            Time.every Time.second Tick
