module Views.StimPreparation exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Components.SubmitButton exposing (..)
import Components.FeelingButtons exposing (..)
import Data.Feelings exposing (feelings)
import Helpers exposing (..)


stimPreparation : Model -> Html Msg
stimPreparation model =
    div [ class "border-box bg-green w-100 h-100 flex-column justify-center align-center content-center items-stretch tc" ]
        [ div [ class "w-90 bg-white center h-100 flex-column content-around" ]
            [ img [] []
            , p [ class "bg-green h-20" ] [ text "STIM TITLE" ]
            , img [] []
            , div []
                [ div []
                    [ img [] []
                    , p [] [ text "Before we start:" ]
                    ]
                , p [] [ text "How long do you want to do the exercise for?" ]
                , p [] [ text "How are you?" ]
                , div []
                    [ p [] [ text "Any specific feelings?" ]
                    , div [ class "flex flex-wrap items-center justify-around" ] (renderFeelings feelings)
                    ]
                , submitButton "Next"
                ]
            ]
        ]


renderFeelings : List Feeling -> List (Html Msg)
renderFeelings list =
    List.map feelingButton list
