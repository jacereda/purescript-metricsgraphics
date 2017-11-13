module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import MetricsGraphics.Options (OptionsR, defaultOptions, defaultOptionsR)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  logShow defaultOptions
  log "Hello sailor!"
