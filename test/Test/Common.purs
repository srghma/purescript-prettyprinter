module Test.Common
  ( runTest
  , rule
  , red
  , green
  , blue
  , yellow
  ) where

import Prelude
import Ansi.Codes as AnsiCodes
import Ansi.Output as AnsiOutput
import Data.Foldable (fold)
import Data.Unfoldable (replicate)
import Effect (Effect)
import Effect.Console as Console
import Prettyprinter as Prettyprinter

runTest :: forall ann . Int -> Prettyprinter.Doc ann -> Effect Unit
runTest width doc = do
  Console.log $ blue (rule width)
  Console.log $ Prettyprinter.render (Prettyprinter.layoutPretty { layoutPageWidth: Prettyprinter.AvailablePerLine width 1.0 } doc)
  Console.log $ blue (rule width)
  Console.log "" -- for the newline

rule :: Int -> String
rule n = fold (replicate n "-" :: Array String)

red :: String -> String
red =
  AnsiOutput.withGraphics
    $ AnsiOutput.foreground AnsiCodes.Red

green :: String -> String
green =
  AnsiOutput.withGraphics
    $ AnsiOutput.foreground AnsiCodes.BrightGreen

blue :: String -> String
blue =
  AnsiOutput.withGraphics
    $ AnsiOutput.foreground AnsiCodes.BrightBlue

yellow :: String -> String
yellow =
  AnsiOutput.withGraphics
    $ AnsiOutput.foreground AnsiCodes.BrightYellow
