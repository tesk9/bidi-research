module StyleElements exposing (view)

import Bidi exposing (helloWorld)
import Color
import Element exposing (..)
import Html
import Root exposing (Root)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font


view : List Root -> Html.Html msg
view model =
    layout elementStyleSheet <|
        h1 Header
            []
            --NOTE: using `html` is discouraged by the library author
            (html helloWorld)


type Styles
    = Header


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
