module MetricsGraphics.Date where
import Prelude

import Data.DateTime (DateTime(..), Time(..), exactDate)
import Data.Either (Either(..), hush)
import Data.Enum (toEnum)
import Data.Foreign (ForeignError(..), fail, toForeign, unsafeFromForeign)
import Data.Formatter.DateTime (formatDateTime, unformatDateTime)
import Data.JSDate (fromDateTime, toDateTime)
import Data.Maybe (Maybe(..))
import Simple.JSON (class ReadForeign, class WriteForeign)

newtype Date = Date DateTime

instance showDate :: Show Date where
  show (Date d) = show d

instance readForeignDate :: ReadForeign Date where
  readImpl d = case toDateTime (unsafeFromForeign d) of
    Just dd -> pure $ Date dd
    Nothing -> fail $ ForeignError $ "Bad date"

instance writeForeignDate :: WriteForeign Date where
  writeImpl (Date d) = toForeign $ fromDateTime d

date :: Int -> Int -> Int -> Maybe Date
date y m d = Date <$> (DateTime <$> join mdate <*> time)
  where mdate = exactDate <$> toEnum y <*> toEnum m <*> toEnum d
        time = Time <$> toEnum 0 <*> toEnum 0 <*> toEnum 0 <*> toEnum 0

yyyymmdd :: String -> Maybe Date
yyyymmdd s = Date <$> (hush $ unformatDateTime "YYYY-MM-DD" s)

formatDate :: String -> Date -> String
formatDate fmt (Date d) = case formatDateTime fmt d of
  Right s -> s
  Left _ -> "???"
