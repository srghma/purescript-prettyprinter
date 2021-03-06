-- | Test softwrapping prose.
module Test.Prose (test) where

import Prelude
import Data.Array as Array
import Data.Foldable (length)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Traversable (sequence)
import Data.Unfoldable (replicate)
import Effect (Effect)
import Effect.Random as Random
import Test.Common (runTest)
import Text.Lorem.Words as Lorem
import PrettyprinterRenderable as Pretty

test :: Effect Unit
test = do
  testSoftWrap 20 =<< randomWords 20
  testSoftWrap 40 =<< randomWords 20
  testSoftWrap 40 =<< randomWords 50

testSoftWrap :: Int -> Array String -> Effect Unit
testSoftWrap width words = runTest width (softWrap words)

softWrap :: Array String -> Pretty.Doc String
softWrap = Pretty.concatWith (Pretty.surround Pretty.softline) <<< map Pretty.text

randomWords :: Int -> Effect (Array String)
randomWords n = sequence (replicate n randomWord)

randomWord :: Effect String
randomWord = randomElem Lorem.latin

randomElem :: forall a. Array a -> Effect a
randomElem arr = do
  i <- Random.randomInt 0 (length arr)
  case Array.index arr i of
    Nothing -> randomElem arr
    Just a -> pure a
