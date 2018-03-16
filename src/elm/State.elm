port module State exposing (..)

import Data.Log exposing (defaultLog)
import Data.Stim exposing (defaultStim)
import Data.View exposing (getViewFromRoute, viewFromUrl)
import Helpers exposing (scrollToTop)
import Navigation exposing (..)
import Ports exposing (..)
import Requests.GetVideos exposing (getVideos)
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
    , vidSearchString = ""
    , videos = []
    , videoStatus = NotAsked
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

        UpdateVideoSearch string ->
            { model | vidSearchString = string } ! []

        CallVideoRequest ->
            { model | videoStatus = Loading } ! [ getVideos model ]

        ReceiveVideos (Ok list) ->
            { model | videoStatus = ResponseSuccess, videos = list } ! []

        ReceiveVideos (Err string) ->
            { model | videoStatus = ResponseFailure } ! []

        NoOp ->
            model ! []
