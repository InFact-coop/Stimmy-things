module Views.Splash exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Process exposing (sleep)
import Time exposing (Time)
import Task exposing (perform)


splash : Model -> Html Msg
splash model =
    div [ class "fill-screen", style [ ( "backgroundImage", "url(./assets/Splash/Stimmy-splash-GIF.gif)" ), ( "backgroundSize", "cover" ) ], horizontalTransition model ] []


initTimeout : Cmd Msg
initTimeout =
    Process.sleep (3 * Time.second)
        |> Task.perform (\_ -> NavigateTo Landing)
