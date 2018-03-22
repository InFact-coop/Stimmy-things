module Views.CreateAvatar exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


createAvatar : Model -> Html Msg
createAvatar model =
    section [ class "smooth", horizontalTransition model ]
        [ header [ class "flex justify-center flex-column items-center pt3 ph3 pb2" ] [ h1 [ class "f3 b green avenir center ma0 lh-f3" ] [ text "My Stimmy friend" ], h2 [ class "ma0 avenir fw2 f5 lh-f5" ] [ text "Choose your avatar" ] ]
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
    img [ class "carousel-cell-image", attribute "data-flickity-lazyload" imgSrc ] []
