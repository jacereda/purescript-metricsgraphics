module MetricsGraphics.Options.Axes where

import Data.Maybe (Maybe)
import MetricsGraphics.Options.Helpers (Func)

type Axes x y r =
  ( axes_not_compact :: Boolean -- determines whether to draw compact or non-compact axes
  , european_clock :: Boolean -- determines whether to show labels using a 24-hour clock
  , inflator :: Number -- a multiplier for inflating max_x and max_y
  , max_x :: Maybe x -- the maximum x-value
  , max_y :: Maybe y -- the maximum y-value
  , min_x :: Maybe x -- the minimum x-value
  , min_y :: Maybe y -- the minimum y-value
  , min_y_from_data :: Boolean -- starts y-axis at data's minimum value
  , missing_text :: String -- The text to display for missing graphics
  , show_missing_background :: Boolean -- Displays a background for missing graphics
  , show_secondary_x_label :: Boolean -- determines whether to show years along the x-axis
  , show_year_markers :: Boolean -- determines whether to show year markers along the x-axis
  , x_axis :: Boolean -- determines whether to display the x-axis
  , x_extended_ticks :: Boolean -- determines whether to extend the x-axis ticks across the chart
  , x_label :: String -- the label to show below the x-axis
  , x_scale_type :: String -- the x-axis scale type
  , xax_count :: Int -- the number of x-axis ticks
  , xax_format :: Maybe (Func x String) -- a function that formats the x-axis' labels
  , xax_tick_length :: Int -- the x-axis' tick length in pixels
  , xax_units :: String -- a prefix symbol to be shown alongside the x-axis' labels
  , y_axis :: Boolean -- determines whether to display the y-axis
  , y_extended_ticks :: Boolean -- determines whether to extend the y-axis ticks across the chart
  , y_label :: String -- the label to show beside the y-axis
  , y_scale_type :: String -- the y-axis scale type
  , yax_count :: Int -- the number of y-axis ticks
  , yax_format :: Maybe (Func y String) -- a function that formats the y-axis' labels
  , yax_tick_length :: Int -- the y-axis' tick length in pixels
  , yax_units :: String -- a prefix symbol to be shown alongside the y-axis' labels
  , yax_units_append :: Boolean -- determines whether to append rather than prepend units
  | r )
