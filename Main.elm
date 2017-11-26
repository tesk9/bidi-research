module Main exposing (..)

import AccessibleHtml
import ArabicHtml exposing (helloWorld)
import Css
import Css.Colors
import Html
import Html.Styled
import Html.Styled.Attributes
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
        , elmCss
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
