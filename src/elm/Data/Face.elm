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


urlFromFace : Face -> String
urlFromFace face =
    case face of
        Face1 ->
            "./assets/StimPreparation/face_1.svg"

        Face2 ->
            "./assets/StimPreparation/face_2.svg"

        Face3 ->
            "./assets/StimPreparation/face_3.svg"

        Face4 ->
            "./assets/StimPreparation/face_4.svg"

        Face5 ->
            "./assets/StimPreparation/face_5.svg"
