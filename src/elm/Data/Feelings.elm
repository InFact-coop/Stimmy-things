module Data.Feelings exposing (..)

import Types exposing (..)


feelings : List Feeling
feelings =
    [ Happy
    , Hyper
    , Motivated
    , Anxious
    , Cheerful
    , Angry
    , Excited
    , Bored
    , Optimistic
    , Annoyed
    , Relaxed
    , Frustrated
    ]


stringToFeeling : String -> Feeling
stringToFeeling string =
    case string of
        "Happy" ->
            Happy

        "Hyper" ->
            Hyper

        "Motivated" ->
            Motivated

        "Anxious" ->
            Anxious

        "Cheerful" ->
            Cheerful

        "Angry" ->
            Angry

        "Excited" ->
            Excited

        "Bored" ->
            Bored

        "Optimistic" ->
            Optimistic

        "Annoyed" ->
            Annoyed

        "Relaxed" ->
            Relaxed

        "Frustrated" ->
            Frustrated

        _ ->
            Happy
