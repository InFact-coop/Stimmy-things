module Helpers exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


emptyDiv : Html msg
emptyDiv =
    div [ class "dn" ] []


viewIf : Bool -> Html msg -> Html msg
viewIf condition content =
    if condition then
        content
    else
        Html.text ""
