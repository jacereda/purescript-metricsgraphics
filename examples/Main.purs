module Main where

import Prelude

import Color.Scheme.MaterialDesign (red)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Data (fakeusers, factor)
import Data.Array (catMaybes, mapWithIndex, take)
import Data.Maybe (Maybe(..))
import MetricsGraphics (MG, dataGraphic)
import MetricsGraphics.Color (Color(..))
import MetricsGraphics.Date (formatDate, yyyymmdd)
import MetricsGraphics.Options (defaultOptions)
import MetricsGraphics.Options.Helpers (Align(..), ChartType(..), Format(..), Func(..), Curve(..))

main :: forall e. Eff (mg :: MG, console :: CONSOLE | e) Unit
main = do
  let o = defaultOptions { width = 800, height = 400, right = 40, legend = ["Foo", "Bar", "Baz"], chart_type = Line }
  dataGraphic $ o { title = "Single-Line"
                  , description = "This is a simple line chart. You can remove the area portion by adding <i>area: false</i> to the arguments list."
                  , data = take 1 fakeusers
                  , target = "#fake_users1"
                  }
  dataGraphic $ o { title = "Single-Line Color"
                  , description = "This chart has changed its color using the colors attribute."
                  , data = take 1 fakeusers
                  , colors = Just [Color red]
                  , target = "#custom-color"
                  }
  dataGraphic $ o { title = "Multi-Line"
                  , description = "This line chart contains multiple lines and uses custom rollover functions."
                  , data = fakeusers
                  , aggregated_x_mouseover = Just $ Func \r -> formatDate "YYYY-MM-DD : " r.key
                  , mouseover_align = AlignLeft
                  , format = Count
                  , animate_on_load = true
                  , target = "#multi-labelled"
                  }
  let p = defaultOptions { width = 800, height = 400, right = 40, legend = ["Foo", "Bar", "Baz"] }    
  dataGraphic $ p { title = "Axis Formatting"
                  , description = "This chart has changed axis labels formatting."
                  , data = factor 200000000.0 fakeusers
                  , xax_format = Just $ Func \x -> formatDate "YYYYMMDD" x
                  , yax_format = Just $ Func \y -> show (y * 100.0) <> "%"
                  , interpolate = CurveLinearClosed
                  , animate_on_load = true
                  , format = Percentage
                  , target = "#ax-format"
                  , markers = mapWithIndex (\i x -> {x: x, label: "Milestone " <> show (i + 1)}) $
                              catMaybes $ [ yyyymmdd "2014-02-24", yyyymmdd "2014-03-25" ]
                  , baselines = mapWithIndex (\i y -> {value: y, label: "Goal " <> show (i + 1)})
                                [ 0.5, 0.75 ]
                  }
