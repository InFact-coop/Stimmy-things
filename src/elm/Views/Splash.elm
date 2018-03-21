module Views.Splash exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Types exposing (..)
import Html exposing (..)


splash : Model -> Html Msg
splash model =
    div [ horizontalTransition model ] [ text "Splash" ]
