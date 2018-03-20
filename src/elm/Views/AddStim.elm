module Views.AddStim exposing (..)

import Components.PillButton exposing (..)
import Components.Video exposing (videoYT)
import Data.Bodyparts exposing (bodyparts)
import Helpers.Style exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


addStim : Model -> Html Msg
addStim model =
    div [ class "bg-washed-yellow" ]
        [ div
            [ class "bg-green flex flex-column items-center" ]
            [ button [] [ text "go back" ]
            , p [ class "white f6 mb4" ]
                [ text "Add new" ]
            , p [ class "white f6 mb3" ] [ text "chest" ]
            ]
        , div
            [ class "ma0" ]
            [ Html.form [ class "flex flex-column lh-f6 f6" ]
                [ div
                    [ backgroundImageNoPosition "./assets/zigzag_choose_part_tags_bg.svg" 100
                    , class "flex flex-column mb3 "
                    ]
                    [ img [ class "ma3", src "./assets/zigzag_big_grey_down.svg" ] []
                    , label
                        [ for "choose-exercise" ]
                        []
                    , p [ class "ma0" ] [ text "Choose a part of the body" ]
                    , p [ class "ma0" ] [ text "I want to calm my ..." ]
                    , p [ class "ma0" ] [ text " I am feeling anxious around my ..." ]
                    , div [ class " flex flex-wrap justify-center mv4 white" ] (renderBodyparts bodyparts)
                    ]
                , label [ for "exercise-name", class "b h6 ml3 mr3" ] [ text "what would you call this exercise?" ]
                , textarea [ class "mb6 bg-transparent bn", id "exercise-name" ]
                    []
                , div [ backgroundImageStyle "./assets/zigzag_stim_how_to_bg.svg" 100, class "flex flex-column mb3" ]
                    [ label [ for "exercise-intstructions", class "b h6 ml3 mr3" ]
                        [ text "how do you do this exercise?" ]
                    , p [ class "ml3 mr3" ]
                        [ text "Be as specific as you can so that next time you want to do this exercise, you know exactly what to do." ]
                    , textarea
                        [ class "mb5 bg-transparent bn ml3 mr3", id "exercise-intstructions" ]
                        []
                    ]
                , div [ class "flex flex-column ml3 mr3" ]
                    [ img [ src "./assets/add_video_icn.svg", class " flex justify-center mb4" ] []
                    , div [ class "flex flex-column items-center justify-center  ba bw1 b--gray br3 pa3 mb3 ml3 mr3" ]
                        [ label [ class "b", for "add-a-video" ]
                            [ text "Add a video"
                            ]
                        , p [] [ text "Did you come across a video that might help you or your friends to follow this exercise? Search and add it here so that you can always go back to it later!" ]
                        ]
                    , label [ for "youtube-search", class "mb2 ml3 mr3" ] [ text "Find a video on YouTube" ]
                    , div []
                        [ input [ type_ "text", onInput UpdateVideoSearch, class "flex-column ba bw1 b--gray br1 ml3 mr3 mb3 pa1", placeholder "hand press" ] []
                        , button [ onClick CallVideoRequest, class "flex bg-green br1 bn pa2 ml3 mr3" ] [ text "Search" ]
                        , div [] (List.map videoYT model.videos)
                        ]
                    ]
                , div [ class "flex flex-column justify-center ml3 mr3" ]
                    [ img [ src "./assets/done_green_medium.svg" ] []
                    ]
                ]
            ]
        ]


renderBodyparts : List BodyPart -> List (Html Msg)
renderBodyparts bodypartList =
    List.map bodyButton bodypartList
