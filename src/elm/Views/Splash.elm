module Views.Splash exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


splash : Model -> Html Msg
splash model =
    div
        [ class "fill-screen"
        , style
            [ ( "background-image", "url(./assets/Splash/Stimmy-splash-GIF.gif)" )
            , ( "background-size", "cover" )
            , ( "background-position", "center center" )
            ]
        , horizontalTransition model
        ]
        []
