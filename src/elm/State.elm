port module State exposing (..)

import Data.Log exposing (defaultLog)
import Data.Stim exposing (defaultStim)
import Data.View exposing (getViewFromRoute, viewFromUrl)
import Helpers exposing (..)
import Data.Feelings exposing (..)
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
    , counter = 0
    , paused = False
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
            { model | newLog = updateNewLog model.newLog feeling } ! []


updateNewLog : Log -> Feeling -> Log
updateNewLog log feeling =
    if isNewListEntry feeling log.preFeelings then
        { log | preFeelings = log.preFeelings ++ [ feeling ] }
    else
        { log | preFeelings = List.filter (\x -> x /= feeling) log.preFeelings }
