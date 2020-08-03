module Prettyprinter.Panic (
  panicUncaughtFail,
  panicUnpairedPop,
  panicSimpleDocTreeConversionFailed,
  panicInputNotFullyConsumed,
  panicPeekedEmpty,
  panicPoppedEmpty,
  panicSAnnPop,
  unsafeCrashWith
) where

import Prelude

import Partial (crashWith)
import Partial.Unsafe (unsafePartial)

-- | Raise a hard 'unsafeCrashWith' if there is a 'Prettyprinter.SFail' in a
-- 'Prettyprinter.SimpleDocStream'.
panicUncaughtFail :: String
panicUncaughtFail = "»SFail« must not appear in a rendered »SimpleDocStream«. This is a bug in the layout algorithm! " <> report

-- | Raise a hard 'unsafeCrashWith' when an annotation terminator is encountered in an
-- unannotated region.
panicUnpairedPop :: String
panicUnpairedPop = "An unpaired style terminator was encountered. This is a bug in the layout algorithm! " <> report

-- | Raise a hard generic 'unsafeCrashWith' when the
-- 'Prettyprinter.SimpleDocStream' to
-- 'Prettyprinter.Render.Util.SimpleDocTree.SimpleDocTree' conversion fails.
panicSimpleDocTreeConversionFailed :: String
panicSimpleDocTreeConversionFailed = "Conversion from SimpleDocStream to SimpleDocTree failed! " <> report

-- | Raise a hard 'unsafeCrashWith' when the »to
-- 'Prettyprinter.Render.Util.SimpleDocTree.SimpleDocTree'« parser finishes
-- without consuming the full input.
panicInputNotFullyConsumed :: String
panicInputNotFullyConsumed = "Conversion from SimpleDocStream to SimpleDocTree left unconsumed input! " <> report

panicSAnnPop :: String
panicSAnnPop = "Tried skipping spaces in unannotated data! Please report this as a bug in 'prettyprinter'."

report :: String
report = "Please report this as a bug"

panicPeekedEmpty :: String
panicPeekedEmpty = mkErr "Peeked"

panicPoppedEmpty :: String
panicPoppedEmpty = mkErr "Popped"

mkErr :: String -> String
mkErr x = x <> " an empty style stack! Please report this as a bug."

unsafeCrashWith :: forall void . String -> void
unsafeCrashWith msg = unsafePartial (crashWith msg)
