module Test.Code.FunctionSignature (test) where

import Prelude
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Foldable (intercalate)
import Data.NonEmpty ((:|))

import Data.String as String
import Effect (Effect)
import Test.Common (runTest, green)
import Prettyprinter ((<+>))
import Prettyprinter as Prettyprinter

test :: Effect Unit
test = do
  let
    sig = Sig "addShow" (Abs (Abs IntType IntType) StringType)
  testSig 31 sig
  testSig 25 sig
  testSig 12 sig

testSig :: Int -> Sig -> Effect Unit
testSig width sig = runTest width (ansiFancy <$> prettySig sig)

ansiFancy :: Fancy -> String -> String
ansiFancy Plain s = s
ansiFancy Green s = green s

-- | This shows how you can use types other than `String` with `Doc`.
data Fancy
  = Green
  | Plain

data Sig
  = Sig String Type -- foo :: Int

prettySig :: Sig -> Prettyprinter.Doc Fancy
prettySig (Sig name t) =
  (Prettyprinter.Annotated Green (Prettyprinter.unsafeStringWithoutNewlines name))
    <> (Prettyprinter.group $ Prettyprinter.Annotated Plain (Prettyprinter.nest 2 (Prettyprinter.line <> Prettyprinter.unsafeStringWithoutNewlines "::" <+> prettyType t)))

data Type
  = Abs Type Type
  | IntType
  | StringType

prettyType :: forall ann . Type -> Prettyprinter.Doc ann
prettyType IntType = Prettyprinter.unsafeStringWithoutNewlines "Int"
prettyType StringType = Prettyprinter.unsafeStringWithoutNewlines "String"
prettyType abs@(Abs _ _) = case NonEmptyArray.toNonEmpty (unAbs abs) of
  t :| ts ->
    Prettyprinter.group
      $ intercalate Prettyprinter.line
      $ Array.cons
          (prettyType t)
          (map (prettyType >>> (Prettyprinter.unsafeStringWithoutNewlines "->" <+> _)) ts)

unAbs :: Type -> NonEmptyArray Type
unAbs (Abs x y) = unAbs x <> unAbs y
unAbs t = NonEmptyArray.singleton t
