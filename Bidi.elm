module Bidi exposing (helloWorld, ltr, rtl)

import Html exposing (..)
import Html.Attributes exposing (..)


{-| say hello, world.
-}
helloWorld : Html.Html msg
helloWorld =
    rtl
        [ rtl [ text "اهلاً" ]
        , ltr [ text ", world!" ]
        ]


{-| Helper for writing forced-direction text (`ltr`)
-}
ltr : List (Html msg) -> Html msg
ltr =
    bdo [ dir "ltr" ]


{-| Helper for writing forced-direction text (`rtl`)
-}
rtl : List (Html msg) -> Html msg
rtl =
    bdo [ dir "rtl" ]
