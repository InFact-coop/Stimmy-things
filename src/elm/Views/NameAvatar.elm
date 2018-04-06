module Views.NameAvatar exposing (..)

import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (classes, headerFont, horizontalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Types exposing (..)


nameAvatar : Model -> Html Msg
nameAvatar model =
    div [ class "border-box flex-column tc h-fit-content", horizontalTransition model ]
        [ div [ class "flex flex-row ma3 mt0 mb0 items-center justify-between h" ]
            [ div [ onClick <| NavigateTo CreateAvatar, class "h4 w3 flex items-centre justify-left" ] [ img [ src "./assets/NameAvatar/back_arrow_green.svg" ] [] ]
            , div [ class "h4 mw5 flex flex-column items-centre justify-center" ]
                [ p [ classes [ headerFont, "ma0 left-0 right-0 green" ] ] [ text "What's their name?" ]
                , p [ class "ma0 left-0 right-0 dark-gray lh-f5 f5" ] [ text "Choose your avatar" ]
                ]
            , div [ onClick SaveOrUpdateUser, class "h4 w3 flex items-centre justify-right" ]
                [ img [ src "./assets/CreateAvatar/done_green_small.svg" ] [] ]
            ]
        , div []
            [ object
                [ attribute "data" <| avatarHeadSelection model.avatar, type_ "image/svg+xml", class "mt6 mb7 mh7 w6 avatarHead" ]
                []
            ]
        , input [ classes [ headerFont, "border-box b--silver black w-80 br2 outline-0 pa3 h3" ], maxlength 15, placeholder "Name", onInput AddAvatarName, onKeyDown KeyDownFromName, value model.avatarName ] []
        ]


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)
