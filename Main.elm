module Main exposing (..)

import ArabicHtml exposing (..)
import Color exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style
import Style.Color as Color
import Style.Font as Font


main : Program Never () msg
main =
    Html.beginnerProgram
        { view = view
        , update = \msg () -> ()
        , model = ()
        }


view : a -> Html.Html msg
view model =
    Html.h1 []
        [ a_إنجليزي
            [ a_إنجليزي [ Html.text "اهلاً" ]
            , a_عربي [ Html.text ", world!" ]
            ]
        , layout stylesheet <|
            el Header [ alignLeft ] (text "Hello World!")
        ]


type Styles
    = Header


stylesheet : Style.StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ Style.style Header
            [ Color.text darkGrey
            , Color.background white
            , Font.size 5
            ]
        ]
