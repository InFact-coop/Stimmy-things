module Views.Landing exposing (..)

import Helpers.Util exposing (..)
import Helpers.Style exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div [ class "flex flex-column justify-center items-center" ]
        [ header [ classes [ "flex", "justify-between", "items-center", "ph2", "vw-100" ] ]
            [ button
                [ classes [ "button", "bn", "h2", "w2", "bg-inherit" ]
                , backgroundImageStyle
                    (ifThenElse (model.showNav == Yes) "./assets/Landing/arrow-left-not-animated.svg" "./assets/Landing/menu-not-animated.svg")
                    100
                , onClick ToggleNav
                ]
                []
            , h1 [] [ text model.avatarName ]
            , div [] []
            ]
        , object
            [ id "avatar", attribute "data" "assets/avatar_2.svg", type_ "image/svg+xml", classes [ "background-avatar" ] ]
            []
        , hotspotDiv model.hotspots.head
        , hotspotDiv model.hotspots.face
        , hotspotDiv model.hotspots.shoulders
        , hotspotDiv model.hotspots.chest
        , hotspotDiv model.hotspots.arms
        , hotspotDiv model.hotspots.belly
        , hotspotDiv model.hotspots.hands
        , hotspotDiv model.hotspots.legs
        , hotspotDiv model.hotspots.feet
        ]


hotspotDiv : HotspotCoords -> Html Msg
hotspotDiv hotspot =
    div [ classes [ "br-100", "bg-light-blue-tp", "pointer", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString hotspot.left ++ "px" ), ( "top", toString hotspot.top ++ "px" ), ( "width", toString hotspot.width ++ "px" ), ( "height", toString hotspot.height ++ "px" ) ] ]
        [ div [ classes [ "h1", "w1", "br-100", "breathe", "bg-light-blue" ] ] [] ]
