module Components.FeelingButtons exposing (..)

import Html exposing (..)
import Helpers.Utils exposing (unionTypeToString)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


preFeelingButton : Feeling -> Html Msg
preFeelingButton feeling =
    div [ class "w-40 flex justify-center bg-green br4 pa1 pointer", onClick (TogglePreFeeling feeling) ] [ text (unionTypeToString feeling) ]


postFeelingButton : Feeling -> Html Msg
postFeelingButton feeling =
    div [ class "w-40 flex justify-center bg-green br4 pa1 pointer", onClick (TogglePostFeeling feeling) ] [ text (unionTypeToString feeling) ]
