module AccessibleHtml exposing (view)

import Accessibility exposing (..)
import ArabicHtml exposing (helloWorld)
import Html.Attributes exposing (style)


view : Html msg
view =
    section []
        [ h1
            [ style
                [ ( "color", "blue" )
                , ( "border", "1px solid gray" )
                , ( "text-align", "center" )
                ]
            ]
            [ helloWorld ]
        ]
