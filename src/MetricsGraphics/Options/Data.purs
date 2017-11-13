module MetricsGraphics.Options.Data where

import Data.Maybe (Maybe)

type Data x y r =
  ( "data" :: Array (Array {x :: x, y :: y}) -- the data object
  , missing_is_hidden :: Boolean -- show missing observations as missing line segments
  , missing_is_hidden_accessor :: Maybe String -- the accessor for identifying observations as missing
  , missing_is_zero :: Boolean -- assume missing observations are zero
  , utc_time :: Boolean -- determines whether to use a UTC or local time scale
  , x_sort :: Boolean -- determines whether to sort the x-axis' values
  | r )
