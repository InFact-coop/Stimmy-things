module Views.Blog exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)


blog : Model -> Html Msg
blog model =
    div [ horizontalTransition model ] (renderBlogStims model)


renderBlogStims : Model -> List (Html Msg)
renderBlogStims model =
    List.map (\stim -> div [] [ p [] [ text stim.stimName ], p [] [ text stim.instructions ] ]) model.blogStims
