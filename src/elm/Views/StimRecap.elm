module Views.StimRecap exposing (..)

import Components.Button exposing (..)
import Components.Face exposing (face)
import Components.PillButton exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Types exposing (..)


stimRecap : Model -> Html Msg
stimRecap model =
    div [ class "border-box bg-green w-100 h-100 flex-column justify-center align-center content-center items-stretch tc", horizontalTransition model ]
        [ div [ class "w-90 bg-white center h-100 flex-column content-around" ]
            [ img [] []
            , p [ class "bg-green h-20" ] [ text "STIM TITLE" ]
            , img [] []
            , div []
                [ div []
                    [ img [] []
                    , p [] [ text "Time's up!" ]
                    ]
                , p [] [ text "How do you feel now?" ]
                , div [ class "flex flew-row" ] (List.map (face Post) faces)
                , div []
                    [ p [] [ text "Any specific feelings?" ]
                    , div [ class "flex flex-wrap items-center justify-around" ] (renderFeelings feelings)
                    ]
                , div [ onClick RepeatStim ] [ text "Do it again?" ]
                , rectButton "Done" SaveLog
                ]
            ]
        ]


renderFeelings : List Feeling -> List (Html Msg)
renderFeelings list =
    List.map (feelingButton Post) list
