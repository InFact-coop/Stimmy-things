module Views.StimTimer exposing (..)

import Helpers.Style exposing (horizontalTransition, headerFont, classes)
import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


stimTimer : Model -> Html Msg
stimTimer model =
    div [ class "border-box bg-green flex flex-column tc white fill-screen", horizontalTransition model ]
        [ div [ classes [ headerFont, "flex flex-row ma3 mt0 mb0 items-center justify-between h" ] ]
            [ div
                [ onClick <| ChangeViewFromTimer StimPreparation
                , class "h4 w3 flex items-centre justify-left"
                ]
                [ img [ src "./assets/StimPreparation/back_btn_white.svg" ] [] ]
            , p [ class <| "ma0 left-0 right-0 white lh-f4 f4 mw4" ] [ text <| model.selectedStim.stimName ]
            , div
                [ onClick NavigateToStimInfo
                , class "h4 w3 flex items-centre justify-right"
                ]
                [ img [ src "./assets/Landing/menu-drawer/about_btn.svg" ] [] ]
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
            , p [ class "mt0 mb4 b" ] [ text "I'm feeling better!" ]
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
    ifThenElse ((String.length <| toString time) == 1) (toString time ++ "0") (toString time)
