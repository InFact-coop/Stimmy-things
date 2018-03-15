module Views.Landing exposing (..)

import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div []
        [ text "Landing"
        , object
            [ id "avatar", attribute "data" "assets/avatar_2.svg", type_ "image/svg+xml", classes [ "background-avatar" ] ]
            [ div [ classes [ "br-100", "w2", "h2", "bg-light-blue" ] ]
                []
            ]
        ]
