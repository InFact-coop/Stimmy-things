module Data.View exposing (..)

import Html exposing (..)
import Navigation
import Types exposing (..)
import Views.About exposing (..)
import Views.AddStim exposing (..)
import Views.AddStimSuccessModal exposing (..)
import Views.Blog exposing (..)
import Views.CreateAvatar exposing (..)
import Views.Landing exposing (..)
import Views.Moodboard exposing (..)
import Views.NameAvatar exposing (..)
import Views.ShareModal exposing (..)
import Views.StimInfo exposing (..)
import Views.StimPreparation exposing (..)
import Views.StimRecap exposing (..)
import Views.StimTimer exposing (..)


getCurrentView : Model -> Html Msg
getCurrentView model =
    case model.view of
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

        AddStim ->
            addStim model

        AddStimSuccessModal ->
            addStimSuccessModal model

        Moodboard ->
            moodboard model

        About ->
            about model

        ShareModal ->
            shareModal model

        Blog ->
            blog model


getViewFromRoute : String -> View
getViewFromRoute hash =
    case hash of
        "#create-avatar" ->
            CreateAvatar

        "#name-avatar" ->
            NameAvatar

        "#landing" ->
            Landing

        "#stim-info" ->
            StimInfo

        "#stim-preparation" ->
            StimPreparation

        "#stim-timer" ->
            StimTimer

        "#stim-recap" ->
            StimRecap

        "#add-stim" ->
            AddStim

        "#add-stim-success-modal" ->
            AddStimSuccessModal

        "#moodboard" ->
            Moodboard

        "#about" ->
            About

        "#share-modal" ->
            ShareModal

        "#blog" ->
            Blog

        _ ->
            Landing


viewFromUrl : Navigation.Location -> Model -> Model
viewFromUrl location model =
    let
        view =
            getViewFromRoute location.hash
    in
        { model | view = view }
