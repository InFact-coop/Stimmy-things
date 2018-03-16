port module Ports exposing (..)

import Time
import Types exposing (..)


port initCarousel : () -> Cmd msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every Time.second Tick
