module Main exposing (..)

import AccessibleHtml
import ElmCss
import Html
import Root
import StyleElements


main : Program Never Model msg
main =
    Html.beginnerProgram
        { view = view
        , update = \msg model -> model
        , model = model
        }


type alias Model =
    {}


model : Model
model =
    {}


view : Model -> Html.Html msg
view model =
    Html.div []
        [ AccessibleHtml.view Root.all
        , StyleElements.view Root.all
        , ElmCss.view Root.all
        ]
