module Root exposing (Root, all, dashify)


type Root
    = ThreeLetter Char Char Char


all : List Root
all =
    [ ThreeLetter 'د' 'ر' 'س' ]


dashify : Root -> String
dashify root =
    case root of
        ThreeLetter char1 char2 char3 ->
            String.fromChar char1 ++ "-" ++ String.fromChar char2 ++ "-" ++ String.fromChar char3
