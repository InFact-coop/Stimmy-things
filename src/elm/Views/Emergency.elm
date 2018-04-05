module Views.Emergency exposing (..)

import Html exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (horizontalTransition, verticalTransition, classes, headerFont, bodyFont, smallFont)
import Html.Events exposing (onClick)


emergency : Model -> Html Msg
emergency model =
    div
        [ verticalTransition model, classes [ bodyFont, "border-box bg-green flex-column white h-fit-content" ], horizontalTransition model ]
        [ div [ class "center tc" ]
            [ div [ class "flex flex-row items-center justify-center relative h4" ]
                [ div [ class "absolute left-0 ml3 pointer pa1", onClick (NavigateTo Landing) ] [ img [ src "./assets/AddStim/back_btn_white.svg" ] [] ]
                , h1 [ classes [ headerFont, "white pt3 mb3" ] ]
                    [ text "If you need help now:" ]
                ]
            ]
        , div [ class "mh3" ]
            [ object
                [ attribute "data" <| avatarHeadSelection model.avatar, type_ "image/svg+xml", class "avatarHead mh5" ]
                []
            , p [ classes [ headerFont, "tc mb4" ] ] [ text "Here are some helpful links if you need immediate help." ]
            , div [ class "mb5" ]
                [ img [ class "mb4", src "./assets/About/white_divider_zigzag_thick.svg" ] []
                , p [ classes [ headerFont, "mb2" ] ] [ text "Emergency numbers:" ]
                , p [ class "di" ] [ text "In an emergency call " ]
                , a [ class "di", href "tel:+44999" ] [ text "999" ]
                , p [ class "di " ] [ text " for the police, fire brigade or ambulance." ]
                , p [ class "di" ] [ text " If it isn't an emergency, call " ]
                , a [ class "di", href "tel:+44101" ] [ text "101" ]
                , p [ classes [ headerFont, "mt3 mb2" ] ] [ text "Helplines:" ]
                , p [ class "mt3" ] [ text "Samaritans:" ]
                , a [ href "tel:+44116123" ] [ text "116 123" ]
                , p [ class "mt3" ] [ text "Childline:" ]
                , a [ href "tel:+448001111" ] [ text "0800 1111" ]
                , p [ class "mt3" ] [ text "Runaway Helpline:" ]
                , a [ href "tel:+44116000" ] [ text "116 000" ]
                , p [ class "mt3" ] [ text "NSPCC Child Protection:" ]
                , a [ href "tel:+448088005000" ] [ text "0808 800 5000" ]
                , p [ class "mt3" ] [ text "Maudsley Hospital:" ]
                , a [ href "tel:+442032286000" ] [ text "020 3228 6000" ]
                ]
            ]
        ]
