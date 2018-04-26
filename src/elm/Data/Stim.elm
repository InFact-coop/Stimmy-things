module Data.Stim exposing (..)

import Data.BodyPart exposing (stringToBodyPart)
import Data.User exposing (decodeUser, defaultUser)
import Helpers.Utils exposing (stringToMaybe, unionTypeToString, ifThenElse)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as Encode
import Random exposing (Generator)
import Random.List
import Types exposing (..)


defaultStim : Stim
defaultStim =
    { stimId = ""
    , bodyPart = NoBodyPart
    , stimName = ""
    , instructions = ""
    , videoSrc = Nothing
    , shared = False
    , userId = ""
    , actionsDisplaying = False
    , thumbnail = Nothing
    , showVideo = False
    }


decodeStim : Decoder Stim
decodeStim =
    decode Stim
        |> required "stimId" string
        |> required "bodyPart" (Json.Decode.map stringToBodyPart string)
        |> required "stimName" string
        |> required "instructions" string
        |> required "videoSrc" (Json.Decode.map stringToMaybe string)
        |> required "shared" bool
        |> required "userId" string
        |> hardcoded False
        |> required "thumbnail" (Json.Decode.map stringToMaybe string)
        |> hardcoded False


decodeStimList : Value -> Result String (List Stim)
decodeStimList =
    decodeValue (list decodeStim)


firebaseDecoder : Decoder StimWithUser
firebaseDecoder =
    decode StimWithUser
        |> required "stim" decodeStim
        |> optional "user" decodeUser defaultUser


decodeStimWithUser : Value -> Result String (List StimWithUser)
decodeStimWithUser =
    decodeValue (list firebaseDecoder)


addBodypart : BodyPart -> Stim -> Stim
addBodypart bodypart stim =
    { stim | bodyPart = bodypart }


toggleSharedStim : Stim -> Stim
toggleSharedStim stim =
    { stim | shared = True }


addExerciseName : String -> Stim -> Stim
addExerciseName string stim =
    { stim | stimName = string }


addVideoSrc : String -> Stim -> Stim
addVideoSrc string stim =
    { stim | videoSrc = stringToMaybe string }


addHowTo : String -> Stim -> Stim
addHowTo string stim =
    { stim | instructions = string }


normaliseStim : Stim -> Encode.Value
normaliseStim stim =
    Encode.object
        [ ( "stimId", Encode.string stim.stimId )
        , ( "stimName", Encode.string stim.stimName )
        , ( "bodyPart", Encode.string <| unionTypeToString stim.bodyPart )
        , ( "instructions", Encode.string stim.instructions )
        , ( "videoSrc", Encode.string <| Maybe.withDefault "" stim.videoSrc )
        , ( "userId", Encode.string stim.userId )
        , ( "shared", Encode.bool stim.shared )
        , ( "thumbnail", Encode.string <| Maybe.withDefault "" stim.thumbnail )
        ]


generateRandomStim : Model -> Generator Stim
generateRandomStim model =
    Random.List.shuffle model.stims
        |> Random.map retrieveFirstStim


retrieveFirstStim : List Stim -> Stim
retrieveFirstStim listStim =
    listStim
        |> List.head
        |> Maybe.withDefault defaultStim


updateStimInModel : Model -> Stim -> Model
updateStimInModel model selectedStim =
    let
        matchingStim =
            List.head <|
                List.filter (\stim -> stim.stimId == selectedStim.stimId) model.stims
    in
        case matchingStim of
            Nothing ->
                { model | selectedStim = toggleSharedStim selectedStim }

            Just a ->
                { model | selectedStim = toggleSharedStim selectedStim, stims = toggleStimInStimList a model.stims }


toggleStimInStimList : Stim -> List Stim -> List Stim
toggleStimInStimList matchingStim listStims =
    List.map
        (\stim ->
            if stim == matchingStim then
                { stim | shared = True }
            else
                stim
        )
        listStims


closeActionButtons : List Stim -> List Stim
closeActionButtons listStim =
    List.map (\stim -> { stim | actionsDisplaying = False }) listStim


toggleActionButtons : Stim -> List Stim -> List Stim
toggleActionButtons stim listStim =
    List.map
        (\n -> ifThenElse (n == stim) ({ n | actionsDisplaying = not n.actionsDisplaying }) ({ n | actionsDisplaying = False }))
        listStim


deleteStimFromModel : Stim -> List Stim -> List Stim
deleteStimFromModel stim listStim =
    List.filter (\n -> n /= stim) listStim


addNewStimVideo : String -> Model -> Stim
addNewStimVideo videoId model =
    let
        currentVideo =
            List.filter (\video -> video.id == videoId) model.videos |> List.head

        newStim =
            model.newStim
    in
        case currentVideo of
            Just video ->
                { newStim
                    | videoSrc = Just <| "https://www.youtube.com/embed/" ++ video.id
                    , thumbnail = Just video.thumbnail
                }

            Nothing ->
                newStim


toggleStimVideo : Stim -> List StimWithUser -> List StimWithUser
toggleStimVideo stim stimsWithUser =
    List.map
        (\stimWithUser ->
            ifThenElse (stim == stimWithUser.stim)
                { stimWithUser | stim = (updateShowVideo True) stimWithUser.stim }
                stimWithUser
        )
        stimsWithUser


updateShowVideo : Bool -> Stim -> Stim
updateShowVideo bool stim =
    { stim | showVideo = bool }


hideVideos : List StimWithUser -> List StimWithUser
hideVideos stimsWithUser =
    List.map
        (\stimWithUser -> { stimWithUser | stim = (updateShowVideo False) stimWithUser.stim })
        stimsWithUser
