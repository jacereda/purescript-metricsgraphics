module MetricsGraphics.Options.Helpers where

import Prelude

import Control.Monad.Except (runExcept, throwError)
import Data.Either (Either(..))
import Data.Foreign (Foreign, ForeignError(..), fail, toForeign)
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
               | Bar
               | MissingData
instance writeChartType :: WriteForeign ChartType where
  writeImpl Line = write "line"
  writeImpl Histogram = write "histogram"
  writeImpl Point = write "point"
  writeImpl Bar = write "bar"
  writeImpl MissingData = write "missing-data"  
instance readChartType :: ReadForeign ChartType where
  readImpl f = case runExcept (read f) of
      Right "line" -> pure Line
      Right "histogram" -> pure Histogram
      Right "point" -> pure Point
      Right "bar" -> pure Bar
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

data Scale = Linear
           | Log
instance writeScale :: WriteForeign Scale where
  writeImpl Linear = write "linear"
  writeImpl Log = write "log"
instance readScale :: ReadForeign Scale where
  readImpl f = case runExcept (read f) of
      Right "linear" -> pure Linear
      Right "log" -> pure Log
      Right x -> fail $ ForeignError $ "Invalid scale: " <> x
      Left e -> throwError e


foreign import curveEq :: Foreign -> Foreign -> Boolean

foreign import curveCatmullRomAlpha0 :: Foreign
foreign import curveLinearClosed :: Foreign
foreign import curveStep :: Foreign
foreign import curveStepBefore :: Foreign
foreign import curveStepAfter :: Foreign
foreign import curveBasis :: Foreign
foreign import curveBasisOpen :: Foreign
foreign import curveBasisClosed :: Foreign
foreign import curveBundle :: Foreign
foreign import curveCardinal :: Foreign
foreign import curveCardinalOpen :: Foreign
foreign import curveCardinalClosed :: Foreign
foreign import curveMonotoneX :: Foreign
foreign import curveCatmullRomClosed :: Foreign
foreign import curveCatmullRomOpen :: Foreign

data Curve = CurveCatmullRomAlpha0
           | CurveLinearClosed
           | CurveStep
           | CurveStepBefore
           | CurveStepAfter
           | CurveBasis
           | CurveBasisOpen
           | CurveBasisClosed
           | CurveBundle
           | CurveCardinal
           | CurveCardinalOpen
           | CurveCardinalClosed
           | CurveMonotoneX
           | CurveCatmullRomClosed
           | CurveCatmullRomOpen

instance writeCurve :: WriteForeign Curve where
  writeImpl c = case c of
    CurveCatmullRomAlpha0 -> curveCatmullRomAlpha0
    CurveLinearClosed -> curveLinearClosed
    CurveStep -> curveStep
    CurveStepBefore -> curveStepBefore
    CurveStepAfter -> curveStepAfter
    CurveBasis -> curveBasis
    CurveBasisOpen -> curveBasisOpen
    CurveBasisClosed -> curveBasisClosed
    CurveBundle -> curveBundle
    CurveCardinal -> curveCardinal
    CurveCardinalOpen -> curveCardinalOpen
    CurveCardinalClosed -> curveCardinalClosed
    CurveMonotoneX -> curveMonotoneX
    CurveCatmullRomClosed -> curveCatmullRomClosed
    CurveCatmullRomOpen -> curveCatmullRomOpen

instance readCurve :: ReadForeign Curve where
  readImpl f =
    if curveEq f curveCatmullRomAlpha0 then pure CurveCatmullRomAlpha0 else
    if curveEq f curveLinearClosed then pure CurveLinearClosed else
    if curveEq f curveStep then pure CurveStep else
    if curveEq f curveStepBefore then pure CurveStepBefore else
    if curveEq f curveStepAfter then pure CurveStepAfter else
    if curveEq f curveBasis then pure CurveBasis else
    if curveEq f curveBasisOpen then pure CurveBasisOpen else
    if curveEq f curveBasisClosed then pure CurveBasisClosed else
    if curveEq f curveBundle then pure CurveBundle else
    if curveEq f curveCardinal then pure CurveCardinal else
    if curveEq f curveCardinalOpen then pure CurveCardinalOpen else
    if curveEq f curveCardinalClosed then pure CurveCardinalClosed else
    if curveEq f curveMonotoneX then pure CurveMonotoneX else
    if curveEq f curveCatmullRomClosed then pure CurveCatmullRomClosed else
    if curveEq f curveCatmullRomOpen then pure CurveCatmullRomOpen else
    fail $ ForeignError "Invalid interpolation"
