module Components.Face exposing (..)

import Data.Face exposing (urlFromFace)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


face : LogStage -> Face -> Html Msg
face logStage face =
    div [ onClick <| ToggleFace logStage face ]
        [ img [ src (urlFromFace face) ] []
        ]
