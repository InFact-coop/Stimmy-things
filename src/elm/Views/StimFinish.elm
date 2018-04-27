module Views.StimFinish exposing (..)

import Components.Confetti exposing (confetti)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (backgroundImageCover, classes, headerFont, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


stimFinish : Model -> Html Msg
stimFinish model =
    div [ class "border-box bg-green flex-column items-center justify-between flex tc dark-gray mvh-100 minvh84", horizontalTransition model ]
        [ div [ classes [ headerFont, "flex white mh3 mv0 items-center justify-center h4" ] ]
            [ p
                []
                [ text <| model.selectedStim.stimName ]
            ]
        , div [ backgroundImageCover "./assets/StimFinish/background_card.svg", class "work-sans vh-82 w-90 pa2 mb3 flex flex-column items-center justify-center relative overflow-hidden" ]
            [ confetti model
            , object
                [ attribute "data" <| avatarHeadSelection model.avatar, type_ "image/svg+xml", class "timerFinishHead fromAboveWithDelay w-80 z-1" ]
                []
            , object
                [ attribute "data" <| "./assets/StimFinish/text.svg", class "w-80 z-1 fromBelowWithDelay mv3" ]
                []
            , object
                [ attribute "data" <| "./assets/StimFinish/ribbon.svg", type_ "image/svg+xml", class "w-30 z-1 fromBelowWithMuchDelay" ]
                []
            ]
        ]
