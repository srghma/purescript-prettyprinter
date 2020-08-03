module Test.Code.Haskell (test) where

import Prelude
import Effect (Effect)
import Test.Common (runTest)
import Prettyprinter (unsafeStringWithoutNewlines, list) as Prettyprinter

test :: Effect Unit
test = do
  let docList =
        Prettyprinter.list
        [ Prettyprinter.unsafeStringWithoutNewlines "1"
        , Prettyprinter.unsafeStringWithoutNewlines "2"
        , Prettyprinter.unsafeStringWithoutNewlines "3"
        ]
  runTest 10 docList
  runTest 5 docList

  let docListNested =
        Prettyprinter.list
        [ Prettyprinter.unsafeStringWithoutNewlines "1"
        , Prettyprinter.unsafeStringWithoutNewlines "2"
        , Prettyprinter.unsafeStringWithoutNewlines "3"
        , Prettyprinter.list
          [ Prettyprinter.unsafeStringWithoutNewlines "1"
          , Prettyprinter.unsafeStringWithoutNewlines "2"
          , Prettyprinter.unsafeStringWithoutNewlines "3"
          ]
        ]
  runTest 30 docListNested
  runTest 5 docListNested
