module MetricsGraphics where

import Prelude

import Control.Monad.Eff (Eff, kind Effect)
import Data.Foreign (Foreign)
import MetricsGraphics.Options (Options, OptionsW(..))
import Simple.JSON (class ReadForeign, class WriteForeign, write)

foreign import data MG :: Effect

foreign import dataGraphicImpl :: forall e. Foreign -> Eff (mg :: MG | e) Unit

dataGraphic :: forall x y e. ReadForeign x => ReadForeign y => WriteForeign x => WriteForeign y => Options x y -> Eff (mg :: MG| e) Unit
dataGraphic r = dataGraphicImpl $ write (OptionsW r)
