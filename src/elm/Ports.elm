port module Ports exposing (..)

import Time exposing (Time)
import Types exposing (..)


type alias DBLog =
    { timeTaken : Time
    , stimId : String
    , preFace : Int
    , postFace : Int
    , preFeelings : List String
    , postFeelings : List String
    , dateTime : Time
    }


port initCarousel : () -> Cmd msg


port saveLog : DBLog -> Cmd msg


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
