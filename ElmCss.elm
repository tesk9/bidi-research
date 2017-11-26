module ElmCss exposing (notes, view)

-- we can only expose css from Html.Styled.Attributes due to a conflict on `fromUnstyled`

import Bidi exposing (helloWorld)
import Css exposing (..)
import Css.Colors exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, style)
import Root exposing (Root)


-- NOTES


notes : String
notes =
    (List.map (\str -> "\n - " ++ str) >> String.join "")
        [ """I can't expose all of `Html.Styled.Attributes` and
    `Html.Styled.Attributes` as easily as I would like,
    since a function called `fromUnstyled` exists in both."""
        , """`toUnstyled` doesn't result in unstyled html; it goes from
    style-able elm-css html (`Html.Styled.Html msg`) to `Html msg`."""
        , """elm-css is also missing [the css property `direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/direction),
    although it contains the `:dir` pseudoclass and `Html.Styled.Attributes`
    contains the `dir` property."""
        ]



-- VIEW


view : List Root -> Html.Html msg
view model =
    toUnstyled <|
        div []
            [ h3
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
