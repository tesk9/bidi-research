module AccessibleHtml exposing (Model, init, view)

import Accessibility exposing (..)
import Bidi exposing (helloWorld)
import Html.Attributes exposing (style)


-- FLAGS


type alias Flags =
    {}



-- MODEL


type alias Model =
    { roots : List Root
    }


type Root
    = ThreeLetter Char Char Char



-- INIT


init : Flags -> Model
init flags =
    { roots = [ ThreeLetter 'د' 'ر' 'س' ]
    }



-- VIEW


view : Model -> Html msg
view model =
    section []
        [ h1
            [ style
                [ ( "color", "blue" )
                , ( "border", "1px solid gray" )
                , ( "text-align", "center" )
                ]
            ]
            [ helloWorld ]
        , main_ []
            [ viewRoots model.roots
            ]
        ]


viewRoots : List Root -> Html msg
viewRoots roots =
    asRTLUnorderedList (List.map viewRoot roots)


viewRoot : Root -> Html msg
viewRoot root =
    text (dashifyRoot root)


asRTLUnorderedList : List (Html msg) -> Html msg
asRTLUnorderedList items =
    ul [ style [ ( "direction", "rtl" ) ] ]
        (List.map (\item -> li [] [ item ]) items)


dashifyRoot : Root -> String
dashifyRoot root =
    case root of
        ThreeLetter char1 char2 char3 ->
            --TODO: add setting for viewing left to right & right to left
            String.fromChar char1 ++ "-" ++ String.fromChar char2 ++ "-" ++ String.fromChar char3
