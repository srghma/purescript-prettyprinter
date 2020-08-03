module Prettyprinter.Symbols.String where

import Prettyprinter (Doc, enclose, unsafeStringWithoutNewlines)

-- | >>> squotes "·"
-- '·'
squotes :: forall ann . Doc ann -> Doc ann
squotes = enclose squote squote

-- | >>> dquotes "·"
-- "·"
dquotes :: forall ann . Doc ann -> Doc ann
dquotes = enclose dquote dquote

-- | >>> parens "·"
-- (·)
parens :: forall ann . Doc ann -> Doc ann
parens = enclose lparen rparen

-- | >>> angles "·"
-- <·>
angles :: forall ann . Doc ann -> Doc ann
angles = enclose langle rangle

-- | >>> brackets "·"
-- [·]
brackets :: forall ann . Doc ann -> Doc ann
brackets = enclose lbracket rbracket

-- | >>> braces "·"
-- {·}
braces :: forall ann . Doc ann -> Doc ann
braces = enclose lbrace rbrace

-- | >>> squote
-- '
squote :: forall ann . Doc ann
squote = unsafeStringWithoutNewlines "'"

-- | >>> dquote
-- "
dquote :: forall ann . Doc ann
dquote = unsafeStringWithoutNewlines "\""

-- | >>> lparen
-- (
lparen :: forall ann . Doc ann
lparen = unsafeStringWithoutNewlines "("

-- | >>> rparen
-- )
rparen :: forall ann . Doc ann
rparen = unsafeStringWithoutNewlines ")"

-- | >>> langle
-- <
langle :: forall ann . Doc ann
langle = unsafeStringWithoutNewlines "<"

-- | >>> rangle
-- >
rangle :: forall ann . Doc ann
rangle = unsafeStringWithoutNewlines ">"

-- | >>> lbracket
-- [
lbracket :: forall ann . Doc ann
lbracket = unsafeStringWithoutNewlines "["
-- | >>> rbracket
-- ]
rbracket :: forall ann . Doc ann
rbracket = unsafeStringWithoutNewlines "]"

-- | >>> lbrace
-- {
lbrace :: forall ann . Doc ann
lbrace = unsafeStringWithoutNewlines "{"
-- | >>> rbrace
-- }
rbrace :: forall ann . Doc ann
rbrace = unsafeStringWithoutNewlines "}"

-- | >>> semi
-- ;
semi :: forall ann . Doc ann
semi = unsafeStringWithoutNewlines ";"

-- | >>> colon
-- :
colon :: forall ann . Doc ann
colon = unsafeStringWithoutNewlines ":"

-- | >>> comma
-- ,
comma :: forall ann . Doc ann
comma = unsafeStringWithoutNewlines ","

-- | >>> "a" <> space <> "b"
-- a b
--
-- This is mostly used via @'<+>'@,
--
-- >>> "a" <+> "b"
-- a b
space :: forall ann . Doc ann
space = unsafeStringWithoutNewlines " "

-- | >>> dot
-- .
dot :: forall ann . Doc ann
dot = unsafeStringWithoutNewlines "."

-- | >>> slash
-- /
slash :: forall ann . Doc ann
slash = unsafeStringWithoutNewlines "/"

-- | >>> backslash
-- \\

backslash :: forall ann . Doc ann
backslash = unsafeStringWithoutNewlines "\\"

-- | >>> equals
-- =
equals :: forall ann . Doc ann
equals = unsafeStringWithoutNewlines "="

-- | >>> pipe
-- |
pipe :: forall ann . Doc ann
pipe = unsafeStringWithoutNewlines "|"
