module Views.StimInfo exposing (..)

import Helpers.Style exposing (backgroundImageCover, bodyFont, classes, headerFont, verticalTransition)
import Helpers.Utils exposing (unionTypeToString, viewIf)
import Html exposing (..)
import Html.Attributes exposing (class, height, src, width)
import Html.Events exposing (onClick)
import Types exposing (..)


stimInfo : Model -> Html Msg
stimInfo model =
    div [ verticalTransition model, class "bg-washed-yellow black" ]
        [ div [ class "bg-green center tc" ]
            [ div [ class "flex flex-row items-center justify-center relative" ]
                [ div
                    [ class "absolute left-0 ml3 pointer"
                    , onClick <| NavigateTo model.stimInfoDestination
                    ]
                    [ img [ src "./assets/StimInfo/close_btn_white.svg" ] [] ]
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
        , div [ class "h5" ] []
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
