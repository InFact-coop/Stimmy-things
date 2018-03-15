module Views.Landing exposing (..)

import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div []
        [ object
            [ id "avatar", attribute "data" "assets/avatar_2.svg", type_ "image/svg+xml", classes [ "background-avatar" ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.head.left ++ "px" ), ( "top", toString model.hotspots.head.top ++ "px" ), ( "width", toString model.hotspots.head.width ++ "px" ), ( "height", toString model.hotspots.head.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.face.left ++ "px" ), ( "top", toString model.hotspots.face.top ++ "px" ), ( "width", toString model.hotspots.face.width ++ "px" ), ( "height", toString model.hotspots.face.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ id "shoulders", classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.shoulders.left ++ "px" ), ( "top", toString model.hotspots.shoulders.top ++ "px" ), ( "width", toString model.hotspots.shoulders.width ++ "px" ), ( "height", toString model.hotspots.shoulders.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.chest.left ++ "px" ), ( "top", toString model.hotspots.chest.top ++ "px" ), ( "width", toString model.hotspots.chest.width ++ "px" ), ( "height", toString model.hotspots.chest.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.arms.left ++ "px" ), ( "top", toString model.hotspots.arms.top ++ "px" ), ( "width", toString model.hotspots.arms.width ++ "px" ), ( "height", toString model.hotspots.arms.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.belly.left ++ "px" ), ( "top", toString model.hotspots.belly.top ++ "px" ), ( "width", toString model.hotspots.belly.width ++ "px" ), ( "height", toString model.hotspots.belly.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.hands.left ++ "px" ), ( "top", toString model.hotspots.hands.top ++ "px" ), ( "width", toString model.hotspots.hands.width ++ "px" ), ( "height", toString model.hotspots.hands.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.legs.left ++ "px" ), ( "top", toString model.hotspots.legs.top ++ "px" ), ( "width", toString model.hotspots.legs.width ++ "px" ), ( "height", toString model.hotspots.legs.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        , div [ classes [ "br-100", "bg-light-blue-tp", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString model.hotspots.feet.left ++ "px" ), ( "top", toString model.hotspots.feet.top ++ "px" ), ( "width", toString model.hotspots.feet.width ++ "px" ), ( "height", toString model.hotspots.feet.height ++ "px" ) ] ]
            [ div [ classes [ "h1", "w1", "br-100", "bg-light-blue" ] ] [] ]
        ]


hotspotDiv : HotspotCoords -> Html Msg
hotspotDiv hotspot =
    div [ classes [ "br-100", "bg-light-blue", "absolute", "flex", "items-center", "justify-center" ], style [ ( "left", toString hotspot.left ++ "px" ), ( "top", toString hotspot.top ++ "px" ), ( "width", toString hotspot.width ++ "px" ), ( "height", toString hotspot.height ++ "px" ) ] ]
        []
