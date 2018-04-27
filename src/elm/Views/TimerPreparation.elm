module Views.TimerPreparation exposing (..)

import Components.Button exposing (rectButton)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (verticalTransition, classes, headerFont, backgroundImageCover)
import Helpers.Utils exposing (stringToFloat, unionTypeToString, ifThenElse)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (on, onClick, onInput, targetValue)
import Json.Decode as Json
import Types exposing (..)


stimPreparation : Model -> Html Msg
stimPreparation model =
    div [ class "border-box bg-green flex-column tc dark-gray mvh-100 pa1", verticalTransition model ]
        [ div [ classes [ headerFont, "flex flex-row mh3 mv0 items-center justify-center h3 pv2" ] ]
            [ div
                [ onClick <| NavigateTo StimInfo
                , class "h2 w2 flex items-center left-1 absolute"
                ]
                [ img [ src "./assets/TimerPreparation/close_btn_white.svg" ] [] ]
            , p [ class <| "ma0 left-0 right-0 white lh-f4 f4 mw4" ] [ text <| model.selectedStim.stimName ]
            ]
        , div
            [ style
                [ ( "backgroundImage", "url(./assets/TimerPreparation/zigzag_how_you_feel_before_bg.svg)" )
                , ( "backgroundRepeat", "no-repeat" )
                , ( "backgroundSize", "cover" )
                ]
            , class "ma3 mb4 mt0 flex-column work-sans mh-88 absolute"
            ]
            [ div [ class "mh-88" ]
                [ div []
                    [ object
                        [ attribute "data" <| avatarHeadSelection model.avatar, type_ "image/svg+xml", class "avatarHead mt6 mb0 mh7 w5" ]
                        []
                    , p [ class "b lh-f5 f5 mb3" ] [ text "Before we start:" ]
                    , img [ src "./assets/TimerPreparation/divider_zigzag_grey_small.svg" ] []
                    ]
                , p [ class "mh7 mv3 f6 lh-f6" ] [ text "How long do you want to do the exercise for?" ]
                , div [ class "w-80 items-center justify-between tc inline-flex center mb4" ]
                    [ input
                        [ id "myRange"
                        , type_ "range"
                        , Attr.min "0"
                        , Attr.max "600"
                        , step "60"
                        , defaultValue ""
                        , class "w-75 bg-light-gray input-reset h-custom slider"
                        , value (toString <| model.timeSelected)
                        , onInputValue SetTime
                        ]
                        []
                    , div []
                        [ input
                            [ class <| "outline-0 mt3 tc w3 f6 lh-f7 pl1 pa0 pb1 flex justify-center items-center timer-tag"
                            , type_ "number"
                            , onInputValue SetTimeFromText
                            , placeholder "0"
                            , value <| ifThenElse (model.timeSelected == 0) "" (toString <| model.timeSelected / 60)
                            ]
                            []
                        , p [ class "ma0 pl1" ] [ text <| ifThenElse (model.timeSelected == 60) "min" "mins" ]
                        ]
                    ]
                , div [ class "pb4 absolute bottom-0 w-80 left-10" ]
                    [ rectButton "Next" (NavigateTo Timer)
                    ]
                ]
            ]
        ]


onInputValue : (String -> msg) -> Attribute msg
onInputValue tagger =
    on "input" (Json.map tagger targetValue)
