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
    { roots : List Root.Root }


model : Model
model =
    { roots = Root.all }


view : Model -> Html.Html msg
view model =
    Html.div []
        [ AccessibleHtml.view model.roots
        , StyleElements.view model.roots
        , ElmCss.view model.roots
        ]
