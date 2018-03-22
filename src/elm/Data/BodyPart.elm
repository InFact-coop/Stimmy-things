module Data.BodyPart exposing (..)

import Types exposing (..)


bodyPartToString : BodyPart -> String
bodyPartToString bodyPart =
    case bodyPart of
        Head ->
            "Head"

        Face ->
            "Face"

        Shoulders ->
            "Shoulders"

        Chest ->
            "Chest"

        Belly ->
            "Belly"

        Arms ->
            "Arms"

        Hands ->
            "Hands"

        Legs ->
            "Legs"

        Feet ->
            "Feet"

        NoBodyPart ->
            "NoBodyPart"
