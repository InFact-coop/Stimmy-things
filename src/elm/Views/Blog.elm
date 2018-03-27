module Views.Blog exposing (..)

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
        (\stim ->
            div []
                [ p [] [ text stim.stimName ]
                , p [] [ text stim.instructions ]
                , button [ onClick <| ImportStim stim ] [ text "Add to my stims!" ]
                ]
        )
        model.blogStims
