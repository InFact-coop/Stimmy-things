module Views.Splash exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Process exposing (sleep)
import Task exposing (perform)
import Time exposing (Time)
import Types exposing (..)


splash : Model -> Html Msg
splash model =
    div [ class "fill-screen", style [ ( "backgroundImage", "url(./assets/Splash/Stimmy-splash-GIF.gif)" ), ( "backgroundSize", "cover" ) ], horizontalTransition model ] []


initTimeout : Cmd Msg
initTimeout =
    Process.sleep (3 * Time.second)
        |> Task.perform (\_ -> NavigateTo OnboardingFirst)
