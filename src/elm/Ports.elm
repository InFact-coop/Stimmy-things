port module Ports exposing (..)

import Types exposing (..)


port initCarousel : () -> Cmd msg


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
