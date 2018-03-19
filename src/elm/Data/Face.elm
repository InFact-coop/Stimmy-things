module Data.Face exposing (..)

import Types exposing (..)


faces : List Face
faces =
    [ Face1, Face2, Face3, Face4, Face5 ]


faceToInt : Face -> Int
faceToInt face =
    case face of
        Face1 ->
            1

        Face2 ->
            2

        Face3 ->
            3

        Face4 ->
            4

        Face5 ->
            5
