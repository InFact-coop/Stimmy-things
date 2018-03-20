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
            { model | timerStatus = Started }

        Restart ->
            { model | counter = model.timeSelected, timerStatus = Stopped }


trackCounter : Model -> Model
trackCounter model =
    if model.counter > 0 then
        { model | counter = model.counter - 1 }
    else
        model
