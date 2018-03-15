module Views.CreateAvatar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Helpers exposing (..)
import Types exposing (..)


createAvatar : Model -> Html Msg
createAvatar model =
    section [ class "smooth" ]
        [ div [ class "flex justify-center flex-column items-center" ] [ h1 [ class "f3 green avenir center ma0" ] [ text "My Stimmy friend" ], h2 [ class "ma0 avenir fw2 f4" ] [ text "Choose your avatar" ] ]
        , div
            [ class "db makecarousel mv2" ]
            [ div [ class "carousel-cell br4", backgroundImageStyle "./assets/avatar.svg" 100 ] []
            , div [ class "carousel-cell br4", backgroundImageStyle "./assets/avatar.svg" 100 ] []
            , div [ class "carousel-cell br4", backgroundImageStyle "./assets/avatar.svg" 100 ] []
            , div [ class "carousel-cell br4", backgroundImageStyle "./assets/avatar.svg" 100 ] []
            ]
        ]
