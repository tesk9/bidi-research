module AccessibleHtml exposing (notes, view)

import Accessibility exposing (..)
import Bidi exposing (helloWorld)
import Html.Attributes exposing (style)
import Root exposing (Root)


-- NOTES


notes : String
notes =
    """ """



-- VIEW


view : List Root -> Html msg
view model =
    div []
        [ h2
            [ style
                [ ( "color", "blue" )
                , ( "border", "1px solid gray" )
                , ( "text-align", "center" )
                ]
            ]
            [ helloWorld ]
        , main_ []
            [ viewRoots model
            ]
        ]


viewRoots : List Root -> Html msg
viewRoots roots =
    asRTLUnorderedList (List.map viewRoot roots)


viewRoot : Root -> Html msg
viewRoot root =
    text (Root.dashify root)


asRTLUnorderedList : List (Html msg) -> Html msg
asRTLUnorderedList items =
    ul [ style [ ( "direction", "rtl" ) ] ]
        (List.map (\item -> li [] [ item ]) items)
