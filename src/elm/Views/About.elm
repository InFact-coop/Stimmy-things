module Views.About exposing (..)

import Data.Avatar exposing (avatarHeadSelection)
import Helpers.Style exposing (bodyFont, classes, headerFont, horizontalTransition, smallFont, verticalTransition)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


about : Model -> Html Msg
about model =
    div [ classes [ bodyFont, "border-box bg-green flex-column white h-fit-content" ], horizontalTransition model ]
        [ div [ classes [ headerFont, "flex flex-row ma3 mt0 mb0 items-center justify-between h" ] ]
            [ div [ onClick <| NavigateTo Landing, class "h4 w3 flex items-centre" ] [ img [ src "./assets/About/close_btn_white.svg" ] [] ]
            , div [ onClick <| NavigateTo Emergency, class "h4 w3 flex items-centre" ] [ img [ src "./assets/About/help_btn.svg" ] [] ]
            ]
        , div [ class "mh3" ]
            [ object
                [ attribute "data" <| avatarHeadSelection model.avatar, type_ "image/svg+xml", class "avatarHead mh5" ]
                []
            , p [ classes [ headerFont, "tc" ] ] [ text <| "Hi, I'm " ++ model.avatarName ++ "!" ]
            , p [ classes [ headerFont, "tc mb2" ] ] [ text "I'm your stimmy friend." ]
            , p [ class "mb2 tc" ] [ text "Click the glowing spots on my body to find exercises to try." ]
            , p [ class "tc mb4" ] [ text "You can also:" ]
            , div [ class "flex flex-row items-center mb3 ml3" ]
                [ img [ class "mr3", src "./assets/About/add_stim_icn_sm.svg" ] []
                , p [ classes [ smallFont ] ] [ text "'Add' your own exercise" ]
                ]
            , div [ class "flex flex-row items-center mb3 ml3" ]
                [ img [ class "mr3", src "./assets/About/share_icn_sm.svg" ] []
                , p [ classes [ smallFont ] ] [ text "'Share' exercises with others" ]
                ]
            , div [ class "flex flex-row items-center mb3 ml3" ]
                [ img [ class "mr3", src "./assets/About/more_info_icn_sm.svg" ] []
                , p [ classes [ smallFont ] ] [ text "Learn about Stimmy Things" ]
                ]
            ]
        , div [ class "mh3 mb5" ]
            [ img [ class "mb4", src "./assets/About/white_divider_zigzag_thick.svg" ] []
            , p [ classes [ headerFont, "mb2" ] ] [ text "Download Stimmy Things" ]
            , p [ class "mb2" ] [ text "For optimum use, we recommend downloading Stimmy Things as an app rather than viewing it through your browser." ]
            , p [ class "mb4" ] [ text "You can achieve this with a few simple steps:" ]
            , p [ class "b" ] [ text "Android: " ]
            , androidInstructions
            , p [ class "b" ] [ text "iPhone: " ]
            , iPhoneInstructions
            , p [ class "mb4" ] [ text "Congrats! After the initial download, you will be able to use Stimmy Things offline: anytime, anywhere." ]
            , p [ classes [ headerFont, "mb2" ] ] [ text "What is Stimmy Things?" ]
            , p [ class "mb4" ] [ text "Stimmy Things is a webapp for young people affected by ADHD. It allows you to record different exercises that you find useful so you can find and follow them when you need to. It also allows you to share what works for you and see what others in the Stimmy Things network try." ]
            , p [ classes [ headerFont, "mv2" ] ] [ text "Why is it called Stimmy Things?" ]
            , p [ class "mb2" ] [ text "The name came from a young person who attended our workshop." ]
            , p [ class "mb4" ] [ text "Stimming, or self-stimulation, is a repetitive action we can use to refocus and gain a sense of calm" ]
            , p [ classes [ headerFont, "mv2" ] ] [ text "Who made Stimmy Things?" ]
            , p [ class "mb2" ] [ text "Stimmy Things is the result of close collaboration between SLaM, the CYPI-APT London and inFact Coop (as part of Founders and Coders). It was co-created with young people and clinicians from SLaM. Most, if not all, of the ideas in Stimmy Things were ideated by and tested with young people with ADHD." ]
            , p [ class "mb4" ] [ text "We would like to thank all of those from SLaM, CYPI-APT and the young people and their families who participated in our workshops and helped us with user testing. This couldn't have happened without their support and general awesomeness!" ]
            , p [ classes [ headerFont, "mv2" ] ] [ text "Contact us if you have any questions!" ]
            , p [] [ text "inFact Coop" ]
            , p [ class "mb3" ] [ text "hello@infact.coop.com" ]
            , p [] [ text "SLaM" ]
            , p [ class "mb3" ] [ text "hello@slam.com" ]
            , p [] [ text "CYPI-APT" ]
            , p [ class "mb2" ] [ text "hello@cypiapt.com" ]
            ]
        ]


androidInstructions : Html Msg
androidInstructions =
    div [ class "mb3" ]
        [ p [] [ span [ class "mr3" ] [ text "1." ], span [] [ text "Launch Chrome for Android" ] ]
        , p []
            [ span [ class "mr3" ] [ text "2." ]
            , span []
                [ text
                    "Navigate to the Stimmy Things website"
                ]
            ]
        , p [] [ span [ class "mr3" ] [ text "3." ], span [] [ text "Tap the menu button and tap ‘Add to homescreen’" ] ]
        , p []
            [ span [ class "mr3" ] [ text "4." ]
            , span []
                [ text "You'll be able to enter a name for the shortcut and then Chrome will add it to your home screen." ]
            ]
        ]


iPhoneInstructions : Html Msg
iPhoneInstructions =
    div [ class "mb3" ]
        [ p [] [ span [ class "mr3" ] [ text "1." ], span [] [ text "Open Safari" ] ]
        , p []
            [ span [ class "mr3" ] [ text "2." ]
            , span []
                [ text
                    "Navigate to the Stimmy Things website"
                ]
            ]
        , p [] [ span [ class "mr3" ] [ text "3." ], span [] [ text "Tap the 'Go To' icon" ] ]
        , p []
            [ span [ class "mr3" ] [ text "4." ]
            , span []
                [ text "Then select 'Add to Homescreen'" ]
            ]
        , p []
            [ span [ class "mr3" ] [ text "5." ]
            , span [] [ text "The shortcut to the website will now appear as an icon on your home screen. " ]
            ]
        ]
