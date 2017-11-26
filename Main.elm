module Main exposing (..)

import ArabicHtml exposing (..)
import Html exposing (..)


main : Program Never () msg
main =
    beginnerProgram
        { view = view
        , update = \msg () -> ()
        , model = ()
        }


view : a -> Html msg
view model =
    a_إنجليزي
        [ a_إنجليزي [ text "اهلاً" ]
        , a_عربي [ text ", World!" ]
        ]
