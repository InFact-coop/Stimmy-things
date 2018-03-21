module Views.StimRecap exposing (..)

import Components.Button exposing (rectButton)
import Components.Face exposing (face)
import Components.FeelingButtons exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Helpers.Style exposing (classes, headerFont)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Types exposing (..)


stimRecap : Model -> Html Msg
stimRecap model =
    div [ class "border-box bg-green flex-column tc dark-gray" ]
        [ div [ class "mh3 mb3 pt3 center" ]
            [ h1 [ classes [ "white", headerFont ] ] [ text <| model.selectedStim.stimName ] ]
        , div [ style [ ( "backgroundImage", "url(./assets/StimPreparation/zigzag_how_you_feel_before_bg.svg)" ), ( "backgroundRepeat", "no-repeat" ) ], class "ma3 mb4 mt0 flex-column work-sans" ]
            [ div []
                [ img [ class "mv6", src "./assets/StimPreparation/face_1.svg" ] []
                , p [ class "b lh-f5 f5" ] [ text "Time's up!" ]
                , img [ src "./assets/StimPreparation/divider_zigzag_grey_small.svg" ] []
                ]
            , p [ class "lh-f5 f5" ] [ text "How do you feel now?" ]
            , div [ class "mh4 mb4 flex flew-row justify-between" ] (List.map (face Post) faces)
            , div []
                [ p [ class "lh-f5 f5" ] [ text "I also feel.." ]
                , div [ class "flex flex-wrap items-center justify-around" ] (renderFeelings feelings model)
                ]
            , rectButton "Done" SaveLog
            , div [ class "green underline pb3 ", onClick RepeatStim ] [ text "Or do it again?" ]
            ]
        ]


renderFeelings : List Feeling -> Model -> List (Html Msg)
renderFeelings feelings model =
    List.map (feelingButton Post model) feelings
