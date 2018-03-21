module Helpers.Animation exposing (..)

import TransitStyle exposing (..)
import Transit exposing (..)
import Ease exposing (..)


-- Views


fadeSliderX : Float -> Transition -> Style
fadeSliderX offset t =
    (slideInSlideOutX offset t) ++ (fade t)


slideInSlideOutX : Float -> Transition -> Style
slideInSlideOutX offset =
    compose (slideOutX offset) (slideInX offset)


slideInX : Float -> Float -> Style
slideInX offset v =
    (Ease.inCubic (1 - v))
        * offset
        |> translateXLeft


slideOutX : Float -> Float -> Style
slideOutX offset v =
    (Ease.outCubic (1 - v))
        * offset
        |> translateXRight


translateXRight : Float -> Style
translateXRight v =
    [ ( "transform", "translateX(-" ++ toString v ++ "px)" )
    ]


translateXLeft : Float -> Style
translateXLeft v =
    [ ( "transform", "translateX(" ++ toString v ++ "px)" )
    ]



-- Modals


fadeSliderY : Float -> Transition -> Style
fadeSliderY offset t =
    (slideInSlideOutY offset t) ++ (fade t)


slideInSlideOutY : Float -> Transition -> Style
slideInSlideOutY offset =
    compose (slideOutY offset) (slideInY offset)


slideInY : Float -> Float -> Style
slideInY offset v =
    (Ease.inCubic (1 - v))
        * offset
        |> translateYLeft


slideOutY : Float -> Float -> Style
slideOutY offset v =
    (Ease.outCubic (1 - v))
        * offset
        |> translateYRight


translateYRight : Float -> Style
translateYRight v =
    [ ( "transform", "translateY(-" ++ toString v ++ "px)" )
    ]


translateYLeft : Float -> Style
translateYLeft v =
    [ ( "transform", "translateY(" ++ toString v ++ "px)" )
    ]
