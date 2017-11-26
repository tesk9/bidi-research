module Main exposing (..)

import AccessibleHtml
import ElmCss
import Html
import Html.Attributes
import Root
import StyleElements


main : Program Never Model msg
main =
    Html.beginnerProgram
        { view = view
        , update = \msg model -> model
        , model = model
        }


type alias Model =
    { roots : List Root.Root }


model : Model
model =
    { roots = Root.all }


view : Model -> Html.Html msg
view model =
    Html.div
        [ Html.Attributes.style
            [ ( "min-height", "90vh" )
            , ( "display", "flex" )
            , ( "align-items", "stretch" )
            , ( "justify-content", "space-between" )
            ]
        ]
        [ section "tesk9/accessible-html"
            (AccessibleHtml.view model.roots)
            AccessibleHtml.notes
        , section "mdgriffith/style-elements"
            (StyleElements.view model.roots)
            StyleElements.notes
        , section "rtfeldman/elm-css"
            (ElmCss.view model.roots)
            ElmCss.notes
        ]


section : String -> Html.Html msg -> String -> Html.Html msg
section title content notes =
    Html.section
        [ Html.Attributes.style
            [ ( "margin", "10px" )
            , ( "padding", "10px" )
            , ( "border", "2px solid black" )
            ]
        ]
        [ h1 title, content, Html.div [] [ Html.text notes ] ]


h1 : String -> Html.Html msg
h1 val =
    Html.h1
        [ Html.Attributes.style [ ( "text-align", "center" ) ] ]
        [ Html.text val ]
