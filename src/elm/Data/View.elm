module Data.View exposing (..)

import Data.SkinColour exposing (skinColourToHexValue)
import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Ports exposing (..)
import Process exposing (sleep)
import Task exposing (perform)
import Time exposing (Time)
import Types exposing (..)
import Views.About exposing (..)
import Views.AddStim exposing (..)
import Views.StimFinish exposing (..)
import Views.Blog exposing (..)
import Views.CreateAvatar exposing (..)
import Views.Emergency exposing (..)
import Views.Landing exposing (..)
import Views.NameAvatar exposing (..)
import Views.Onboarding exposing (..)
import Views.ShareModal exposing (..)
import Views.DeleteModal exposing (..)
import Views.Splash exposing (..)
import Views.StimInfo exposing (..)
import Views.StimPreparation exposing (..)
import Views.StimRecap exposing (..)
import Views.StimTimer exposing (..)
import Delay exposing (..)
import Time exposing (..)


getCurrentView : Model -> Html Msg
getCurrentView model =
    case model.view of
        AddStim ->
            addStim model

        CreateAvatar ->
            createAvatar model

        NameAvatar ->
            nameAvatar model

        Landing ->
            landing model

        StimInfo ->
            stimInfo model

        StimPreparation ->
            stimPreparation model

        StimTimer ->
            stimTimer model

        StimFinish ->
            stimFinish model

        StimRecap ->
            stimRecap model

        About ->
            about model

        ShareModal ->
            shareModal model

        DeleteModal ->
            deleteModal model

        Blog ->
            blog model

        Onboarding ->
            onboarding model

        Emergency ->
            emergency model

        Splash ->
            splash model


viewToCmds : View -> Model -> List (Cmd Msg)
viewToCmds view model =
    case view of
        Landing ->
            [ initHotspots (skinColourToHexValue model.skinColour) ]

        CreateAvatar ->
            [ initCarousel () ]

        NameAvatar ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        About ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        Blog ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        Emergency ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        StimPreparation ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        StimRecap ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".avatarHead" ) ]

        StimTimer ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".timerHead" ) ]

        Onboarding ->
            [ onboardingCarousel () ]

        StimFinish ->
            [ changeSkinColour ( skinColourToHexValue model.skinColour, ".timerFinishHead" ), Delay.after 5000 millisecond (NavigateTo Landing) ]

        _ ->
            []


updateNav : Trilean -> Trilean
updateNav trilean =
    case trilean of
        Yes ->
            No

        No ->
            Yes

        Neutral ->
            Yes


hideNav : Trilean -> Trilean
hideNav trilean =
    case trilean of
        Yes ->
            No

        No ->
            Neutral

        Neutral ->
            Neutral


updateStimMenu : Model -> BodyPart -> Maybe BodyPart
updateStimMenu model bodyPart =
    ifThenElse
        (model.stimMenuShowing == Just bodyPart)
        Nothing
        (Just bodyPart)


navigateFromSplash : String -> Cmd Msg
navigateFromSplash userId =
    Process.sleep (2 * Time.second)
        |> Task.perform
            (\_ -> NavigateTo <| ifThenElse (userId == "") Onboarding Landing)
