module State exposing (..)

import Data.Database exposing (dbDataToModel)
import Data.Hotspots exposing (..)
import Data.Log exposing (addFace, addFeeling, addTimeTaken, defaultLog, normaliseDBLog, normaliseLog)
import Data.Stim exposing (defaultStim)
import Data.Time exposing (adjustTime, trackCounter)
import Data.View exposing (..)
import Helpers.Utils exposing (scrollToTop, stringToFloat)
import Navigation exposing (..)
import Ports exposing (..)
import Types exposing (..)
import Update.Extra.Infix exposing ((:>))


initModel : Model
initModel =
    { view = Landing
    , userId = ""
    , avatar = Avatar2
    , avatarName = "Sion"
    , skinColour = SkinColour1
    , stims = []
    , logs = []
    , newStim = defaultStim
    , newLog = defaultLog
    , timeSelected = 0
    , counter = 0
    , timerStatus = Stopped
    , paused = False
    , showNav = Neutral
    , stimMenuShowing = Nothing
    , hotspots = defaultHotspots
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
        model ! (scrollToTop :: viewToCmds model.view)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | view = getViewFromRoute location.hash }
                ! (scrollToTop :: viewToCmds model.view)

        ChangeView view ->
            { model | view = view } ! (scrollToTop :: viewToCmds model.view)

        ReceiveHotspotCoords (Ok coords) ->
            { model | hotspots = coords } ! []

        ReceiveHotspotCoords (Err err) ->
            model ! []

        ToggleNav ->
            { model | showNav = updateNav model.showNav } ! []

        ToggleStimMenu bodyPart ->
            { model | stimMenuShowing = updateStimMenu model bodyPart } ! []

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

        ChangeViewFromTimer view ->
            model
                ! []
                :> update (AdjustTimer Stop)
                :> update (ChangeView view)

        SaveLog ->
            model
                ! [ saveLog (normaliseDBLog model.newLog) ]
                :> update (ChangeView Landing)

        ReceiveUpdatedLogs dbLogs ->
            { model | logs = List.map normaliseLog dbLogs } ! []

        ReceiveInitialData (Ok dbData) ->
            dbDataToModel dbData model ! []

        ReceiveInitialData (Err err) ->
            model ! []
