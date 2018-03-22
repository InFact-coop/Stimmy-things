module Views.Onboarding1 exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Helpers.Style exposing (classes, headerFont)
import Types exposing (..)


onboarding1 : Model -> Html Msg
onboarding1 model =
    div [ horizontalTransition model ]
        [ div [ class "mh6" ]
            [ img [ class "mt7 mb3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
            , img [ class "mb3", src "./assets/Onboarding/onboarding_1.svg" ] []
            , p [ classes [ headerFont, "m1 green tc mb3" ] ] [ text "Find out what works best for you" ]
            ]
        , p [ class " mh3 mb3 onboardingFont black tc" ] [ text "Capture helpful exercises to help you deal better with ADHD. Get a clear overview of what works best for you over time." ]
        , div [ class "mh6 mb4 flex justify-center items-center" ]
            [ div [ class "mr1 dotBigger bg-green" ] []
            , div [ class "ml1 dotSmaller bg-light-gray" ] []
            ]
        , div [ class "pa5 bg-green flex justify-between" ]
            [ p [ onClick <| NavigateTo Landing, classes [ headerFont, "white" ] ] [ text "Skip" ]
            , p [ onClick <| NavigateTo OnboardingSecond, classes [ headerFont, "white" ] ] [ text "Next" ]
            ]
        ]
