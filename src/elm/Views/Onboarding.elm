module Views.Onboarding exposing (..)

import Helpers.Style exposing (..)
import Helpers.Utils exposing (ifThenElse, viewIf)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


onboarding : Model -> Html Msg
onboarding model =
    div [ horizontalTransition model, class "vh-100" ]
        [ div [ class "onboardingCarousel" ]
            [ div [ class "ph3 onboarding-carocell items-center flex flex-column justify-around" ]
                [ img [ class "mv3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
                , img [ class "mb3 w6", src "./assets/Onboarding/onboarding_1.svg" ] []
                , p [ classes [ headerFont, "m1 green tc mb1" ] ] [ text "Find out what works best for you" ]
                , p [ classes [ onBoardingFont, "mh3 mb3 black tc" ] ] [ text "Capture helpful exercises to help you deal better with ADHD. Get a clear overview of what works best for you over time." ]
                ]
            , div [ class "ph3 flex flex-column justify-around onboarding-carocell items-center" ]
                [ img [ class "mv3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
                , img [ class "mb3 w6", src "./assets/Onboarding/onboarding_2.svg" ] []
                , p [ classes [ headerFont, "m1 green tc mb1" ] ] [ text "Save anonymously into Stimmy Things" ]
                , p [ classes [ onBoardingFont, "mh3 mb3 black tc" ] ] [ text "No more forgetting exercises you found useful. Your stimmy friend will take care of them for you!" ]
                ]
            , div [ class "flex flex-column ph3 pb4 justify-around onboarding-carocell items-center" ]
                [ img [ class "mv3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ]
                    []
                , div []
                    [ img [ class "mb3 w6", src "./assets/Onboarding/onboarding_3.svg" ] []
                    , div
                        [ class "tc" ]
                        [ p [ classes [ headerFont, "green mb1" ] ] [ text "stim" ]
                        , p [ classes [ smallFont ] ] [ text "\\'stim\\ - noun" ]
                        ]
                    ]
                , div []
                    [ p [ classes [ smallFont, "tc mb3" ] ] [ text "1. an exercise which triggers sensations in your body to help you refocus and stay calm when you’re feeling stressed" ]
                    , p [ classes [ smallFont, "tc" ] ] [ text "2. an action done with a specific body part that helps you stay alert, on task, and focused" ]
                    ]
                ]
            ]
        , div
            [ class "pa4 bg-green flex justify-between w-100 bottom-0 absolute" ]
            [ p [ classes [ headerFont, "white", "onboarding--back", "pointer" ] ] [ text "Back" ]
            , p
                [ classes [ headerFont, "white", "onboarding--next", "pointer", ifThenElse model.lastOnboarding "dn" "" ] ]
                [ text <| "Next" ]
            , viewIf model.lastOnboarding <|
                p
                    [ classes [ headerFont, "white", "pointer" ], onClick <| NavigateTo CreateAvatar ]
                    [ text <| "Finish" ]
            ]
        ]
