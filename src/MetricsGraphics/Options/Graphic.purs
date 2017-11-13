module MetricsGraphics.Options.Graphic where

import Data.Maybe (Maybe)
import MetricsGraphics.Color (Color)
import MetricsGraphics.Options.Helpers (Align, ChartType, Format, Func, Curve)

type Graphic x y r =
  ( aggregate_rollover :: Boolean -- links the lines in a multi-line graphic
  , aggregated_x_mouseover :: Maybe (Func {key :: x} String)
  , animate_on_load :: Boolean -- determines whether lines are transitioned on first-load
  , area :: Boolean -- determines whether to fill the area below the line
  , baselines :: Array {value :: y, label :: String} -- horizontal lines that indicate, say, goals.
  , chart_type :: ChartType -- the chart type
  , colors :: Maybe (Array Color) -- colors to use for each line
  , custom_line_color_map :: Array Color -- maps an arbitrary set of lines to colors
  , decimals :: Int -- the number of decimals to show in a rollover
  , description :: String -- string that will appear in the help tooltip
  , error :: String -- does the graphic have an error that we want to communicate to users
  , format :: Format -- the format of the data object
  , full_height :: Boolean -- sets height to that of the parent, adjusts dimensions on window resize
  , full_width :: Boolean -- sets width to that of the parent, adjusts dimensions on window resize
  , legend :: Array String -- an array of literals used to label lines
  , legend_target :: String -- the DOM element to insert the legend in
  , linked :: Boolean -- used to link multiple graphics together
  , linked_format :: String -- specifies the format of linked rollovers
  , list :: Boolean -- automatically maps the data to x and y accessors
  , mouseover_align :: Align -- where to place the rollover data
  , markers :: Array {x :: x, label :: String} -- vertical lines that indicate, say, milestones
  , max_data_size :: Maybe Int -- for use with custom_line_color_map
  , point_size :: Number -- the radius of the dot that appears over an active data point
  , show_confidence_band :: Maybe (Array y) -- determines whether to show a confidence band
  , show_rollover_text :: Boolean -- determines whether to show text for a data point on rollover
  , show_tooltips :: Boolean -- determines whether to display descriptions in tooltips
  , target :: String -- the DOM element to insert the graphic in
  , title :: String -- title to use for the graphic
  , transition_on_update :: Boolean -- gracefully transitions the lines on data change
  , x_mouseover :: Maybe (Func {x :: x} String)
  , x_rug :: Boolean -- show a rug plot along the x-axis
  , y_mouseover :: Maybe (Func {y :: y} String)
  , y_rug :: Boolean -- show a rug plot along the y-axis
  , interpolate :: Curve -- the interpolation function to use for rendering lines
  | r )

    --                 , interpolate_tension - increase the tension to fix artifacts when your data is irregular
--  , mouseover -- custom rollover function
    --mousemove - custom rollover function
    --mouseout - custom rollover function
