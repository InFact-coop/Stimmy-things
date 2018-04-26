module Components.Video exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


videoThumbnailStyle : String -> Int -> Attribute Msg
videoThumbnailStyle url sizePercent =
    style
        [ ( "background-image", "url(" ++ url ++ ")" )
        , ( "background-repeat", "no-repeat" )
        , ( "background-position", "center center" )
        , ( "background-size", "cover" )
        ]


videoYT : Video -> Html Msg
videoYT v =
    div
        [ class "link white dib pointer h5 w-90"
        , href <| vidIdToUrl v.id
        , videoThumbnailStyle v.thumbnail 100
        ]
        [ h2 [ class "white center f6 fw2 overflow-hidden" ] [ text v.title ]
        ]


vidIdToUrl : String -> String
vidIdToUrl id =
    "https://www.youtube.com/watch?v=" ++ id
