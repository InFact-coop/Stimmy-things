module Views.Landing exposing (..)

import Data.Avatar exposing (avatarSelection)
import Helpers.Style exposing (..)
import Helpers.Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div [ class "flex flex-column items-center", horizontalTransition model ]
        [ header [ classes [ "flex relative justify-center items-center ph3 pv4 vw-100" ] ]
            [ button
                [ classes [ "button absolute left-0 ml3 bn h2 w2 bg-inherit" ]
                , backgroundImageStyle
                    (ifThenElse (model.showNav == Yes)
                        "./assets/Landing/arrow-left-not-animated.svg"
                        "./assets/Landing/menu-not-animated.svg"
                    )
                    100
                , onClick ToggleNav
                ]
                []
            , h1 [ class "f3 b" ] [ text model.avatarName ]
            ]
        , object
            [ id "avatar", attribute "data" (avatarSelection model.avatar), type_ "image/svg+xml", classes [ "background-avatar" ] ]
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
        , viewIf (model.hotspots.head.name /= NoBodyPart)
            (button
                [ classes [ "bn bg-transparent db h4 w4 fixed bottom-0 outline-0 z-2 pa0" ]
                , backgroundImageStyle "./assets/Landing/add_stim_btn.svg" 100
                , onClick <| AddStimWithoutBodyPart
                ]
                []
            )
        ]


hotspotDiv : Model -> HotspotCoords -> Html Msg
hotspotDiv model hotspot =
    div
        [ classes
            [ "br-100 bg-light-blue-tp pointer flex items-center justify-center show-child"
            , selectHotspotIndex model hotspot
            ]
        , style
            [ ( "width", toString (hotspot.width + 10) ++ "px" )
            , ( "height", toString (hotspot.height + 10) ++ "px" )
            ]
        , onClick <| ToggleStimMenu hotspot.name
        ]
        [ div [ classes [ selectHotspotIndex model hotspot, "h1 w1 br-100 breathe bg-light-blue show-child" ] ] [] ]


stimMenu : Model -> HotspotCoords -> Html Msg
stimMenu model hotspot =
    div
        [ classes
            [ "absolute"
            , ifThenElse (model.stimMenuShowing == Just hotspot.name) "flex flex-column" "vis-hidden"
            ]
        , style [ ( "right", toString hotspot.right ++ "px" ), ( "top", toString hotspot.top ++ "px" ) ]
        ]
        (stimMenuItems model hotspot ++ [ addStimButton model hotspot ])


stimMenuItems : Model -> HotspotCoords -> List (Html Msg)
stimMenuItems model hotspot =
    extractStims hotspot.name model.stims
        |> List.map (stimToButton model hotspot)
        |> (::) (stimTitle model hotspot)


stimTitle : Model -> HotspotCoords -> Html Msg
stimTitle model hotspot =
    div
        [ classes
            [ "relative mb1px br--right bg-white pa3 flex justify-end items-center translucent f4 b"
            , ifThenElse (model.stimMenuShowing == Just hotspot.name) "z-3" ""
            ]
        , style [ ( "height", toString (hotspot.height + 32) ++ "px" ) ]
        ]
        [ div [ classes [ "mh6" ] ] [ h2 [ classes [ "f3 b" ] ] [ text <| unionTypeToString hotspot.name ] ]
        , viewIf (hotspot.name /= NoBodyPart) (hotspotDiv model hotspot)
        ]


addStimButton : Model -> HotspotCoords -> Html Msg
addStimButton model hotspot =
    button
        [ classes
            [ "relative translucent mb1px w-80 work-sans-regular black pointer bn"
            , ifThenElse (model.stimMenuShowing == Just hotspot.name) "z-3" "tc f5 dn"
            , bodyFont
            ]
        , style [ ( "height", toString (hotspot.height + 32) ++ "px" ) ]
        , onClick (NavigateTo AddStim)
        ]
        [ text "+ Add a stim!" ]


stimToButton : Model -> HotspotCoords -> Stim -> Html Msg
stimToButton model hotspot stim =
    button
        [ classes
            [ "relative translucent mb1px w-80 link black  pointer bn"
            , bodyFont
            , ifThenElse (model.stimMenuShowing == Just hotspot.name) "z-3" "z-0 tc dn"
            ]
        , style [ ( "height", toString (hotspot.height + 32) ++ "px" ) ]
        , onClick (GoToStim stim)
        ]
        [ text stim.stimName ]


extractStims : BodyPart -> List Stim -> List Stim
extractStims bodyPart stimList =
    List.filter (\stim -> stim.bodyPart == bodyPart) stimList
