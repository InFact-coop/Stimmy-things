module Views.Timer exposing (..)

import Components.Clock exposing (clock)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (backgroundImageStyle, classes, headerFont, horizontalTransition)
import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


timer : Model -> Html Msg
timer model =
    div [ class "border-box bg-green flex flex-column tc white fill-screen", horizontalTransition model ]
        [ div [ class "mvh-100 flex flex-column justify-between" ]
            [ div [ classes [ headerFont, "flex flex-row mh2 mt2 items-center justify-between" ] ]
                [ div
                    [ class "w3 h3 flex items-center justify-center"
                    , onClick <| NavigateTo TimerPreparation
                    ]
                    [ img [ src "./assets/TimerPreparation/back_btn_white.svg" ] [] ]
                , p [ class <| "white lh-f4 f4 mw4" ]
                    [ text <| model.selectedStim.stimName ]
                , div
                    [ class "w3 h3 items-center justify-center flex"
                    , onClick NavigateToStimInfo
                    ]
                    [ img [ src "./assets/Landing/menu-drawer/about_btn.svg" ] [] ]
                ]
            , img [ class "", src "./assets/Timer/white_divider_zigzag_thin.svg" ] []
            , div []
                [ div [ class "timer-font" ]
                    [ span [] [ text <| (formatTimeFirstDigits (floor <| model.counter / 60)) ++ ":" ]
                    , span [] [ text <| formatTimeSecondDigits (rem (round model.counter) 60) ]
                    ]
                , div [ class "w-60 center relative" ]
                    [ clock model
                    , object
                        [ attribute "data" <| avatarHeadSelection model.avatar
                        , type_ "image/svg+xml"
                        , class "timerHead w-70 absolute absolute-center"
                        ]
                        []
                    ]
                , div [ class "mh7 flex justify-around" ]
                    [ div [ class "h4 flex flex-column justify-between" ]
                        [ img [ onClick <| AdjustTimer Restart, src "./assets/Timer/timer_replay_btn.svg" ] []
                        , p [] [ text "Restart" ]
                        ]
                    , displayPlayOrPause model.timerStatus
                    ]
                ]
            , img [ class "mb3", src "./assets/Timer/white_divider_zigzag_thin.svg" ] []
            , div [ class "w-100" ]
                [ img [ onClick <| StopTimer, src "./assets/Timer/timer_done_btn.svg", class "w3" ] []
                , p [ class "mt0 mb3 b" ] [ text "I'm feeling better!" ]
                ]
            ]
        ]


formatTimeFirstDigits : Int -> String
formatTimeFirstDigits time =
    case (String.length <| toString time) == 1 of
        True ->
            "0" ++ toString time

        False ->
            toString time


formatTimeSecondDigits : Int -> String
formatTimeSecondDigits time =
    ifThenElse ((String.length <| toString time) == 1) ("0" ++ toString time) (toString time)


displayPlayOrPause : TimerStatus -> Html Msg
displayPlayOrPause timerstatus =
    case timerstatus of
        Started ->
            div [ class "h4 flex flex-column justify-between" ]
                [ img [ onClick <| AdjustTimer Pause, src "./assets/Timer/timer_pause_btn.svg" ] []
                , p [] [ text "Pause" ]
                ]

        Stopped ->
            div [ class "h4 flex flex-column justify-between" ]
                [ img [ onClick <| AdjustTimer Start, src "./assets/Timer/timer_play_btn.svg" ] []
                , p [] [ text "Start" ]
                ]

        Paused ->
            div [ class "h4 flex flex-column justify-between" ]
                [ img [ onClick <| AdjustTimer Start, src "./assets/Timer/timer_play_btn.svg" ] []
                , p [] [ text "Start" ]
                ]
