module Views.AddStim exposing (..)

import Components.PillButton exposing (..)
import Components.Video exposing (videoYT)
import Data.Bodyparts exposing (bodyparts)
import Helpers.Style exposing (..)
import Helpers.Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


addStim : Model -> Html Msg
addStim model =
    div [ class "bg-washed-yellow", verticalTransition model ]
        [ div [ class "bg-green center tc" ]
            [ div [ class "flex flex-row items-center justify-center relative" ]
                [ div [ class "absolute left-0 ml3 pointer", onClick (NavigateTo Landing) ] [ img [ src "./assets/AddStim/close_btn_white.svg" ] [] ]
                , h1 [ classes [ headerFont, "white pt3 mb3" ] ]
                    [ text "Add new stim" ]
                ]
            ]
        , div
            [ class "ma0" ]
            [ Html.form [ class "flex flex-column lh-f6 f6" ]
                [ div
                    [ backgroundImageCover "./assets/AddStim/zigzag_choose_part_tags_bg.svg"
                    , class "flex flex-column mb3 pb3 h-fit-content"
                    ]
                    [ img [ class "ma3", src "./assets/AddStim/zigzag_big_grey_down.svg" ] []
                    , label
                        [ for "choose-exercise", class "mh3" ]
                        []
                    , p [ class "mv0 mh3 b" ] [ text "Choose a part of the body" ]
                    , p [ class "mv0 mh3" ] [ text "I want to calm my ..." ]
                    , p [ class "mv0 mh3" ] [ text " I am feeling anxious around my ..." ]
                    , div [ class " flex flex-wrap justify-center mv4 white" ] (renderBodyparts bodyparts model)
                    ]
                , label [ for "exercise-name", class "b mh3 " ] [ text "what would you call this exercise?" ]
                , textarea [ class "mb6 bg-transparent bn h-textarea-small", id "exercise-name", onInput AddExerciseName ]
                    []
                , div [ backgroundImageCover "./assets/AddStim/zigzag_stim_how_to_bg.svg", class "h-fit-content flex flex-column mb3 pt3" ]
                    [ label [ for "exercise-intstructions", class "b h6 ma3" ]
                        [ text "how do you do this exercise?" ]
                    , p [ class "mh3" ]
                        [ text "Be as specific as you can so that next time you want to do this exercise, you know exactly what to do." ]
                    , textarea
                        [ class "bg-transparent bn ml3 mr3 h-textarea", id "exercise-intstructions", onInput AddHowTo ]
                        []
                    ]
                , div [ class "flex flex-column ml3 mr3" ]
                    [ img [ src "./assets/AddStim/add_video_icn.svg", class " flex justify-center mb4" ] []
                    , div [ class "flex flex-column items-center justify-center ba bw1 b--silver br3 pa3 mb3" ]
                        [ label [ class "b", for "add-a-video" ]
                            [ text "Add a video"
                            ]
                        , p [] [ text "Did you come across a video that might help you or your friends to follow this exercise? Search and add it here so that you can always go back to it later!" ]
                        ]
                    , label [ for "youtube-search", class "mb1 w-30" ]
                        [ img [ src "./assets/AddStim/youtube_logo.png" ] []
                        ]
                    , div []
                        [ input [ type_ "text", onInput UpdateVideoSearch, class "flex-column ba bw1 b--silver br2 mb3 pa1 h2 w-100 black", placeholder "hand press" ] []
                        , button [ onClick CallVideoRequest, class "flex bg-green br2 bn pa2 mb3 white w5 justify-center" ] [ text "Search" ]
                        , viewIf (model.videos /= [])
                            (div [ class "youtubeCarousel mb4" ] (List.map videoYT model.videos))
                        ]
                    ]
                , div
                    [ backgroundImageCover "./assets/AddStim/zigzag_add_stim_save.svg"
                    , class "flex flex-column h-fit-content"
                    ]
                    [ img [ class "mt5", src "./assets/AddStim/done_green_medium.svg" ] []
                    , p [ class "ma4 flex worksans justify-center black " ] [ text "SAVE" ]
                    ]
                ]
            ]
        ]


renderBodyparts : List BodyPart -> Model -> List (Html Msg)
renderBodyparts bodypartList model =
    List.map (bodyButton model) bodypartList
