{ name =
    "prettyprinter"
, license =
    "MIT"
, repository =
    "https://github.com/jmackie/purescript-prettyprinter.git"
, dependencies =
    [ "prelude"
    , "unfoldable"
    , "random"
    , "ansi"
    , "console"
    , "stringutils"
    , "const"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
