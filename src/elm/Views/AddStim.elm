module Views.AddStim exposing (..)

import Helpers.Style exposing (verticalTransition)
import Html exposing (..)
import Types exposing (..)


addStim : Model -> Html Msg
addStim model =
    div [ verticalTransition model ] [ text "Add Stim" ]
