module Main exposing (..)

import Accessibility as Html
import ArabicHtml exposing (..)
import Color
import Css
import Css.Colors
import Element
import Element.Attributes
import Html.Attributes
import Html.Styled
import Html.Styled.Attributes
import Style
import Style.Color


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
        [ accessibleHtml
        , styleElements
        , elmCss
        ]


helloWorld : Html.Html msg
helloWorld =
    a_إنجليزي
        [ a_إنجليزي [ Html.text "اهلاً" ]
        , a_عربي [ Html.text ", world!" ]
        ]



--ACCESSIBLE HTML


accessibleHtml : Html.Html msg
accessibleHtml =
    Html.section []
        [ Html.h1
            [ Html.Attributes.style [ ( "color", "blue" ) ] ]
            [ helloWorld ]
        ]



--STYLE ELEMENTS


styleElements : Html.Html msg
styleElements =
    Element.layout elementStyleSheet <|
        Element.h1 Header
            [ Element.Attributes.alignLeft ]
            --NOTE: using `Element.html` is discouraged by the library author
            (Element.html helloWorld)


type Styles
    = Header


elementStyleSheet : Style.StyleSheet Styles variation
elementStyleSheet =
    Style.styleSheet
        [ Style.style Header
            [ Style.Color.text Color.blue
            ]
        ]



--ELM CSS


elmCss : Html.Html msg
elmCss =
    Html.Styled.toUnstyled <|
        Html.Styled.section []
            [ Html.Styled.h1
                [ Html.Styled.Attributes.css [ Css.color Css.Colors.blue ] ]
                [ Html.Styled.fromUnstyled helloWorld ]
            ]
