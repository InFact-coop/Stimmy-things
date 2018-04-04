module Views.CreateAvatar exposing (..)

import Helpers.Style exposing (backgroundImageStyle, classes, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Components.ChangeSkinColourButton exposing (changeSkinColourButton)
import Data.SkinColour exposing (avatarSkinColourSelection, logSrc)
import Types exposing (..)


createAvatar : Model -> Html Msg
createAvatar model =
    section [ class "smooth", horizontalTransition model ]
        [ header [ class "flex justify-between items-center pt2" ]
            [ div [ class "h3 w3" ] []
            , div []
                [ h1 [ class "f4 b green avenir center ma0 lh-f3 tc" ] [ text "My Stimmy friend" ]
                , h2 [ class "ma0 avenir fw2 f5 lh-f5 tc" ] [ text "Choose your avatar" ]
                ]
            , button
                [ classes [ "bg-transparent bn h3 w3" ]
                , backgroundImageStyle "./assets/CreateAvatar/done_green_small.svg" 100
                , onClick SelectAvatar
                ]
                []
            ]
        , div
            [ class "db makecarousel mv2" ]
            [ avatarCaroCell "./assets/CreateAvatar/avatar_1.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_2.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_3.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_4.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_5.svg"
            , avatarCaroCell "./assets/CreateAvatar/avatar_6.svg"
            ]
        , div []
            [ changeSkinColourButton (logSrc model.skinColour)
            ]
        ]


avatarCaroCell : String -> Html Msg
avatarCaroCell imgSrc =
    div [ class "carousel-cell vh-75" ]
        [ object
            [ id "avatar", attribute "data" imgSrc, type_ "image/svg+xml", classes [ "carousel-cell-image", "vh-75" ] ]
            []
        ]
