module Views.AddStim exposing (..)

import Components.Video exposing (videoYT)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


addStim : Model -> Html Msg
addStim model =
    div [ class "bg-green br0 ma0 " ]
        [ text "hello"
        , div
            [ class "bg-white" ]
            [ Html.form [ class "flex flex-column br0 ma0" ]
                [ label [ for "exercise-name" ] [ text "what would you call this exercise?" ]
                , textarea [ id "exercise-name" ] []
                , label [ for "exercise-intstructions" ] [ text "how do you do this exercise?" ]
                , p [] [ text "Be as specific as you can so that next time you want to do this exercise, you know exactly what to do." ]
                , textarea [ id "exercise-intstructions" ] []
                , label [ for "add-a-video" ] [ text "Add a video" ]
                , p [] [ text "Did you come across a video that might help you or your friends to follow this exercise? Search and add it here so that you can always go back to it later!" ]
                , textarea [ id "exercise-intstructions", placeholder "hand press" ] []
                , label [ for "youtube-search" ] [ text "Find a video on YouTube" ]
                , button [ for "add-a-stim" ] [ text "Submit" ]
                ]
            , div [ class "flex flex-column" ]
                [ input [ type_ "text", onInput UpdateVideoSearch ] []
                , button [ onClick CallVideoRequest ] [ text "Search" ]
                , div [] (List.map videoYT model.videos)
                ]
            ]
        ]
