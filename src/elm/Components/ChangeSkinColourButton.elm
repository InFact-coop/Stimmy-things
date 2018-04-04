module Components.ChangeSkinColourButton exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Types exposing (..)


changeSkinColourButton : String -> Html Msg
changeSkinColourButton imageSrc =
    div [ class "mh3" ]
        [ img [ class "pa4", onClick ChangeSkinColour, src imageSrc ] []
        ]
