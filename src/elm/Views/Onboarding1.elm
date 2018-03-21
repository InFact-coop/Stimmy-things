module Views.Onboarding1 exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


onboarding1 : Model -> Html Msg
onboarding1 model =
    div [ horizontalTransition model ] [ text "Onboarding1" ]
