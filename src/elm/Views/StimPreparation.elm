module Views.StimPreparation exposing (..)

import Components.Button exposing (rectButton)
import Components.PillButton exposing (..)
import Components.Face exposing (face)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (horizontalTransition, classes, headerFont, backgroundImageCover)
import Helpers.Utils exposing (stringToFloat, unionTypeToString, ifThenElse)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (on, onClick, onInput, targetValue)
import Json.Decode as Json
import Types exposing (..)


stimPreparation : Model -> Html Msg
stimPreparation model =
    div [ class "border-box bg-green flex-column tc dark-gray h-fit-content", horizontalTransition model ]
        [ div [ classes [ headerFont, "flex flex-row ma3 mt0 mb0 items-center justify-between h" ] ]
            [ div
                [ onClick <| NavigateTo Landing
                , class "h4 w3 flex items-centre justify-left"
                ]
                [ img [ src "./assets/StimPreparation/back_btn_white.svg" ] [] ]
            , p [ class <| "ma0 left-0 right-0 white lh-f4 f4 mw4" ] [ text <| model.selectedStim.stimName ]
            , div
                [ onClick NavigateToStimInfo
                , class "h4 w3 flex items-centre justify-right"
                ]
                [ img [ src "./assets/Landing/menu-drawer/about_btn.svg" ] [] ]
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
                [ div []
                    [ img [ class "mt6 mb0 mh7 w5", src <| avatarHeadSelection model.avatar ] []
                    , p [ class "b lh-f5 f5 mb3" ] [ text "Before we start:" ]
                    , img [ src "./assets/StimPreparation/divider_zigzag_grey_small.svg" ] []
                    ]
                , p [ class "mh7 mv3 f6 lh-f6" ] [ text "How long do you want to do the exercise for?" ]
                , div [ class "w-80 items-center justify-between tc inline-flex center mb4" ]
                    [ input
                        [ id "myRange"
                        , type_ "range"
                        , defaultValue "0"
                        , Attr.min "0"
                        , Attr.max "600"
                        , step "60"
                        , class "w-75 bg-light-gray input-reset h-custom slider"
                        , onInputValue SetTime
                        ]
                        []
                    , div []
                        [ input
                            [ class "bg-center w3 h2 flex justify-center items-center pl1 mt3"
                            , backgroundImageCover "(./assets/StimPreparation/slider_counter_tag.svg)"
                            ]
                            [ text (unionTypeToString (model.timeSelected / 60)) ]
                        , p [ class "ma0 pl1" ] [ text <| ifThenElse (model.timeSelected == 60) "min" "mins" ]
                        ]
                    ]
                , p [ class "lh-f5 f5 mb4" ] [ text "How are you?" ]
                , div [ class "mh0 mb4 flex flew-row justify-center" ] (List.map (face Pre model) faces)
                , div [ class "mh4" ]
                    [ p [ class "lh-f5 f5 mb3" ] [ text "Any specific feelings?" ]
                    , div [ class "flex flex-wrap items-center justify-between" ] (renderFeelings feelings model)
                    ]
                , div [ class "mh4 pb4" ]
                    [ rectButton "Next" (NavigateTo StimTimer)
                    ]
                ]
            ]
        ]


renderFeelings : List Feeling -> Model -> List (Html Msg)
renderFeelings feelings model =
    List.map (feelingButton Pre model) feelings


onInputValue : (String -> msg) -> Attribute msg
onInputValue tagger =
    on "input" (Json.map tagger targetValue)
