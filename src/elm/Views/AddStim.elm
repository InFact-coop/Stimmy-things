module Views.AddStim exposing (..)

import Components.Video exposing (videoYT)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


addStim : Model -> Html Msg
addStim model =
    div [ class "main ma0 bg-washed-yellow" ]
        [ div
            [ class "bg-green flex flex-column items-center" ]
            [ button [] [ text "go back" ]
            , h1 [ class "white mb8" ]
                [ text "Add new" ]
            , h2 [ class "white mb3" ] [ text "chest" ]
            ]
        , div
            [ class "" ]
            [ Html.form [ class "flex flex-column ma1 p" ]
                [ label [ for "choose-exercise" ] []
                , p [ class "b" ]
                    [ text "Choose a part of the body" ]
                , p [ class "" ] [ text "I want to calm my ..." ]
                , p [ class "mt0" ] [ text " I am feeling anxious around my ..." ]
                , textarea [ id "choose-exercise" ] []
                , label [ for "exercise-name", class "b h6" ] [ text "what would you call this exercise?" ]
                , textarea [ id "exercise-name" ] []
                , label [ for "exercise-intstructions", class "b h6" ] [ text "how do you do this exercise?" ]
                , p [] [ text "Be as specific as you can so that next time you want to do this exercise, you know exactly what to do." ]
                , textarea [ id "exercise-intstructions" ] []
                , label [ for "add-a-video", class "b flex flex-column items-center" ] [ text "Add a video" ]
                , p [ class "pa1 ba-gray" ] [ text "Did you come across a video that might help you or your friends to follow this exercise? Search and add it here so that you can always go back to it later!" ]
                , textarea [ id "exercise-intstructions", placeholder "hand press" ] []
                , label [ for "youtube-search", class "h6" ] [ text "Find a video on YouTube" ]
                , button [ for "add-a-stim" ] [ text "Submit" ]
                ]
            , div [ class "flex flex-column", class "h6" ]
                [ input [ type_ "text", onInput UpdateVideoSearch ] []
                , button [ onClick CallVideoRequest ] [ text "Search" ]
                , div [] (List.map videoYT model.videos)
                ]
            ]
        ]
