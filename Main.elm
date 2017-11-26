module Main exposing (..)

import AccessibleHtml
import ElmCss
import Html
import StyleElements


main : Program Never () msg
main =
    Html.beginnerProgram
        { view = view
        , update = \msg () -> ()
        , model = ()
        }


view : a -> Html.Html msg
view model =
    Html.div []
        [ AccessibleHtml.view
        , StyleElements.view
        , ElmCss.view
        ]
