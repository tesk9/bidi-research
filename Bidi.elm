module Bidi exposing (helloWorld)

import Html exposing (..)
import Html.Attributes exposing (..)


{-| say hello, world.
-}
helloWorld : Html.Html msg
helloWorld =
    a_إنجليزي
        [ a_إنجليزي [ text "اهلاً" ]
        , a_عربي [ text ", world!" ]
        ]


{-| Helper for writing forced-direction text (`ltr`)
-}
a_عربي : List (Html msg) -> Html msg
a_عربي =
    a_بدو [ dir "ltr" ]


{-| Helper for writing forced-direction text (`rtl`)
-}
a_إنجليزي : List (Html msg) -> Html msg
a_إنجليزي =
    a_بدو [ dir "rtl" ]


{-| Bidirectional override overrides the current directionality of text.
Specify the `dir` attribute as `ltr` or `rtl`.
-}
a_بدو : List (Html.Attribute msg) -> List (Html msg) -> Html msg
a_بدو =
    bdo
