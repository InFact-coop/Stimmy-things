module Views.CreateAvatar exposing (..)

import Helpers.Style exposing (classes, backgroundImageStyle, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


createAvatar : Model -> Html Msg
createAvatar model =
    section [ class "smooth", horizontalTransition model ]
        [ header [ class "flex justify-between items-center pt2" ] [ div [ class "h3 w3" ] [], div [] [ h1 [ class "f4 b green avenir center ma0 lh-f3 tc" ] [ text "My Stimmy friend" ], h2 [ class "ma0 avenir fw2 f5 lh-f5 tc" ] [ text "Choose your avatar" ] ], button [ classes [ "bg-transparent", "bn", "h3", "w3" ], backgroundImageStyle "./assets/CreateAvatar/done_green_small.svg" 100, onClick SelectAvatar ] [] ]
        , div
            [ class "db makecarousel mv2" ]
            [ avatarCaroCell "./assets/CreateAvatar/avatar_1.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_2.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_3.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_4.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_5.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_6.svg"
            ]
        ]


avatarCaroCell : String -> Html Msg
avatarCaroCell imgSrc =
    img [ class "carousel-cell-image vh-75", attribute "data-flickity-lazyload" imgSrc, src imgSrc ] []
