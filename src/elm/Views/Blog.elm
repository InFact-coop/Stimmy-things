module Views.Blog exposing (..)

import Helpers.Style exposing (horizontalTransition)
import Html exposing (..)
import Types exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


blog : Model -> Html Msg
blog model =

div [ horizontalTransition model, class "bg-washed-yellow black" ]
        [ div [ class "bg-green center tc" ]
            [ div [ class "flex flex-row items-center justify-center relative" ]
                [ div
                    [ class "absolute left-0 ml3 pointer"
                    , onClick <| NavigateTo Landing
                    ]
                    [ img [ src "./assets/StimPreparation/back_btn_white.svg" ] [] ]
                , h1 [ classes [ headerFont, "white pt3 mb3" ] ] [ text "Stimmy Stuff" ]
                ]
            , button
                [ classes
                    [ "green br-pill pa1 w5 mb4 bg-white bn"
                    , bodyFont
                    ]
                ]
                [ text "Blog"]
            ]
            , div [ class "flex flex-column items-center mb3" ]
            [ img [ src "./assets/StimInfo/divider_zigzag_grey_small.svg", class "pa2" ] []
            , div [ ]
            [ div [ ] (renderBlogStims model)
            ]



renderBlogStims : Model -> List (Html Msg)
renderBlogStims model =
    List.map
        (\stim ->
            div []
                [ img [ src "./assets/StimInfo/divider_zigzag_grey_small.svg", class "pa2" ] []
                , div [ backgroundImageCover "./assets/AddStim/zigzag_stim_how_to_bg.svg"
        , class "flex flex-column items-center" ] [
                p [ classes [headerFont "black"]] [ text stim.stimName ]
                , p [classes [headerFont "black"]] [ text "How to do this:"]
                , p [classes [bodyFont "black"]] [ text stim.instructions ]
                , button [ onClick <| ImportStim stim ] [ text "Add to my stims!" ]
                ]
                ]
        )
        model.blogStims
