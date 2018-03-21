module Views.Blog exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


blog : Model -> Html Msg
blog model =
    div [ horizontalTransition model ] [ text "Blog" ]
