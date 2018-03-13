module State exposing (..)

import Dom.Scroll exposing (..)
import Router exposing (getRoute, viewFromUrl)
import Task
import Types exposing (..)
import Navigation exposing (..)


initModel : Model
initModel =
    { route = Landing
    , userId = ""
    , avatar = Alien
    , avatarName = ""
    , avatarSkinColour = Green
    , stims = []
    , logs = []
    , newStim = Stim "" Chest "" "" Nothing False ""
    , newLog = Log 0 "" 0 0 [] [] 0
    , counter = 0
    , paused = False
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
        model ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | route = getRoute location.hash } ! [ Task.attempt (always NoOp) (toTop "container") ]

        NoOp ->
            model ! []
