module Main exposing (..)

import Navigation exposing (program)
import State exposing (..)
import Router exposing (..)
import Types exposing (..)


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
