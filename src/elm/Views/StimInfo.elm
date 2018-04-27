module Views.StimInfo exposing (..)

import Helpers.Style exposing (backgroundImageCover, backgroundImageStyle, bodyFont, classes, headerFont, horizontalTransition, verticalTransition)
import Helpers.Utils exposing (ifThenElse, unionTypeToString, viewIf)
import Html exposing (..)
import Html.Attributes exposing (class, height, src, width)
import Html.Events exposing (onClick)
import Types exposing (..)


stimInfo : Model -> Html Msg
stimInfo model =
    div
        [ ifThenElse (model.stimInfoDestination == Landing) (horizontalTransition model) (verticalTransition model)
        , class "bg-washed-yellow black"
        ]
        [ viewIf (model.stimInfoDestination == Landing) <|
            div
                [ classes [ "h4 w4 pointer fixed br-100 z-1 right-1 bottom-0" ]
                , backgroundImageStyle "./assets/StimInfo/timer_icn_dark.svg" 100
                , onClick <| NavigateTo TimerPreparation
                ]
                []
        , div [ class "bg-green center tc" ]
            [ div [ class "flex flex-row items-center justify-center relative" ]
                [ div
                    [ class "absolute left-0 ml3 mt1 pointer"
                    , onClick <| NavigateTo model.stimInfoDestination
                    ]
                    [ img
                        [ src <|
                            ifThenElse (model.stimInfoDestination == Landing)
                                "./assets/TimerPreparation/back_btn_white.svg"
                                "./assets/stimInfo/close_btn_white.svg"
                        ]
                        []
                    ]
                , h1 [ classes [ headerFont, "white pt3 mb3" ] ] [ text <| model.selectedStim.stimName ]
                ]
            , button
                [ classes
                    [ "green br-pill pa1 pointer w5 mb4 bg-white bn"
                    , bodyFont
                    ]
                ]
                [ text <| unionTypeToString model.selectedStim.bodyPart ]
            ]
        , div [ class "flex flex-column items-center mb3" ]
            [ img [ src "./assets/StimInfo/divider_zigzag_grey_small.svg", class "pa2" ] []
            , img [ src "./assets/StimInfo/instruction_icn.svg" ] []
            , div [ class "b--black br2 ba tc w-90 pa3" ]
                [ h1 [ classes [ headerFont ] ] [ text "How to do this" ]
                , p [ classes [ bodyFont ] ] [ text <| model.selectedStim.instructions ]
                ]
            ]
        , viewIf (model.selectedStim.videoSrc /= Nothing) (videoSection model)
        , div [ class "h4" ] []
        ]


videoSection : Model -> Html Msg
videoSection model =
    div
        [ backgroundImageCover "./assets/AddStim/zigzag_stim_how_to_bg.svg"
        , class "flex flex-column items-center"
        ]
        [ img [ src "./assets/StimInfo/add_video_icn.svg", class "pt4" ] []
        , h1 [ classes [ headerFont, "mb3" ] ] [ text "Can this video help?" ]
        , div [ class "video-height" ]
            [ iframe [ width 300, height 188, src <| Maybe.withDefault "" model.selectedStim.videoSrc ] []
            ]
        ]
