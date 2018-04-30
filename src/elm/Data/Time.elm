module Data.Time exposing (..)

import Types exposing (..)


adjustTime : TimerControl -> Model -> Model
adjustTime control model =
    case control of
        Stop ->
            { model | timerStatus = Stopped }

        Pause ->
            { model | timerStatus = Paused }

        Start ->
            { model | timerStatus = Started, counter = model.counter - 1 }

        Restart ->
            { model
                | counter = model.timeSelected
                , svgClockTime = model.timeSelected
                , timerStatus = Stopped
            }


timerStatusToClockStyle : Model -> String
timerStatusToClockStyle model =
    case model.timerStatus of
        Stopped ->
            ""

        Paused ->
            "animation: timer "
                ++ toString model.svgClockTime
                ++ "s linear forwards paused;"

        Started ->
            "animation: timer "
                ++ toString model.svgClockTime
                ++ "s linear forwards running;"


trackCounter : Model -> Model
trackCounter model =
    if model.counter > 0 then
        { model | counter = model.counter - 1 }
    else
        model
