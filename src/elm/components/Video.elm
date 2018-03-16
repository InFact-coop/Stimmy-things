module Components.Video exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


backgroundImageStyle : String -> Int -> Attribute Msg
backgroundImageStyle url sizePercent =
    style [ ( "background-image", "url(" ++ url ++ ")" ), ( "background-repeat", "no-repeat" ), ( "background-position", "center center" ), ( "background-size", toString sizePercent ++ "%" ) ]


videoYT : Video -> Html Msg
videoYT v =
    a [ class "link white dib h-45 w5 pointer", href <| vidIdToUrl v.id, backgroundImageStyle v.thumbnail 100 ]
        [ h2 [ class "white center" ] [ text v.title ]
        ]


vidIdToUrl : String -> String
vidIdToUrl id =
    "https://www.youtube.com/watch?v=" ++ id
