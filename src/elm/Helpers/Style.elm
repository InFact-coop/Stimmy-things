module Helpers.Style exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


classes : List String -> Html.Attribute msg
classes classList =
    String.join " " classList
        |> class


backgroundImageStyle : String -> Int -> Attribute msg
backgroundImageStyle url sizePercent =
    style
        [ ( "background-image", "url(" ++ url ++ ")" )
        , ( "background-repeat", "no-repeat" )
        , ( "background-position", "center center" )
        , ( "background-size", toString sizePercent ++ "%" )
        ]


headerFont : String
headerFont =
    "f4 lh-f4 wellcome"


bodyFont : String
bodyFont =
    "f5 lh-f5 work-sans"


smallFont : String
smallFont =
    "f6 lh-f6 work-sans"


smallFontWellcome : String
smallFontWellcome =
    "f6 lh-f6 wellcome"


extraSmallFont : String
extraSmallFont =
    "f7 lh-f7 work-sans"
