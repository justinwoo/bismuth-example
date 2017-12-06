module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console as EffC

add2 :: Number -> Number
add2 x = x + 2.0

log :: String -> Eff (console :: CONSOLE) Unit
log s = EffC.log s
