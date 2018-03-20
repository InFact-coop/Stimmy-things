module State exposing (..)

import Data.Log exposing (addFeeling, addFace, defaultLog, addTimeTaken)
import Data.Stim exposing (defaultStim)
import Data.Time exposing (adjustTime, trackCounter)
import Data.View exposing (getViewFromRoute, viewFromUrl, viewToCmds, updateNav)
import Navigation exposing (..)
import Data.Hotspots exposing (..)
import Helpers.Utils exposing (scrollToTop, stringToFloat)
import Ports exposing (..)
import Navigation exposing (..)
import Types exposing (..)
import Update.Extra.Infix exposing ((:>))


initModel : Model
initModel =
    { view = Landing
    , userId = ""
    , avatar = Avatar1
    , avatarName = "Hello"
    , avatarSkinColour = Skin1
    , stims = []
    , logs = []
    , newStim = defaultStim
    , newLog = defaultLog
    , timeSelected = 0
    , counter = 0
    , timerStatus = Stopped
    , paused = False
    , showNav = Neutral
    , hotspots = defaultHotspots
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
        model ! [ initHotspots () ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | view = getViewFromRoute location.hash }
                ! (scrollToTop :: viewToCmds model.view)

        ChangeView view ->
            { model | view = view } ! []

        RecieveHotspotCoords (Ok coords) ->
            { model | hotspots = coords } ! []

        RecieveHotspotCoords (Err err) ->
            model ! []

        ToggleNav ->
            { model | showNav = updateNav model.showNav } ! []

        NoOp ->
            model ! []

        SetTime time ->
            let
                interval =
                    stringToFloat time
            in
                { model | timeSelected = interval, counter = interval } ! []

        Tick _ ->
            trackCounter model ! []

        AdjustTimer timerControl ->
            adjustTime timerControl model ! []

        ToggleFeeling logStage feeling ->
            { model | newLog = addFeeling logStage feeling model.newLog } ! []

        ToggleFace logStage face ->
            { model | newLog = addFace logStage face model.newLog } ! []

        StopTimer ->
            addTimeTaken model
                ! []
                :> update (AdjustTimer Stop)
                :> update (ChangeView StimRecap)

        RepeatStim ->
            { model | newLog = defaultLog, timeSelected = 0, counter = 0 }
                ! []
                :> update (ChangeView StimPreparation)
