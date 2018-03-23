module Data.BodyPart exposing (..)

import Types exposing (..)


bodyParts : List BodyPart
bodyParts =
    [ Head
    , Face
    , Shoulders
    , Chest
    , Belly
    , Arms
    , Hands
    , Legs
    , Feet
    ]


stringToBodyPart : String -> BodyPart
stringToBodyPart strBodyPart =
    case strBodyPart of
        "Head" ->
            Head

        "Face" ->
            Face

        "Shoulders" ->
            Shoulders

        "Chest" ->
            Chest

        "Belly" ->
            Belly

        "Arms" ->
            Arms

        "Hands" ->
            Hands

        "Legs" ->
            Legs

        "Feet" ->
            Feet

        _ ->
            NoBodyPart
