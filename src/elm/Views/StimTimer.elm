module Views.StimTimer exposing (..)

import Components.Button exposing (rectButton)
import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


stimTimer : Model -> Html Msg
stimTimer model =
    div [ class "border-box bg-green flex-column tc white m-h-100", horizontalTransition model ]
        [ div [ class "relative flex flex-row ma3 mt0 mb4 items-center justify-between h" ]
            [ img [ onClick <| ChangeViewFromTimer StimPreparation, src "./assets/StimPreparation/back_btn_white.svg" ] []
            , p [ class <| "absolute ma0 left-0 right-0 white lh-f4 f4" ] [ text <| model.selectedStim.stimName ]
            , img [ onClick <| ChangeViewFromTimer StimInfo, src "./assets/Landing/menu-drawer/about_btn.svg" ] []
            ]
        , img [ class "mb5", src "./assets/StimTimer/white_divider_zigzag_thin.svg" ] []
        , img [ class "mb4", src "./assets/StimTimer/timer_icn.svg" ] []
        , div [ class "mb4 timer-font" ]
            [ span [] [ text <| (formatTimeFirstDigits (floor <| model.counter / 60)) ++ ":" ]
            , span [] [ text <| formatTimeSecondDigits (rem (round model.counter) 60) ]
            ]
        , div [ class "mh7 flex justify-between mb5" ]
            [ img [ onClick <| AdjustTimer Restart, src "./assets/StimTimer/timer_replay_btn.svg" ] []
            , img [ onClick <| AdjustTimer Start, src "./assets/StimTimer/timer_play_btn.svg" ] []
            , img [ onClick <| AdjustTimer Pause, src "./assets/StimTimer/timer_pause_btn.svg" ] []
            ]
        , img [ class "mb4", src "./assets/StimTimer/white_divider_zigzag_thin.svg" ] []
        , div []
            [ img [ onClick <| StopTimer, src "./assets/StimTimer/timer_done_btn.svg" ] []
            , p [ class "mt0 mb3 b" ] [ text "I'm feeling better!" ]
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
    case (String.length <| toString time) == 1 of
        True ->
            toString time ++ "0"

        False ->
            toString time
