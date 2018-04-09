module Components.NavDrawer exposing (..)

import Helpers.Style exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


navDrawer : Model -> Html Msg
navDrawer model =
    nav [ classes [ "pa2", "fixed", "z-1", "bg-green-translucent", "top-4", showNavClass model.showNav, "z-5" ] ]
        [ drawerItem "./assets/Landing/menu-drawer/about_btn.svg" About
        , drawerItem "./assets/Landing/menu-drawer/blog_btn.svg" Blog
        , drawerItem "./assets/Landing/menu-drawer/user_btn.svg" CreateAvatar
        , drawerItem "./assets/Landing/menu-drawer/emergency_btn.svg" Emergency
        ]


drawerItem : String -> View -> Html Msg
drawerItem imgSrc view =
    button [ classes [ "db", "pointer", "h4", "w4", "mb1", "bn", "bg-transparent" ], onClick <| NavigateTo view, backgroundImageStyle imgSrc 100 ] []


showNavClass : Trilean -> String
showNavClass trilean =
    case trilean of
        Yes ->
            "enterNav"

        No ->
            "exitNav"

        Neutral ->
            "dn"
