module Router exposing (..)

import Components.NavDrawer exposing (..)
import Data.View exposing (getCurrentView)
import Helpers.Style exposing (classes)
import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    let
        view =
            getCurrentView model
    in
        div [ classes [ "w-100 fixed overflow-y-scroll top-0 bottom-0 m0-auto cover", ifThenElse (model.view == StimPreparation) "bg-green" "bg-washed-yellow" ], id "container" ]
            [ navDrawer model
            , view
            ]
