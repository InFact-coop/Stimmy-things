module Views.StimTimer exposing (..)

import Components.Button exposing (rectButton)
import Html exposing (..)
import Types exposing (..)


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
        ]
