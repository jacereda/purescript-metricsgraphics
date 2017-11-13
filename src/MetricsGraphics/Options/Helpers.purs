module MetricsGraphics.Options.Helpers where

import Prelude

import Control.Monad.Except (runExcept, throwError)
import Data.Either (Either(..))
import Data.Foreign (ForeignError(..), fail, toForeign)
import Partial.Unsafe (unsafeCrashWith)
import Simple.JSON (class ReadForeign, class WriteForeign, read, write)

newtype Func r s = Func (r -> s)
instance writeFunc :: (ReadForeign r, WriteForeign s) => WriteForeign (Func r s) where
  writeImpl (Func f) = toForeign f'
    where f' d = case runExcept $ read d of
            Right r -> write $ f r
            Left e -> unsafeCrashWith $ show e
instance readFunc :: ReadForeign (Func r s) where
  readImpl f = unsafeCrashWith "readFunc"
instance showFunc :: Show (Func r s) where
  show _ = "func"

data Align = AlignLeft
           | AlignMiddle
           | AlignRight
instance writeAlign :: WriteForeign Align where
  writeImpl AlignLeft = write "left"
  writeImpl AlignMiddle = write "middle"
  writeImpl AlignRight = write "right"  
instance readAlign :: ReadForeign Align where
  readImpl f = case runExcept (read f) of
      Right "left" -> pure AlignLeft
      Right "middle" -> pure AlignMiddle
      Right "right" -> pure AlignRight
      Right x -> fail $ ForeignError $ "Invalid alignment: " <> x
      Left e -> throwError e
    
             
data ChartType = Line
               | Histogram
               | Point
               | MissingData
instance writeChartType :: WriteForeign ChartType where
  writeImpl Line = write "line"
  writeImpl Histogram = write "histogram"
  writeImpl Point = write "point"
  writeImpl MissingData = write "missing-data"  
instance readChartType :: ReadForeign ChartType where
  readImpl f = case runExcept (read f) of
      Right "line" -> pure Line
      Right "histogram" -> pure Histogram
      Right "point" -> pure Point
      Right "missing-data" -> pure MissingData
      Right x -> fail $ ForeignError $ "Invalid ChartType: " <> x
      Left e -> throwError e

data Format = Count
            | Percentage
instance writeFormat :: WriteForeign Format where
  writeImpl Count = write "count"
  writeImpl Percentage = write "percentage"
instance readFormat :: ReadForeign Format where
  readImpl f = case runExcept (read f) of
      Right "count" -> pure Count
      Right "percentage" -> pure Percentage
      Right x -> fail $ ForeignError $ "Invalid format: " <> x
      Left e -> throwError e
