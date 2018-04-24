module Components.Clock exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)


clock : Svg msg
clock =
    svg [ id "clock", viewBox "-10 -10 220 220" ]
        [ circle [ cx "100", cy "100", fill "#6698a5", id "timerbg", r "94" ]
            []
        , circle [ cx "100", cy "100", fill "#6698a5", id "timer", r "95" ]
            []
        ]
