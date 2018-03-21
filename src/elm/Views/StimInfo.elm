module Views.StimInfo exposing (..)

import Helpers.Style exposing (verticalTransition)
import Html exposing (..)
import Types exposing (..)


stimInfo : Model -> Html Msg
stimInfo model =
    div [ verticalTransition model ] [ text "stimInfo" ]
