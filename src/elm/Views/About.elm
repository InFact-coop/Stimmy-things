module Views.About exposing (..)

import Helpers.Style exposing (verticalTransition)
import Html exposing (..)
import Types exposing (..)


about : Model -> Html Msg
about model =
    div [ verticalTransition model ] [ text "About" ]
