module Views.ShareModal exposing (..)

import Helpers.Style exposing (backgroundImageStyle, classes, verticalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


shareModal : Model -> Html Msg
shareModal model =
    div [ verticalTransition model, class "bg-green vh-100 justify-center items-center flex flex-column", backgroundImageStyle "./assets/ShareModal/zigzag_modal_bg.svg" 90 ]
        [ img [ src "./assets/ShareModal/share_to_blog_icn.svg", class " justify-center items-center flex flex-column mb2" ] []
        , div [ class " w-80 justify-center items-center flex flex-column" ]
            [ p [ class "mb3" ] [ text "stim name goes here" ]
            , p [ class "mb3" ] [ text "If it works for you, it might work for others!" ]
            , p [ class "mb3" ] [ text "share your wisdom with others on the Stimmy Things network!" ]
            , button
                [ class "mb3", onClick <| ShareStim model.selectedStim ]
                [ text "Yes please!" ]
            , p [ class "mb3" ] [ text "no thanks, maybe later" ]
            ]
        ]
