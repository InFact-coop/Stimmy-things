module Views.DeleteModal exposing (..)

import Components.Button exposing (stimButton)
import Helpers.Style exposing (backgroundImageStyle, classes, headerFont, verticalTransition)
import Helpers.Utils exposing (ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


deleteModal : Model -> Html Msg
deleteModal model =
    div [ verticalTransition model, class "bg-green vh-100 justify-center items-center flex flex-column", backgroundImageStyle "./assets/ShareModal/zigzag_modal_bg.svg" 90 ]
        [ img [ src "./assets/ShareModal/share_to_blog_icn.svg", class " justify-center items-center flex flex-column mb2" ] []
        , div [ class " w-80 justify-center items-center flex flex-column tc" ]
            [ p [ classes [ headerFont, "mb3" ] ] [ text "Hey you!" ]
            , p [ classes [ headerFont, "mb3" ] ] [ text "You are about to delete a stim." ]
            , p [ class "mb3" ] [ text "We just want to make sure that you know it will be forever gone!" ]
            , div [ class "mb3 w-100 tc" ]
                [ stimButton "Yes, delete!" (DeleteStim model.selectedStim) "bg-green" ]
            , a [ class "mb3 green underline", onClick (NavigateTo Landing) ] [ text "No, I changed my mind" ]
            ]
        ]


ifStimShared : Stim -> Html Msg
ifStimShared stim =
    ifThenElse
        stim.shared
        (stimButton
            "Stim shared!"
            NoOp
            "bg-light-green"
        )
        (stimButton
            "Yes please!"
            (ShareStim stim)
            "bg-green"
        )
