module State exposing (..)

import Data.Log exposing (addFeelingToLog, defaultLog)
import Data.Stim exposing (defaultStim)
import Data.View exposing (getViewFromRoute, viewFromUrl)
import Data.Time exposing (adjustTime, trackCounter)
import Helpers.Utils exposing (..)
import Navigation exposing (..)
import Ports exposing (..)
import Types exposing (..)


initModel : Model
initModel =
    { view = Landing
    , userId = ""
    , avatar = Avatar1
    , avatarName = ""
    , avatarSkinColour = Skin1
    , stims = []
    , logs = []
    , newStim = defaultStim
    , newLog = defaultLog
    , timeSelected = 0
    , counter = 0
    , timerStatus = Stopped
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
        model ! [ initCarousel () ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | view = getViewFromRoute location.hash } ! [ scrollToTop ]

        MakeCarousel ->
            model ! []

        NoOp ->
            model ! []

        ToggleFeeling feeling ->
            { model | newLog = addFeelingToLog model.newLog feeling } ! []

        SetTime time ->
            let
                interval =
                    stringToFloat time |> (*) 60
            in
                { model | timeSelected = interval, counter = interval } ! []

        ChangeView view ->
            { model | view = view } ! []

        Tick _ ->
            trackCounter model ! []

        AdjustTimer timerControl ->
            adjustTime timerControl model ! []
