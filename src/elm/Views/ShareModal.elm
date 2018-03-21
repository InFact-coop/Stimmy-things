module Views.ShareModal exposing (..)

import Helpers.Style exposing (verticalTransition)
import Html exposing (..)
import Types exposing (..)


shareModal : Model -> Html Msg
shareModal model =
    div [ verticalTransition model ] [ text "shareModal" ]
