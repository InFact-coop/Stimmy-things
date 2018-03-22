module State exposing (..)

import Data.Database exposing (dbDataToModel)
import Data.Hotspots exposing (..)
import Data.Avatar exposing (avatarSrcToAvatar)
import Data.Log exposing (addFace, addFeeling, addTimeTaken, defaultLog, normaliseDBLog, normaliseLog, updateStimId)
import Data.Stim exposing (addBodypart, addExerciseName, addHowTo, defaultStim)
import Data.Time exposing (adjustTime, trackCounter)
import Data.View exposing (..)
import Helpers.Utils exposing (scrollToTop, stringToFloat)
import Ports exposing (..)
import Requests.GetVideos exposing (getVideos)
import Types exposing (..)
import Update.Extra.Infix exposing ((:>))
import Transit


initModel : Model
initModel =
    { view = CreateAvatar
    , userId = ""
    , avatar = Avatar2
    , avatarName = "Sion"
    , skinColour = SkinColour1
    , stims = []
    , logs = []
    , newStim = defaultStim
    , newLog = defaultLog
    , counter = 0
    , timeSelected = 0
    , timerStatus = Stopped
    , paused = False
    , vidSearchString = ""
    , videos = []
    , videoStatus = NotAsked
    , showNav = Neutral
    , stimMenuShowing = Nothing
    , hotspots = defaultHotspots
    , selectedStim = defaultStim
    , transition = Transit.empty
    }


init : ( Model, Cmd Msg )
init =
    initModel ! viewToCmds initModel.view


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeView view ->
            { model | view = view } ! (scrollToTop :: viewToCmds view)

        ReceiveHotspotCoords (Ok coords) ->
            { model | hotspots = coords } ! []

        ReceiveHotspotCoords (Err err) ->
            model ! []

        UpdateVideoSearch string ->
            { model | vidSearchString = string } ! []

        CallVideoRequest ->
            { model | videoStatus = Loading, videos = [] } ! [ getVideos model, videoCarousel () ]

        ReceiveVideos (Ok list) ->
            { model | videoStatus = ResponseSuccess, videos = list } ! [ videoCarousel () ]

        ReceiveVideos (Err string) ->
            { model | videoStatus = ResponseFailure } ! []

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

        TransitMsg a ->
            Transit.tick TransitMsg a model

        NavigateTo view ->
            Transit.start TransitMsg (ChangeView view) ( 200, 200 ) model

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

        SelectAvatar ->
            model ! [ retrieveChosenAvatar () ]

        SaveLog ->
            { model
                | newLog = defaultLog
                , timeSelected = 0
                , counter = 0
                , selectedStim = defaultStim
            }
                ! [ saveLog (normaliseDBLog model.newLog) ]
                :> update (ChangeView Landing)

        ReceiveUpdatedLogs dbLogs ->
            { model | logs = List.map normaliseLog dbLogs } ! []

        ToggleBodypart bodypart ->
            { model | newStim = addBodypart bodypart model.newStim } ! []

        AddExerciseName string ->
            { model | newStim = addExerciseName string model.newStim } ! []

        AddHowTo string ->
            { model | newStim = addHowTo string model.newStim } ! []

        ReceiveInitialData (Ok dbData) ->
            dbDataToModel dbData model ! []

        ReceiveInitialData (Err err) ->
            model ! []

        ReceiveChosenAvatar src ->
            { model | avatar = avatarSrcToAvatar src }
                ! []
                :> update (ChangeView NameAvatar)

        GoToStim stim ->
            { model
                | selectedStim = stim
                , newLog = updateStimId stim.stimId model.newLog
            }
                ! []
                :> update (ChangeView StimPreparation)
