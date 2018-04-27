module Components.Clock exposing (..)

import Data.Time exposing (timerStatusToClockStyle)
import Svg exposing (..)
import Svg.Attributes as Attributes exposing (..)
import Types exposing (..)


clock : Model -> Svg msg
clock model =
    svg [ class "clock w-100", viewBox "-10 -10 220 220" ]
        [ circle
            [ cx "100"
            , cy "100"
            , class "timer"
            , r "95"
            , Attributes.style <| timerStatusToClockStyle model
            ]
            []
        ]
