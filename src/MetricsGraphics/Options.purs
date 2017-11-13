module MetricsGraphics.Options where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (either)
import Data.Foreign (Foreign)
import Data.Generic.Rep (class Generic)
--import Data.Generic.Rep.Show (genericShow)
import MetricsGraphics.Options.Axes (Axes)
import MetricsGraphics.Options.Data (Data)
import MetricsGraphics.Options.Graphic (Graphic)
import MetricsGraphics.Options.Layout (Layout)
import Partial.Unsafe (unsafeCrashWith)
import Simple.JSON (class ReadForeign, class WriteForeign, read, write)

type Options x y = Record (Axes x y (Data x y (Graphic x y (Layout()))))

newtype OptionsW x y = OptionsW (Options x y)

derive instance genericOptions :: Generic (OptionsW x y) _
--instance showOptions :: (Show x, Show y) => Show (OptionsW x y) where show = genericShow
instance writeForeignOptions :: (ReadForeign x, ReadForeign y, WriteForeign x, WriteForeign y) => WriteForeign (OptionsW x y) where
  writeImpl (OptionsW o) = write o

foreign import defaultOptionsImpl :: Foreign

defaultOptions :: forall x y. ReadForeign x => ReadForeign y => WriteForeign x => WriteForeign y => Options x y
defaultOptions = either (\_ -> unsafeCrashWith "unknown option") id $ runExcept $ read defaultOptionsImpl
