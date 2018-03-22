module Data.View exposing (..)

import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Ports exposing (..)
import Types exposing (..)
import Views.About exposing (..)
import Views.AddStim exposing (..)
import Views.Blog exposing (..)
import Views.CreateAvatar exposing (..)
import Views.Emergency exposing (..)
import Views.Landing exposing (..)
import Views.Moodboard exposing (..)
import Views.NameAvatar exposing (..)
import Views.Onboarding1 exposing (..)
import Views.Onboarding2 exposing (..)
import Views.ShareModal exposing (..)
import Views.Splash exposing (..)
import Views.StimInfo exposing (..)
import Views.StimPreparation exposing (..)
import Views.StimRecap exposing (..)
import Views.StimTimer exposing (..)
import Views.Splash exposing (..)


getCurrentView : Model -> Html Msg
getCurrentView model =
    case model.view of
        AddStim ->
            addStim model

        CreateAvatar ->
            createAvatar model

        NameAvatar ->
            nameAvatar model

        Landing ->
            landing model

        StimInfo ->
            stimInfo model

        StimPreparation ->
            stimPreparation model

        StimTimer ->
            stimTimer model

        StimRecap ->
            stimRecap model

        Moodboard ->
            moodboard model

        About ->
            about model

        ShareModal ->
            shareModal model

        Blog ->
            blog model

        OnboardingFirst ->
            onboarding1 model

        OnboardingSecond ->
            onboarding2 model

        Emergency ->
            emergency model

        Splash ->
            splash model


viewToCmds : View -> List (Cmd Msg)
viewToCmds view =
    case view of
        Splash ->
            [ initTimeout ]

        Landing ->
            [ initHotspots () ]

        CreateAvatar ->
            [ initCarousel () ]

        _ ->
            []


updateNav : Trilean -> Trilean
updateNav trilean =
    case trilean of
        Yes ->
            No

        No ->
            Yes

        Neutral ->
            Yes


updateStimMenu : Model -> BodyPart -> Maybe BodyPart
updateStimMenu model bodyPart =
    ifThenElse
        (model.stimMenuShowing == Just bodyPart)
        (Nothing)
        (Just bodyPart)
