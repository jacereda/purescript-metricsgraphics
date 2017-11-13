module MetricsGraphics.Color where
import Prelude

import Color as Color
import Data.Foreign (ForeignError(..), fail, readString, toForeign)
import Data.Maybe (Maybe(..))
import Simple.JSON (class ReadForeign, class WriteForeign)

newtype Color = Color Color.Color

instance showColor :: Show Color where
  show (Color d) = show d

instance readForeignColor :: ReadForeign Color where
  readImpl f = do
    s <- readString f
    case Color.fromHexString s of
      Just cd -> pure $ Color cd
      Nothing -> fail $ ForeignError $ "wrong color:" <> s

instance writeForeignColor :: WriteForeign Color where
  writeImpl (Color d) = toForeign $ Color.toHexString d

