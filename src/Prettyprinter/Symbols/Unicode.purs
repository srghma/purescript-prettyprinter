-- | A collection of predefined Unicode values outside of ASCII range. For
-- ASCII, see "Prettyprinter.Symbols.Ascii".
module Prettyprinter.Symbols.Unicode where

import Prettyprinter (Doc, enclose, unsafeStringWithoutNewlines)

-- | Double „99-66“ quotes, as used in German typography.
--
-- >>> putDoc (d9966quotes "·")
-- „·“
d9966quotes :: forall ann . Doc ann -> Doc ann
d9966quotes = enclose b99dquote t66dquote

-- | Double “66-99” quotes, as used in English typography.
--
-- >>> putDoc (d6699quotes "·")
-- “·”
d6699quotes :: forall ann . Doc ann -> Doc ann
d6699quotes = enclose t66dquote t99dquote

-- | Single ‚9-6‘ quotes, as used in German typography.
--
-- >>> putDoc (s96quotes "·")
-- ‚·‘
s96quotes :: forall ann . Doc ann -> Doc ann
s96quotes = enclose b9quote t6quote

-- | Single ‘6-9’ quotes, as used in English typography.
--
-- >>> putDoc (s69quotes "·")
-- ‘·’
s69quotes :: forall ann . Doc ann -> Doc ann
s69quotes = enclose t6quote t9quote

-- | Double «guillemets», pointing outwards (without adding any spacing).
--
-- >>> putDoc (dGuillemetsOut "·")
-- «·»
dGuillemetsOut :: forall ann . Doc ann -> Doc ann
dGuillemetsOut = enclose ldGuillemet rdGuillemet

-- | Double »guillemets«, pointing inwards (without adding any spacing).
--
-- >>> putDoc (dGuillemetsIn "·")
-- »·«
dGuillemetsIn :: forall ann . Doc ann -> Doc ann
dGuillemetsIn = enclose rdGuillemet ldGuillemet

-- | Single ‹guillemets›, pointing outwards (without adding any spacing).
--
-- >>> putDoc (sGuillemetsOut "·")
-- ‹·›
sGuillemetsOut :: forall ann . Doc ann -> Doc ann
sGuillemetsOut = enclose lsGuillemet rsGuillemet

-- | Single ›guillemets‹, pointing inwards (without adding any spacing).
--
-- >>> putDoc (sGuillemetsIn "·")
-- ›·‹
sGuillemetsIn :: forall ann . Doc ann -> Doc ann
sGuillemetsIn = enclose rsGuillemet lsGuillemet

-- | Bottom „99“ style double quotes.
--
-- >>> putDoc b99dquote
-- „
b99dquote :: forall ann . Doc ann
b99dquote = unsafeStringWithoutNewlines "„"

-- | Top “66” style double quotes.
--
-- >>> putDoc t66dquote
-- “
t66dquote :: forall ann . Doc ann
t66dquote = unsafeStringWithoutNewlines "“"

-- | Top “99” style double quotes.
--
-- >>> putDoc t99dquote
-- ”
t99dquote :: forall ann . Doc ann
t99dquote = unsafeStringWithoutNewlines "”"

-- | Bottom ‚9‘ style single quote.
--
-- >>> putDoc b9quote
-- ‚
b9quote :: forall ann . Doc ann
b9quote = unsafeStringWithoutNewlines "‚"

-- | Top ‘66’ style single quote.
--
-- >>> putDoc t6quote
-- ‘
t6quote :: forall ann . Doc ann
t6quote = unsafeStringWithoutNewlines "‘"

-- | Top ‘9’ style single quote.
--
-- >>> putDoc t9quote
-- ’
t9quote :: forall ann . Doc ann
t9quote = unsafeStringWithoutNewlines "’"

-- | Right-pointing double guillemets
--
-- >>> putDoc rdGuillemet
-- »
rdGuillemet :: forall ann . Doc ann
rdGuillemet = unsafeStringWithoutNewlines "»"

-- | Left-pointing double guillemets
--
-- >>> putDoc ldGuillemet
-- «
ldGuillemet :: forall ann . Doc ann
ldGuillemet = unsafeStringWithoutNewlines "«"

-- | Right-pointing single guillemets
--
-- >>> putDoc rsGuillemet
-- ›
rsGuillemet :: forall ann . Doc ann
rsGuillemet = unsafeStringWithoutNewlines "›"

-- | Left-pointing single guillemets
--
-- >>> putDoc lsGuillemet
-- ‹
lsGuillemet :: forall ann . Doc ann
lsGuillemet = unsafeStringWithoutNewlines "‹"

-- | >>> putDoc bullet
-- •
bullet :: forall ann . Doc ann
bullet = unsafeStringWithoutNewlines "•"

-- | >>> putDoc endash
-- –
endash :: forall ann . Doc ann
endash = unsafeStringWithoutNewlines "–"

-- | >>> putDoc euro
-- €
euro :: forall ann . Doc ann
euro = unsafeStringWithoutNewlines "€"

-- | >>> putDoc cent
-- ¢
cent :: forall ann . Doc ann
cent = unsafeStringWithoutNewlines "¢"

-- | >>> putDoc yen
-- ¥
yen :: forall ann . Doc ann
yen = unsafeStringWithoutNewlines "¥"

-- | >>> putDoc pound
-- £
pound :: forall ann . Doc ann
pound = unsafeStringWithoutNewlines "£"
