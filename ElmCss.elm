module ElmCss exposing (view)

-- we can only expose css from Html.Styled.Attributes due to a conflict on `fromUnstyled`

import ArabicHtml exposing (helloWorld)
import Css exposing (..)
import Css.Colors exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : Html.Html msg
view =
    toUnstyled <|
        section []
            [ h1
                [ css
                    [ color blue
                    , border3 (px 1) solid gray
                    , textAlign center
                    ]
                ]
                [ fromUnstyled helloWorld ]
            ]
