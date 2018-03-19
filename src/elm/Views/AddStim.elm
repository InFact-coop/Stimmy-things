module Views.AddStim exposing (..)

import Components.Video exposing (videoYT)
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
        , div [ class "flex items-center justify-center" ]
            [ img [ src "./assets/zigzag_big_grey_down.svg", class " flex justify-center ma3" ] []
            ]
        , div
            [ class "ma0" ]
            [ Html.form [ class "flex flex-column f6 ml3 mr3" ]
                [ label [ for "choose-exercise" ] []
                , p [ class "f6 b " ]
                    [ text "Choose a part of the body" ]
                , p [] [ text "I want to calm my ..." ]
                , p [ class "mb3" ] [ text " I am feeling anxious around my ..." ]
                , textarea [ class "mb5", id "choose-exercise" ] [ text "Exercises go here" ]
                , label [ for "exercise-name", class "b h6" ] [ text "what would you call this exercise?" ]
                , textarea [ class "mb4", id "exercise-name" ] []
                , label [ for "exercise-intstructions", class "b h6" ] [ text "how do you do this exercise?" ]
                , p [] [ text "Be as specific as you can so that next time you want to do this exercise, you know exactly what to do." ]
                , textarea [ class "mb5", id "exercise-intstructions" ] []
                , div [ class "flex items-center justify-center" ]
                    [ img [ src "./assets/add_video_icn.svg", class " flex justify-center mb4" ] []
                    ]
                , div [ class "flex flex-column items-center ba bw1 b--gray br3 pa3 mb3 " ]
                    [ label [ class "b", for "add-a-video" ]
                        [ text "Add a video"
                        ]
                    , p [] [ text "Did you come across a video that might help you or your friends to follow this exercise? Search and add it here so that you can always go back to it later!" ]
                    ]
                , label [ for "youtube-search", class "mb2" ] [ text "Find a video on YouTube" ]
                , div []
                    [ input [ type_ "text", onInput UpdateVideoSearch, class "flex-column ba bw1 b--gray br1 mb3 pa1", placeholder "hand press" ] []
                    , button [ onClick CallVideoRequest, class "flex bg-green br1 bn pa2" ] [ text "Search" ]
                    , div [] (List.map videoYT model.videos)
                    ]
                , div [ class "flex flex-column justify-center" ]
                    [ img [ src "./assets/done_green_medium.svg" ] []
                    ]
                ]
            ]
        ]
