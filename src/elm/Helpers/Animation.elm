module Helpers.Animation exposing (..)

import TransitStyle exposing (..)
import Transit exposing (..)
import Ease exposing (..)


fadeSlider : Float -> Transition -> Style
fadeSlider offset t =
    (slideInSlideOut offset t) ++ (fade t)


slideInSlideOut : Float -> Transition -> Style
slideInSlideOut offset =
    compose (newSlideOut offset) (newSlideIn offset)


newSlideIn : Float -> Float -> Style
newSlideIn offset v =
    (Ease.inCubic (1 - v))
        * offset
        |> translateX


newSlideOut : Float -> Float -> Style
newSlideOut offset v =
    (Ease.outCubic (1 - v))
        * offset
        |> newTranslateX


newTranslateX : Float -> Style
newTranslateX v =
    [ ( "transform", "translateX(-" ++ toString v ++ "px)" )
    ]


translateX : Float -> Style
translateX v =
    [ ( "transform", "translateX(" ++ toString v ++ "px)" )
    ]
