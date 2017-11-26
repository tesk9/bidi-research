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
    { roots = []
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
    asUnorderedList (List.map viewRoot roots)


viewRoot : Root -> Html msg
viewRoot root =
    text "Root"


asUnorderedList : List (Html msg) -> Html msg
asUnorderedList items =
    ul [] (List.map (\item -> li [] [ item ]) items)
