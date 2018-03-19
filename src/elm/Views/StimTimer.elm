module Views.StimTimer exposing (..)

import Components.Button exposing (rectButton)
import Html exposing (..)
import Types exposing (..)
import Html.Events exposing (onClick)


stimTimer : Model -> Html Msg
stimTimer model =
    div []
        [ rectButton "<"
            (ChangeView StimPreparation)
        , div
            []
            [ p [] [ text <| toString (floor <| model.counter / 60) ]
            , p [] [ text <| toString (rem (round model.counter) 60) ]
            ]
        , button [ onClick <| AdjustTimer Restart ] [ text "Restart" ]
        , button [ onClick <| AdjustTimer Start ] [ text "Start" ]
        , button [ onClick <| AdjustTimer Pause ] [ text "Pause" ]
        , button [ onClick <| StopTimer ] [ text "Done" ]
        ]
