module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers exposing (unionTypeToString)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


feelingButton : Feeling -> Html Msg
feelingButton feeling =
    div [ class "w-40 flex justify-center bg-green br4 pa1 pointer", onClick (ToggleFeeling feeling) ] [ text (unionTypeToString feeling) ]
