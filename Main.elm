module Main exposing (..)

import Accessibility as Html
import ArabicHtml exposing (..)
import Color
import Css
import Css.Colors
import Element
import Element.Attributes
import Html.Styled
import Html.Styled.Attributes
import Style
import Style.Color
import Style.Font


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
        , Element.layout elementStyleSheet <|
            Element.el Header [ Element.Attributes.alignLeft ] (Element.text "Hello World!")
        , Html.Styled.toUnstyled logo
        ]


type Styles
    = Header


elementStyleSheet : Style.StyleSheet Styles variation
elementStyleSheet =
    Style.styleSheet
        [ Style.style Header
            [ Style.Color.text Color.darkGrey
            , Style.Color.background Color.white
            , Style.Font.size 5
            ]
        ]


{-| Taken from the elm-css examples.
-}
logo : Html.Styled.Html msg
logo =
    Html.Styled.img
        [ Html.Styled.Attributes.src "https://yt3.ggpht.com/-MTyGz2Ak6EE/AAAAAAAAAAI/AAAAAAAAAAA/4bxyjOzC690/s900-c-k-no-mo-rj-c0xffffff/photo.jpg"
        , Html.Styled.Attributes.css
            [ Css.width (Css.px 200)
            , Css.display Css.inlineBlock
            , Css.padding (Css.px 20)
            , Css.border3 (Css.px 5) Css.solid (Css.rgb 120 120 120)
            , Css.hover
                [ Css.borderColor Css.Colors.red
                , Css.borderRadius (Css.px 10)
                ]
            ]
        ]
        []
