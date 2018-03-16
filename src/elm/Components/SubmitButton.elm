module Components.SubmitButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


submitButton : String -> Html Msg
submitButton buttonText =
    div [ class "flex items-center justify-center" ]
        [ input [ class "dn", type_ "submit" ]
            []
        , label [ class "items-center justify-center bg-green br2 w-100 white pa2 ma2", for buttonText ]
            [ text buttonText ]
        ]
