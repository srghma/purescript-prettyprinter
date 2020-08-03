-- | Frequently useful definitions for working with general prettyprinters.
module Prettyprinter.Util where

import Prelude
import Prettyprinter (Doc, fillSep, unsafeStringWithoutNewlines)
import Data.String.Utils as String

-- | Split an input into word-sized 'Doc's.
--
-- >>> putDoc (tupled (words "Lorem ipsum dolor"))
-- (Lorem, ipsum, dolor)
words :: forall ann . String -> Array (Doc ann)
words = map unsafeStringWithoutNewlines <<< String.words

-- | Insert soft linebreaks between words, so that text is broken into multiple
-- lines when it exceeds the available width.
--
-- >>> putDocW 32 (reflow "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
-- Lorem ipsum dolor sit amet,
-- consectetur adipisicing elit,
-- sed do eiusmod tempor incididunt
-- ut labore et dolore magna
-- aliqua.
--
-- @
-- 'reflow' = 'fillSep' . 'words'
-- @
reflow :: forall ann . String -> Doc ann
reflow = fillSep <<< words
