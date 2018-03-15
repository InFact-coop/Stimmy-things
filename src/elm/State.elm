port module State exposing (..)

import Data.Hotspots exposing (..)
import Data.Log exposing (defaultLog)
import Data.Stim exposing (defaultStim)
import Data.View exposing (getViewFromRoute, viewFromUrl)
import Helpers exposing (scrollToTop)
import Json.Decode exposing (..)
import Navigation exposing (..)
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
    , head = HotspotCoords 0 0 0 0 0 0 0 0
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
            { model | view = getViewFromRoute location.hash } ! [ scrollToTop ]

        RecieveHotspotCoords (Ok coords) ->
            { model | head = coords } ! []

        RecieveHotspotCoords (Err err) ->
            model ! []

        NoOp ->
            model ! []


port recieveHotspotCoords : (Json.Decode.Value -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ recieveHotspotCoords
            (decodeHotspotCoords
                >> Debug.log "here i am"
                >> RecieveHotspotCoords
            )
        ]
