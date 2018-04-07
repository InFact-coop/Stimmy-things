module Views.Definition exposing (..)

import Helpers.Style exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Types exposing (..)


definition : Model -> Html Msg
definition model =
    div [ class "flex flex-column justify-center h-100 bg-washed-yellow relative", horizontalTransition model ]
        [ div [ class "absolute top-0 center flex justify-center w-100" ]
            [ img [ class "mv3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
            ]
        , div [ backgroundImageCover "./assets/AddStim/zigzag_stim_how_to_bg.svg", class "pa4 mb5" ]
            [ p [ classes [ headerFont, "green mb1" ] ] [ text "stim" ]
            , p [ classes [ extraSmallFont ] ] [ text "\\'stim\\" ]
            , p [ classes [ extraSmallFont, "mt3" ] ] [ text "noun" ]
            , div [ class "mt3 flex" ]
                [ p [ classes [ smallFont, "mr2" ] ] [ text "1." ]
                , p [ classes [ smallFont ] ] [ text "an exercise which triggers sensations in your body to help you refocus and stay calm when you’re feeling stressed" ]
                ]
            , div [ class "mt3 flex" ]
                [ p [ classes [ smallFont, "mr2" ] ] [ text "2." ]
                , p [ classes [ smallFont ] ] [ text "an action done with a specific body part that helps you stay alert, on task, and focused" ]
                ]
            ]
        , div [ class "absolute bottom-0 w-100" ]
            [ div [ class "mh6 mb2 flex justify-center items-center" ]
                [ div [ class "mh1 dotBigger bg-green" ] []
                , div [ class "mh1 dotSmaller bg-light-gray" ] []
                , div [ class "mh1 dotSmaller bg-light-gray" ] []
                ]
            , div [ class "pa4 bg-green flex justify-between" ]
                [ p [ onClick <| NavigateTo CreateAvatar, classes [ headerFont, "white" ] ] [ text "Skip" ]
                , p [ onClick <| NavigateTo OnboardingFirst, classes [ headerFont, "white" ] ] [ text "Next" ]
                ]
            ]
        ]
