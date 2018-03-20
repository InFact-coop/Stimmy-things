module Views.StimTimer exposing (..)

import Components.Button exposing (rectButton)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Html.Events exposing (onClick)


stimTimer : Model -> Html Msg
stimTimer model =
    div []
        [ div []
            [ img [ src "./assets/Landing/menu-drawer/about_btn.svg" ] []
            ]
        , rectButton "<"
            (ChangeView StimPreparation)
        , div
            [ class "bg-green tc" ]
            [ img [ src "./assets/StimTimer/white_divider_zigzag_thin.svg" ] []
            , img [ src "./assets/StimTimer/timer_icn.svg" ] []
            , p [] [ text <| toString (floor <| model.counter / 60) ]
            , p [] [ text <| toString (rem (round model.counter) 60) ]
            , img [ onClick <| AdjustTimer Restart, src "./assets/StimTimer/timer_replay_btn.svg" ] []
            , img [ onClick <| AdjustTimer Start, src "./assets/StimTimer/timer_play_btn.svg" ] []
            , img [ onClick <| AdjustTimer Pause, src "./assets/StimTimer/timer_pause_btn.svg" ] []
            , img [ src "./assets/StimTimer/white_divider_zigzag_thin.svg" ] []
            ]
        , div [ ]
            [ img [ onClick <| StopTimer, src "./assets/StimTimer/timer_done_btn.svg" ] []
            ]

        -- , button [ onClick <| AdjustTimer Restart ] [ text "Restart" ]
        -- , button [ onClick <| AdjustTimer Start ] [ text "Start" ]
        -- , button [ onClick <| AdjustTimer Pause ] [ text "Pause" ]
        -- , button [ onClick <| StopTimer ] [ text "Done" ]
        ]
