module Views.Blog exposing (..)

import Helpers.Utils exposing (ifThenElse)
import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


blog : Model -> Html Msg
blog model =
    div [ horizontalTransition model ]
        [ p [ onClick <| NavigateTo Landing ] [ text "Go back" ]
        , div [ class "mh4" ]
            [ div [ class "flex flex-wrap items-center justify-between" ] (renderBlogStims model)
            ]
        ]


renderBlogStims : Model -> List (Html Msg)
renderBlogStims model =
    List.map
        (\firebaseStim ->
            div []
                [ p [] [ text firebaseStim.stim.stimName ]
                , p []
                    [ text firebaseStim.stim.instructions ]
                , addOrDoStim (alreadyExistsInIndexedDB firebaseStim.stim model) firebaseStim.stim
                ]
        )
        model.blogStims


alreadyExistsInIndexedDB : Stim -> Model -> Bool
alreadyExistsInIndexedDB blogStim model =
    let
        stimIdList =
            List.map (\stim -> stim.stimId) model.stims
    in
        List.member blogStim.stimId stimIdList


addOrDoStim : Bool -> Stim -> Html Msg
addOrDoStim bool stim =
    ifThenElse bool (button [ onClick <| GoToStim stim ] [ text "Do this stim!" ]) (button [ onClick <| ImportStim stim ] [ text "Add to my stims!" ])
