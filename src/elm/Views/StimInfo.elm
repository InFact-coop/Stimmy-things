module Views.StimInfo exposing (..)

import Data.BodyPart exposing (bodyPartToString)
import Html exposing (..)
import Html.Attributes exposing (class, height, src, width)
import Helpers.Style exposing (backgroundImageCover, bodyFont, classes, headerFont, verticalTransition)
import Html exposing (..)
import Html.Attributes exposing (class, src, height, width)
import Types exposing (..)


stimInfo : Model -> Html Msg
stimInfo model =
    div [ verticalTransition model, class "bg-washed-yellow" ]
        [ div [ class "bg-green center tc" ]
            [ h1 [ classes [ headerFont, "white pt3 mb3" ] ] [ text <| model.selectedStim.stimName ]
            , button
                [ classes
                    [ "green br-pill pa1 pointer w5 mb4 bg-white bn"
                    , bodyFont
                    ]
                ]
                [ text <| bodyPartToString model.selectedStim.bodyPart ]
            ]
        , div [ class "flex flex-column items-center mb3" ]
            [ img [ src "./assets/StimInfo/divider_zigzag_grey_small.svg", class "pa2" ] []
            , img [ src "./assets/StimInfo/instruction_icn.svg" ] []
            , div [ class "b--black ba tc w-90 pa3" ]
                [ h1 [ classes [ headerFont ] ] [ text "How to do this" ]
                , p [ classes [ bodyFont ] ] [ text <| model.selectedStim.instructions ]
                ]
            ]
        , div
            [ backgroundImageCover "./assets/AddStim/zigzag_stim_how_to_bg.svg"
            , class "flex flex-column items-center fit-content"
            ]
            [ img [ src "./assets/StimInfo/add_video_icn.svg", class "pt4" ] []
            , h1 [ classes [ headerFont, "mb3" ] ] [ text "Can this video help?" ]
            , div [ class "video-height" ]
                [ iframe [ width 300, height 188, src <| Maybe.withDefault "" model.selectedStim.videoSrc ] []
                ]
            ]
        , div [ class "h5" ] []
        ]
