module Views.StimPreparation exposing (..)

import Components.Button exposing (..)
import Components.Face exposing (face)
import Components.FeelingButtons exposing (..)
import Data.Face exposing (faces, urlFromFace)
import Data.Feelings exposing (feelings)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (horizontalTransition)
import Helpers.Utils exposing (stringToFloat, unionTypeToString)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (on, onClick, onInput, targetValue)
import Json.Decode as Json
import Types exposing (..)
import Time exposing (Time)


stimPreparation : Model -> Html Msg
stimPreparation model =
    div [ class "border-box bg-green flex-column tc dark-gray", horizontalTransition model ]
        [ div [ class "flex flex-row ma3 mt0 mb0 items-center justify-between h" ]
            [ img [ onClick <| ChangeView Landing, src "./assets/StimPreparation/back_btn_white.svg" ] []
            , p [ class <| "absolute ma0 left-0 right-0 white lh-f4 f4" ] [ text "Mindful Breathing" ]
            , img [ onClick <| ChangeView StimInfo, src "./assets/Landing/menu-drawer/about_btn.svg" ] []
            ]
        , div [ style [ ( "backgroundImage", "url(./assets/StimPreparation/zigzag_how_you_feel_before_bg.svg)" ), ( "backgroundRepeat", "no-repeat" ) ], class "ma3 mb4 mt0 flex-column work-sans" ]
            [ div []
                [ div []
                    [ img [ class "mt6 mb0 mh7", src <| avatarHeadSelection model.avatar ] []
                    , p [ class "b lh-f5 f5 mt0" ] [ text "Before we start:" ]
                    , img [ src "./assets/StimPreparation/divider_zigzag_grey_small.svg" ] []
                    ]
                , p [ class "ma7 mb7 mv3 f6 lh-f6" ] [ text "How long do you want to do the exercise for?" ]
                , div [ class "w-80 items-center justify-between tc inline-flex center" ]
                    [ input [ id "myRange", type_ "range", Attr.min "0", Attr.max "1800", step "60", class "w-75 bg-light-gray input-reset h-custom slider", onInputValue SetTime ]
                        []
                    , div []
                        [ div
                            [ class "bg-center w3 tc pl1 mt3"
                            , style
                                [ ( "backgroundImage", "url(./assets/StimPreparation/slider_counter_tag.svg)" )
                                ]
                            ]
                            [ text (unionTypeToString (model.timeSelected / 60)) ]
                        , p [ class "ma0 pl1" ] [ text <| minOrMins model.timeSelected ]
                        ]
                    ]
                , p [ class "lh-f5 f5" ] [ text "How are you?" ]
                , div [ class "mh4 mb4 flex flew-row justify-between" ] (List.map (face Pre model) faces)
                , div []
                    [ p [ class "lh-f5 f5" ] [ text "Any specific feelings?" ]
                    , div [ class "flex flex-wrap items-center justify-between mh4" ] (renderFeelings feelings model)
                    ]

                -- , rectButton "Next" (ChangeView StimTimer)
                , p [ onClick <| ChangeView StimTimer, class "mh4 bg-green white" ] [ text "Next" ]
                ]
            ]
        ]


renderFeelings : List Feeling -> Model -> List (Html Msg)
renderFeelings feelings model =
    List.map (feelingButton Pre model) feelings


onInputValue : (String -> msg) -> Attribute msg
onInputValue tagger =
    on "input" (Json.map tagger targetValue)


minOrMins : Time -> String
minOrMins time =
    case time == 60 of
        True ->
            "min"

        False ->
            "mins"
