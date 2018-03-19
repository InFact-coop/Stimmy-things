module Views.StimRecap exposing (..)

import Components.Button exposing (..)
import Components.FeelingButtons exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Types exposing (..)


stimRecap : Model -> Html Msg
stimRecap model =
    div [ class "border-box bg-green w-100 h-100 flex-column justify-center align-center content-center items-stretch tc" ]
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
                , div [ class "flex flew-row" ] (List.map face faces)
                , div []
                    [ p [] [ text "Any specific feelings?" ]
                    , div [ class "flex flex-wrap items-center justify-around" ] (renderFeelings feelings)
                    ]
                , rectButton "Next" (ChangeView StimTimer)
                ]
            ]
        ]


renderFeelings : List Feeling -> List (Html Msg)
renderFeelings list =
    List.map (feelingButton Post) list


face : Face -> Html Msg
face face =
    div [ onClick <| ToggleFace Post face ]
        [ img [ src (urlFromFace face) ] []
        ]
