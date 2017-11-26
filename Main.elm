module Main exposing (..)

import AccessibleHtml
import ElmCss
import Html
import StyleElements


main : Program Never Model msg
main =
    Html.beginnerProgram
        { view = view
        , update = \msg model -> model
        , model = model
        }


type alias Model =
    { accessibleHtml : AccessibleHtml.Model }


model : Model
model =
    { accessibleHtml = AccessibleHtml.init {} }


view : Model -> Html.Html msg
view model =
    Html.div []
        [ AccessibleHtml.view model.accessibleHtml
        , StyleElements.view
        , ElmCss.view
        ]
