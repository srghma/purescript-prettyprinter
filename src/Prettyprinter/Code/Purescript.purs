module Prettyprinter.Code.Purescript where

import Prelude
import Prettyprinter
import Prettyprinter.Symbols.String

import Data.Array as Array

encloseSep
    :: forall a
     . Doc a   -- ^ left delimiter
    -> Doc a   -- ^ right delimiter
    -> Doc a   -- ^ separator
    -> Array (Doc a) -- ^ input documents
    -> Doc a
encloseSep leftDelimiter rightDelimiter separator = case _ of
    []   -> leftDelimiter <> rightDelimiter
    docs ->
      let
        leftDelimiter' = flatAlt (leftDelimiter <> space) leftDelimiter
      in vcat $ (Array.zipWith (<>) ([leftDelimiter'] <> Array.replicate (Array.length docs - 1) separator) (map align docs)) <> [rightDelimiter]

-- | Purescript-inspired variant of 'encloseSep' with braces and comma as
-- separator.
--
-- >>> let doc = list (map pretty [1,20,300,4000])
--
-- >>> putDocW 80 doc
-- [1, 20, 300, 4000]
--
-- >>> putDocW 10 doc
-- [ 1
-- , 20
-- , 300
-- , 4000
-- ]
list :: forall ann . Array (Doc ann) -> Doc ann
list = group <<< encloseSep (unsafeStringWithoutNewlines "[") (unsafeStringWithoutNewlines "]") (unsafeStringWithoutNewlines ", ")

-- | Purescript-inspired variant of 'encloseSep' with parentheses and comma as
-- separator.
--
-- >>> let doc = tupled (map pretty [1,20,300,4000])
--
-- >>> putDocW 80 doc
-- (1, 20, 300, 4000)
--
-- >>> putDocW 10 doc
-- ( 1
-- , 20
-- , 300
-- , 4000
-- )
tupled :: forall ann . Array (Doc ann) -> Doc ann
tupled = group <<< encloseSep (unsafeStringWithoutNewlines "(") (unsafeStringWithoutNewlines ")") (unsafeStringWithoutNewlines ", ")
