module Helpers exposing (..)

import Regex exposing (..)
import Task exposing (..)
import Types exposing (..)
import Dom.Scroll exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetChecked, targetValue)
import Json.Decode as Decode


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


emptyDiv : Html msg
emptyDiv =
    div [ class "dn" ] []


stringToFloat : String -> Float
stringToFloat string =
    String.toFloat string |> Result.withDefault 0


unionTypeToString : a -> String
unionTypeToString a =
    Regex.replace All
        (Regex.regex "[A-Z]")
        (\{ match } -> " " ++ match)
        (toString a)
        |> String.trim


createListOfStrings : List a -> List String
createListOfStrings list =
    List.map unionTypeToString list


scrollToTop : Cmd Msg
scrollToTop =
    Task.attempt (always NoOp) (toTop "container")


viewIf : Bool -> Html msg -> Html msg
viewIf condition content =
    if condition then
        content
    else
        Html.text ""


backgroundImageStyle : String -> Int -> Attribute msg
backgroundImageStyle url sizePercent =
    style
        [ ( "background-image", "url(" ++ url ++ ")" )
        , ( "background-repeat", "no-repeat" )
        , ( "background-position", "center center" )
        , ( "background-size", toString sizePercent ++ "%" )
        ]


isNewListEntry : a -> List a -> Bool
isNewListEntry a list =
    List.member a list
        |> not


onCheckboxInput : (String -> Bool -> msg) -> Html.Attribute msg
onCheckboxInput tagger =
    on "change" (Decode.map2 tagger targetValue targetChecked)
