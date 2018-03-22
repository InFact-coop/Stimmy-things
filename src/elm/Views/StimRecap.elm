module Views.StimRecap exposing (..)

import Components.Button exposing (rectButton)
import Components.Face exposing (face)
import Components.PillButton exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (classes, headerFont, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Types exposing (..)


stimRecap : Model -> Html Msg
stimRecap model =
    div [ class "border-box bg-green flex-column tc dark-gray h-fit-content", horizontalTransition model ]
        [ div [ classes [ headerFont, "flex flex-row white ma3 mt0 mb0 items-center justify-center h h4 " ] ]
            [ p
                []
                [ text "The Mindful Jar" ]
            ]
        , div
            [ style
                [ ( "backgroundImage", "url(./assets/StimPreparation/zigzag_how_you_feel_before_bg.svg)" )
                , ( "backgroundRepeat", "no-repeat" )
                , ( "backgroundSize", "cover" )
                ]
            , class "ma3 mb4 mt0 flex-column work-sans"
            ]
            [ div []
                [ div [ class "mb3" ]
                    [ img [ class "mt6 mb0 mh7 w5", src <| avatarHeadSelection model.avatar ] []
                    , p [ class "b lh-f5 f5 mb3" ] [ text "Time's up!" ]
                    , img [ src "./assets/StimPreparation/divider_zigzag_grey_small.svg" ] []
                    ]
                , p [ class "lh-f5 f5 mb4" ] [ text "How do you feel now?" ]
                , div [ class "mh4 mb4 flex flew-row justify-between" ] (List.map (face Post model) faces)
                , div [ class "mh4" ]
                    [ p [ class "lh-f5 f5 mb3" ] [ text "I also feel.." ]
                    , div [ class "flex flex-wrap items-center justify-between" ] (renderFeelings feelings model)
                    ]
                , div [ class "mh4 h3 mb2" ] [ rectButton "Done" SaveLog ]
                , div [ class "green underline pb4 ", onClick RepeatStim ] [ text "Or do it again?" ]
                ]
            ]
        ]


renderFeelings : List Feeling -> Model -> List (Html Msg)
renderFeelings feelings model =
    List.map (feelingButton Post model) feelings
