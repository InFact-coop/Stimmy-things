module Views.StimRecap exposing (..)

import Components.Face exposing (face)
import Components.FeelingButtons exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Types exposing (..)


stimRecap : Model -> Html Msg
stimRecap model =
    div [ class "border-box bg-green flex-column tc dark-gray" ]
        [ div [ class "flex flex-row mh3 mb3 pt3 items-center justify-between h" ]
            [ img [ onClick <| ChangeView Landing, src "./assets/StimPreparation/back_btn_white.svg" ] []
            , p [ class <| "absolute ma0 left-0 right-0 white lh-f4 f4" ] [ text "Mindful Breathing" ]
            ]
        , div [ style [ ( "backgroundImage", "url(./assets/StimPreparation/zigzag_how_you_feel_before_bg.svg)" ), ( "backgroundRepeat", "no-repeat" ) ], class "ma3 mb4 mt0 flex-column work-sans" ]
            [ div []
                [ img [ class "mv6", src "./assets/StimPreparation/face_1.svg" ] []
                , p [ class "b lh-f5 f5" ] [ text "Time's up!" ]
                , img [ src "./assets/StimPreparation/divider_zigzag_grey_small.svg" ] []
                ]
            , p [ class "lh-f5 f5" ] [ text "How do you feel now?" ]
            , div [ class "mh4 mb4 flex flew-row justify-between" ] (List.map (face Post model) faces)
            , div []
                [ p [ class "lh-f5 f5" ] [ text "I also feel.." ]
                , div [ class "flex flex-wrap items-center justify-around" ] (renderFeelings feelings model)
                ]
            , p [ onClick <| SaveLog, class "pa2 mb3 br2 mh4 bg-green white" ] [ text "Done" ]
            , div [ class "green underline pb3 ", onClick RepeatStim ] [ text "Or do it again?" ]
            ]
        ]


renderFeelings : List Feeling -> Model -> List (Html Msg)
renderFeelings feelings model =
    List.map (feelingButton Post model) feelings
