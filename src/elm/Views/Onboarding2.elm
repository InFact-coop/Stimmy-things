module Views.Onboarding2 exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


onboarding2 : Model -> Html Msg
onboarding2 model =
    div [ horizontalTransition model ] [ text "Onboarding2" ]
