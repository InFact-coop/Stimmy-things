module Router exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Views.Landing exposing (..)
import Views.CreateAvatar exposing (..)
import Views.NameAvatar exposing (..)
import Views.StimInfo exposing (..)
import Views.StimPreparation exposing (..)
import Views.StimTimer exposing (..)
import Views.StimRecap exposing (..)
import Views.AddStim exposing (..)
import Views.AddStimSuccessModal exposing (..)
import Views.Moodboard exposing (..)
import Views.About exposing (..)
import Views.ShareModal exposing (..)
import Views.Blog exposing (..)
import Types exposing (..)
import Navigation exposing (..)


view : Model -> Html Msg
view model =
    let
        view =
            getCurrentRoute model
    in
        div [ class "w-100 fixed overflow-y-scroll top-0 bottom-0 bg-light-blue m0-auto cover", id "container" ]
            [ view
            ]


getCurrentRoute : Model -> Html Msg
getCurrentRoute model =
    case model.route of
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


getRoute : String -> Route
getRoute hash =
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
            getRoute location.hash
    in
        { model | route = view }
