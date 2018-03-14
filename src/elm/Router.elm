module Router exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Routes.Home exposing (..)
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
        Home ->
            home model


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            Home

        _ ->
            Home


viewFromUrl : Navigation.Location -> Model -> Model
viewFromUrl location model =
    let
        view =
            getRoute location.hash
    in
        { model | route = view }
