module Views.NameAvatar exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


nameAvatar : Model -> Html Msg
nameAvatar model =
    div [ horizontalTransition model ] [ text "Name Avatar" ]
