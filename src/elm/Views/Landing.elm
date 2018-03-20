module Views.Landing exposing (..)

import Helpers.Style exposing (..)
import Helpers.Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div [ class "flex flex-column justify-center items-center" ]
        [ header [ classes [ "flex", "justify-between", "items-center", "ph3", "vw-100" ] ]
            [ button
                [ classes [ "button", "bn", "h2", "w2", "bg-inherit" ]
                , backgroundImageStyle
                    (ifThenElse (model.showNav == Yes) "./assets/Landing/arrow-left-not-animated.svg" "./assets/Landing/menu-not-animated.svg")
                    100
                , onClick ToggleNav
                ]
                []
            , h1 [ class "f3" ] [ text model.avatarName ]
            , div [] []
            ]
        , object
            [ id "avatar", attribute "data" "assets/avatar_2.svg", type_ "image/svg+xml", classes [ "background-avatar" ] ]
            []
        , stimMenu model model.hotspots.head
        , stimMenu model model.hotspots.face
        , stimMenu model model.hotspots.shoulders
        , stimMenu model model.hotspots.chest
        , stimMenu model model.hotspots.arms
        , stimMenu model model.hotspots.belly
        , stimMenu model model.hotspots.hands
        , stimMenu model model.hotspots.legs
        , stimMenu model model.hotspots.feet
        , a [ classes [ "db", "h4", "w4", "fixed", "bottom-0" ], backgroundImageStyle "./assets/Landing/add_stim_btn.svg" 100, href "#add-stim" ] []
        ]


hotspotDiv : HotspotCoords -> Html Msg
hotspotDiv hotspot =
    div [ classes [ "br-100", "bg-light-blue-tp", "pointer", "flex", "items-center", "justify-center", "z-2", "show-child" ], style [ ( "width", toString hotspot.width ++ "px" ), ( "height", toString hotspot.height ++ "px" ) ], onClick <| ToggleStimMenu hotspot.name ]
        [ div [ classes [ "z-3", "h1", "w1", "br-100", "breathe", "bg-light-blue", "show-child" ] ] [] ]


stimMenu : Model -> HotspotCoords -> Html Msg
stimMenu model hotspot =
    div [ classes [ "absolute", ifThenElse (model.stimMenuShowing == Just hotspot.name) "z-4" "vis-hidden z-1" ], style [ ( "right", toString (hotspot.right) ++ "px" ), ( "top", toString (hotspot.top) ++ "px" ) ] ]
        (stimMenuItems model hotspot ++ [ addStimButton (hotspot.height + 32) ])


stimMenuItems : Model -> HotspotCoords -> List (Html Msg)
stimMenuItems model hotspot =
    extractStims hotspot.name model.stims
        |> List.map (stimToButton (hotspot.height + 32))
        |> (::) (stimTitle hotspot)


stimTitle : HotspotCoords -> Html Msg
stimTitle hotspot =
    div [ classes [ "mb1px", "br--right", "bg-white", "pa3", "flex", "justify-end", "items-center", "translucent" ], style [ ( "height", toString (hotspot.height + 32) ++ "px" ) ] ]
        [ div [ classes [ "mh6" ] ] [ h2 [ classes [] ] [ text <| unionTypeToString hotspot.name ] ], hotspotDiv hotspot ]


addStimButton : Float -> Html Msg
addStimButton height =
    button
        [ classes [ "translucent", "mb1px", "w-80", "flex", "items-center", "justify-center", "link", "work-sans-regular", "black", "pointer", "bn" ], style [ ( "height", toString height ++ "px" ) ], onClick (ChangeView AddStim) ]
        [ text "+ Add a stim!"
        ]


stimToButton : Float -> Stim -> Html Msg
stimToButton height stim =
    button
        [ classes [ "translucent", "mb1px", "w-80", "flex", "items-center", "justify-center", "link", "work-sans-regular", "black", "pointer", "bn" ], style [ ( "height", toString height ++ "px" ) ], onClick (ChangeView StimPreparation) ]
        [ text stim.stimName
        ]


extractStims : BodyPart -> List Stim -> List Stim
extractStims bodyPart stimList =
    List.filter (\n -> n.bodyPart == bodyPart) stimList
