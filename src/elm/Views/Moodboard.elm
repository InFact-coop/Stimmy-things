module Views.Moodboard exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


moodboard : Model -> Html Msg
moodboard model =
    div [ horizontalTransition model ] [ text "moodboard" ]
