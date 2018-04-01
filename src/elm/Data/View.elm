module Data.View exposing (..)

import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Ports exposing (..)
import Process exposing (sleep)
import Task exposing (perform)
import Time exposing (Time)
import Types exposing (..)
import Views.About exposing (..)
import Views.AddStim exposing (..)
import Views.Blog exposing (..)
import Views.CreateAvatar exposing (..)
import Views.Definition exposing (definition)
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

        Definition ->
            definition model


viewToCmds : View -> List (Cmd Msg)
viewToCmds view =
    case view of
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
        Nothing
        (Just bodyPart)


navigateFromSplash : String -> Cmd Msg
navigateFromSplash userId =
    Process.sleep (2 * Time.second)
        |> Task.perform
            (\_ -> NavigateTo <| ifThenElse (userId == "") Definition Landing)


toggleSkinColour : Model -> SkinColour
toggleSkinColour model =
    case model.skinColour of
        SkinColour1 ->
            SkinColour2

        SkinColour2 ->
            SkinColour3

        SkinColour3 ->
            SkinColour4

        SkinColour4 ->
            SkinColour5

        SkinColour5 ->
            SkinColour6

        SkinColour6 ->
            SkinColour7

        SkinColour7 ->
            SkinColour1
