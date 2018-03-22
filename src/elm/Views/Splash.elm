module Views.Splash exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (on, onClick, onInput, targetValue)
import Process exposing (sleep)
import Time exposing (Time)
import Task exposing (perform)


splash : Model -> Html Msg
splash model =
    div [ onClick <| cmd, class "fill-screen", style [ ( "backgroundImage", "url(./assets/Splash/Stimmy-splash-GIF.gif)" ), ( "backgroundSize", "cover" ) ], horizontalTransition model ] []


cmd : Cmd Msg
cmd =
    Process.sleep (2 * Time.second)
        |> Task.perform (\_ -> ChangeView Landing)
