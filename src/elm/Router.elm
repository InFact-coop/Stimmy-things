module Router exposing (..)

import Data.View exposing (getCurrentView, getViewFromRoute)
import Html exposing (..)
import Html.Attributes exposing (..)
import Helpers exposing (classes)
import Types exposing (..)


view : Model -> Html Msg
view model =
    let
        view =
            getCurrentView model
    in
        div [ classes [ "w-100 mh-100 fixed overflow-y-scroll top-0 bottom-0 m0-auto cover", "bg-washed-yellow" ], id "container" ]
            [ view
            ]
