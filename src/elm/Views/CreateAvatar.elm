module Views.CreateAvatar exposing (..)

import Helpers.Style exposing (backgroundImageStyle, classes, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
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
            , div [ class "mh3" ]
                [ img [ class "pa4", onClick ChangeSkinColour, src <| logSrc model.skinColour ] []
                ]
            ]
        ]


avatarCaroCell : String -> Html Msg
avatarCaroCell imgSrc =
    div [ class "carousel-cell vh-75" ]
        [ object
            [ id "avatar", attribute "data" imgSrc, type_ "image/svg+xml", classes [ "carousel-cell-image", "vh-75" ] ]
            []
        ]


logSrc : SkinColour -> String
logSrc skinColour =
    let
        log =
            Debug.log "src" (avatarSkinColourSelection skinColour)
    in
        avatarSkinColourSelection skinColour


avatarSkinColourSelection : SkinColour -> String
avatarSkinColourSelection skinColour =
    case skinColour of
        SkinColour1 ->
            "./assets/CreateAvatar/paint_btn_1.svg"

        SkinColour2 ->
            "./assets/CreateAvatar/paint_btn_2.svg"

        SkinColour3 ->
            "./assets/CreateAvatar/paint_btn_3.svg"

        SkinColour4 ->
            "./assets/CreateAvatar/paint_btn_4.svg"

        SkinColour5 ->
            "./assets/CreateAvatar/paint_btn_5.svg"

        SkinColour6 ->
            "./assets/CreateAvatar/paint_btn_6.svg"

        SkinColour7 ->
            "./assets/CreateAvatar/paint_btn_7.svg"

        _ ->
            "./assets/CreateAvatar/paint_btn_7.svg"



-- SkinColour8 ->
--     "./assets/CreateAvatar/paint_btn_8.svg"
-- SkinColour9 ->
--     "./assets/CreateAvatar/paint_btn_9.svg"
-- SkinColour10 ->
--     "./assets/CreateAvatar/paint_btn_10.svg"
-- SkinColour11 ->
--     "./assets/CreateAvatar/paint_btn_11.svg"
-- SkinColour12 ->
--     "./assets/CreateAvatar/paint_btn_12.svg"
-- SkinColour13 ->
--     "./assets/CreateAvatar/paint_btn_13.svg"
-- SkinColour14 ->
--     "./assets/CreateAvatar/paint_btn_14.svg"
