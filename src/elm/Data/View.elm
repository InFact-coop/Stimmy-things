module Data.View exposing (..)

import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Ports exposing (..)
import Process exposing (sleep)
import Task exposing (perform)
import Time exposing (Time)
import Types exposing (..)
import Views.About exposing (..)
import Views.AddStim exposing (..)
import Views.Blog exposing (..)
import Views.CreateAvatar exposing (..)
import Views.Definition exposing (definition)
import Views.Emergency exposing (..)
import Views.Landing exposing (..)
import Views.Moodboard exposing (..)
import Views.NameAvatar exposing (..)
import Views.Onboarding1 exposing (..)
import Views.Onboarding2 exposing (..)
import Views.ShareModal exposing (..)
import Views.Splash exposing (..)
import Views.StimInfo exposing (..)
import Views.StimPreparation exposing (..)
import Views.StimRecap exposing (..)
import Views.StimTimer exposing (..)


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

        StimRecap ->
            stimRecap model

        Moodboard ->
            moodboard model

        About ->
            about model

        ShareModal ->
            shareModal model

        Blog ->
            blog model

        OnboardingFirst ->
            onboarding1 model

        OnboardingSecond ->
            onboarding2 model

        Emergency ->
            emergency model

        Splash ->
            splash model

        Definition ->
            definition model


viewToCmds : View -> Model -> List (Cmd Msg)
viewToCmds view model =
    case view of
        Landing ->
            [ initHotspots (skinColourToHexValue model.skinColour) ]

        CreateAvatar ->
            [ initCarousel () ]

        NameAvatar ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

        About ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

        Blog ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

        Emergency ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

        StimPreparation ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

        StimRecap ->
            [ changeSkinColour ( (skinColourToHexValue model.skinColour), ".avatarHead" ) ]

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
            (\_ -> NavigateTo <| ifThenElse (userId == "") Definition Landing)


toggleSkinColour : Model -> SkinColour
toggleSkinColour model =
    case model.skinColour of
        SkinColour1 ->
            SkinColour2

        SkinColour2 ->
            SkinColour3

        SkinColour3 ->
            SkinColour4

        SkinColour4 ->
            SkinColour5

        SkinColour5 ->
            SkinColour6

        SkinColour6 ->
            SkinColour7

        SkinColour7 ->
            SkinColour8

        SkinColour8 ->
            SkinColour9

        SkinColour9 ->
            SkinColour10

        SkinColour10 ->
            SkinColour11

        SkinColour11 ->
            SkinColour12

        SkinColour12 ->
            SkinColour13

        SkinColour13 ->
            SkinColour14

        SkinColour14 ->
            SkinColour1


skinColourToHexValue : SkinColour -> String
skinColourToHexValue skinColour =
    case skinColour of
        SkinColour1 ->
            "#D99877"

        SkinColour2 ->
            "#885B3E"

        SkinColour3 ->
            "#BC8D80"

        SkinColour4 ->
            "#FFEAC2"

        SkinColour5 ->
            "#EDB597"

        SkinColour6 ->
            "#EFDD93"

        SkinColour7 ->
            "#E8E8E8"

        SkinColour8 ->
            "#30A1D2"

        SkinColour9 ->
            "#B1D159"

        SkinColour10 ->
            "#25587C"

        SkinColour11 ->
            "#039645"

        SkinColour12 ->
            "#C79EC7"

        SkinColour13 ->
            "#FFC908"

        SkinColour14 ->
            "#FDA1A2"
