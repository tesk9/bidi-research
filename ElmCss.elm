module ElmCss exposing (view)

-- we can only expose css from Html.Styled.Attributes due to a conflict on `fromUnstyled`

import Bidi exposing (helloWorld)
import Css exposing (..)
import Css.Colors exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, style)
import Root exposing (Root)


view : List Root -> Html.Html msg
view model =
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
            , viewRoots model
            ]


viewRoots : List Root -> Html msg
viewRoots roots =
    asRTLUnorderedList (List.map viewRoot roots)


viewRoot : Root -> Html msg
viewRoot root =
    text (Root.dashify root)


asRTLUnorderedList : List (Html msg) -> Html msg
asRTLUnorderedList items =
    -- elm-css is missing the direction property
    ul [ style [ ( "direction", "rtl" ) ] ]
        (List.map (\item -> li [] [ item ]) items)
