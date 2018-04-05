module Components.ChangeSkinColourButton exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Types exposing (..)


changeSkinColourButton : String -> Html Msg
changeSkinColourButton imageSrc =
    div [ class "absolute right-1 bottom-0" ]
        [ img [ onClick ChangeSkinColour, src imageSrc ] []
        ]
