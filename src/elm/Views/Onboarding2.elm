module Views.Onboarding2 exposing (..)

import Helpers.Style exposing (classes, headerFont, horizontalTransition, onBoardingFont)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


onboarding2 : Model -> Html Msg
onboarding2 model =
    div [ horizontalTransition model ]
        [ div [ class "mh6" ]
            [ img [ class "mt6 mb3", src "./assets/Onboarding/zigzag_green_onboarding.svg" ] []
            , img [ class "mb3", src "./assets/Onboarding/onboarding_2.svg" ] []
            , p [ classes [ headerFont, "m1 green tc mb1" ] ] [ text "Save anonymously into Stimmy Things" ]
            ]
        , p [ classes [ onBoardingFont, "mh3 mb3 black tc" ] ] [ text "No more forgetting exercises you found useful. Your stimmy friend will take care of them for you!" ]
        , div [ class "mh6 mb2 flex justify-center items-center" ]
            [ div [ class "mr1 dotSmaller bg-light-gray" ] []
            , div [ class "ml1 dotBigger bg-green" ] []
            ]
        , div [ class "pa4 bg-green flex justify-between" ]
            [ p [ onClick <| NavigateTo CreateAvatar, classes [ headerFont, "white" ] ] [ text "Skip" ]
            , p [ onClick <| NavigateTo CreateAvatar, classes [ headerFont, "white" ] ] [ text "Next" ]
            ]
        ]
