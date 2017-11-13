module MetricsGraphics.Options.Layout where

type Layout r =
  ( bottom :: Int -- | the size of the bottom margin
  , buffer :: Int -- | the padding around the graphic
  , center_title_full_width :: Boolean -- | center title over entire graph
  , height :: Int -- | the graphic's height
  , left :: Int -- | the size of the left margin
  , right :: Int -- | the size of the right margin
  , small_height_threshold :: Int -- | maximum height for a small graphic
  , small_width_threshold :: Int -- | maximum width for a small graphic
  , top :: Int -- | the size of the top margin
  , width :: Int -- | the graphic's width
  | r )
