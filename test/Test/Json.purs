module Test.Json (test) where

import Prelude
import Data.Tuple (Tuple(Tuple))
import Effect (Effect)
import Test.Common (runTest)
import Prettyprinter
import Prettyprinter.Symbols.String

test :: Effect Unit
test = do
  runTest 50 (prettyJson exampleArray)
  runTest 10 (prettyJson exampleArray)
  runTest 50 (prettyJson smallObject)
  runTest 10 (prettyJson smallObject)
  runTest 30 (prettyJson nestedObject)

exampleArray :: Json
exampleArray =
  JArray
    [ JNumber 2.0
    , JNumber 4.0
    , JString "foo"
    , JNull
    ]

smallObject :: Json
smallObject =
  JObject
    [ Tuple "foo" JNull
    , Tuple "bar" JNull
    ]

nestedObject :: Json
nestedObject =
  JObject
    [ Tuple "foo" smallObject
    , Tuple "bar" smallObject
    ]

data Json
  = JObject Object
  | JArray (Array Json)
  | JString String
  | JNumber Number
  | JBool Boolean
  | JNull

type Object
  = Array (Tuple String Json)

prettyJson :: forall ann . Json -> Doc ann
prettyJson JNull = unsafeStringWithoutNewlines "null"
prettyJson (JBool b) = if b then unsafeStringWithoutNewlines "true" else unsafeStringWithoutNewlines "false"
prettyJson (JNumber n) = unsafeStringWithoutNewlines (show n)
prettyJson (JString s) = unsafeStringWithoutNewlines s
prettyJson (JArray vs) = group (prettyJsonArray vs)
prettyJson (JObject o) = group (prettyJsonObject o)

prettyJsonArray :: forall ann . Array Json -> Doc ann
prettyJsonArray [] = unsafeStringWithoutNewlines "[]"
prettyJsonArray vs =
  map prettyJson vs
    # punctuate comma
    >>> sep
    >>> (\x -> flatAlt (indent 2 x) x)
    >>> brackets

prettyJsonObject :: forall ann . Object -> Doc ann
prettyJsonObject [] = unsafeStringWithoutNewlines "{}"
prettyJsonObject o =
  map keyValue o
    # punctuate comma
    >>> sep
    >>> (\x -> flatAlt (indent 2 x) x)
    >>> braces
  where
  keyValue :: forall ann . Tuple String Json -> Doc ann
  keyValue (Tuple k v) = dquotes (unsafeStringWithoutNewlines k) <+> prettyJson v

brackets :: forall ann . Doc ann -> Doc ann
brackets = enclose (lbracket <> line) (line <> rbracket)

braces :: forall ann . Doc ann -> Doc ann
braces = enclose (lbrace <> line) (line <> rbrace)
