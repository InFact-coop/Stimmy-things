module Helpers exposing (..)

import Regex exposing (..)
import Task exposing (..)
import Types exposing (..)
import Dom.Scroll exposing (..)


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


unionTypeToString : a -> String
unionTypeToString a =
    Regex.replace All
        (Regex.regex "[A-Z]")
        (\{ match } -> " " ++ match)
        (toString a)
        |> String.trim


scrollToTop : Cmd Msg
scrollToTop =
    Task.attempt (always NoOp) (toTop "container")
