module Main exposing (..)

import Accessibility as Html
import ArabicHtml exposing (helloWorld)
import Color
import Css
import Css.Colors
import Element
import Html.Attributes
import Html.Styled
import Html.Styled.Attributes
import Style
import Style.Border
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
    Html.div []
        [ accessibleHtml
        , styleElements
        , elmCss
        ]



--ACCESSIBLE HTML


accessibleHtml : Html.Html msg
accessibleHtml =
    Html.section []
        [ Html.h1
            [ Html.Attributes.style
                [ ( "color", "blue" )
                , ( "border", "1px solid gray" )
                , ( "text-align", "center" )
                ]
            ]
            [ helloWorld ]
        ]



--STYLE ELEMENTS


styleElements : Html.Html msg
styleElements =
    Element.layout elementStyleSheet <|
        Element.h1 Header
            []
            --NOTE: using `Element.html` is discouraged by the library author
            (Element.html helloWorld)


type Styles
    = Header


elementStyleSheet : Style.StyleSheet Styles variation
elementStyleSheet =
    Style.styleSheet
        [ Style.style Header
            [ Style.Color.text Color.blue
            , Style.Color.border Color.gray
            , Style.Border.solid
            , Style.Border.all 1
            , Style.Font.center
            ]
        ]



--ELM CSS


elmCss : Html.Html msg
elmCss =
    Html.Styled.toUnstyled <|
        Html.Styled.section []
            [ Html.Styled.h1
                [ Html.Styled.Attributes.css
                    [ Css.color Css.Colors.blue
                    , Css.border3 (Css.px 1) Css.solid Css.Colors.gray
                    , Css.textAlign Css.center
                    ]
                ]
                [ Html.Styled.fromUnstyled helloWorld ]
            ]
