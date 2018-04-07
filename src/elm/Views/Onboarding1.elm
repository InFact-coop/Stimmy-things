module Views.Onboarding1 exposing (..)

import Helpers.Style exposing (classes, headerFont, horizontalTransition, onBoardingFont)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


onboarding1 : Model -> Html Msg
onboarding1 model =
    div [ horizontalTransition model ]
        [ div [ class "mh6 flex flex-column items-center" ]
            [ img [ class "mv3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
            , img [ class "mb3 w-5", src "./assets/Onboarding/onboarding_1.svg" ] []
            , p [ classes [ headerFont, "m1 green tc mb1" ] ] [ text "Find out what works best for you" ]
            ]
        , p [ classes [ onBoardingFont, "mh3 mb3 black tc" ] ] [ text "Capture helpful exercises to help you deal better with ADHD. Get a clear overview of what works best for you over time." ]
        , div [ class "mh6 mb2 flex justify-center items-center h1" ]
            [ div [ class "mh1 dotSmaller bg-light-gray" ] []
            , div [ class "mh1 dotBigger bg-green" ] []
            , div [ class "mh1 dotSmaller bg-light-gray" ] []
            ]
        , div [ class "pa4 bg-green flex justify-between" ]
            [ p [ onClick <| NavigateTo CreateAvatar, classes [ headerFont, "white" ] ] [ text "Skip" ]
            , p [ onClick <| NavigateTo OnboardingSecond, classes [ headerFont, "white" ] ] [ text "Next" ]
            ]
        ]
