module Views.Landing exposing (..)

import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landing : Model -> Html Msg
landing model =
    div []
        [ object
            [ id "avatar", attribute "data" "assets/avatar_2.svg", type_ "image/svg+xml", classes [ "background-avatar" ] ]
            []
        , div [ classes [ "br-100", "bg-light-blue", "absolute" ], style [ ( "left", toString model.head.left ++ "px" ), ( "top", toString model.head.top ++ "px" ), ( "width", toString model.head.width ++ "px" ), ( "height", toString model.head.height ++ "px" ) ] ]
            []
        ]
