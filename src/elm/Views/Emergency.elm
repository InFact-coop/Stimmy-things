module Views.Emergency exposing (..)

import Helpers.Style exposing (verticalTransition)
import Types exposing (..)
import Html exposing (..)


emergency : Model -> Html Msg
emergency model =
    div [ verticalTransition model ] [ text "Emergency" ]
