module State exposing (..)

import Helpers exposing (scrollToTop)
import Navigation exposing (..)
import Router exposing (getRoute, viewFromUrl)
import Types exposing (..)


initModel : Model
initModel =
    { route = Home
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
            { model | route = getRoute location.hash } ! [ scrollToTop ]

        NoOp ->
            model ! []
