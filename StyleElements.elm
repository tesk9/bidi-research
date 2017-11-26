module StyleElements exposing (notes, view)

import Bidi exposing (helloWorld)
import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Root exposing (Root)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font


-- NOTES


notes : String
notes =
    (List.map (\str -> "\n - " ++ str) >> String.join "")
        [ """Building an accessible application is harder (note that the
    'list' of roots is not a real list."""
        , """Default styles are lost. Note the size of the hello world heading."""
        , """No control over directionality while using `Element` elements."""
        , """Layout property names using left/right, rather than start/end."""
        ]



-- VIEW


view : List Root -> Html.Html msg
view model =
    layout elementStyleSheet <|
        column Plain [] <|
            [ h2 Header
                []
                --NOTE: using `html` is discouraged by the library author
                (html helloWorld)
            , viewRoots model
            ]


viewRoots : List Root -> Element Styles variation msg
viewRoots roots =
    column Plain [] (List.map viewRoot roots)


viewRoot : Root -> Element Styles variation msg
viewRoot root =
    el Plain [ alignRight ] (text (Root.dashify root))


type Styles
    = Plain
    | Header


elementStyleSheet : Style.StyleSheet Styles variation
elementStyleSheet =
    styleSheet
        [ style Header
            [ Color.text Color.blue
            , Color.border Color.gray
            , Border.solid
            , Border.all 1
            , Font.center
            ]
        ]
