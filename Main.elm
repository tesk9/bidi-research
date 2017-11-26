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
            [ ( "display", "flex" )
            , ( "justify-content", "space-between" )
            ]
        ]
        [ section "tesk9/accessible-html"
            (AccessibleHtml.view model.roots)
        , section "mdgriffith/style-elements"
            (StyleElements.view model.roots)
        , section "rtfeldman/elm-css"
            (ElmCss.view model.roots)
        ]


section : String -> Html.Html msg -> Html.Html msg
section title content =
    Html.section
        [ Html.Attributes.style [ ( "margin", "20px" ) ] ]
        [ h1 title, content ]


h1 : String -> Html.Html msg
h1 val =
    Html.h1
        [ Html.Attributes.style [ ( "text-align", "center" ) ] ]
        [ Html.text val ]
