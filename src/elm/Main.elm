module Main exposing (..)

import Html exposing (..)
import Ports exposing (..)
import Router exposing (..)
import State exposing (..)
import Types exposing (..)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
