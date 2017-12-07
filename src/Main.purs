module Main where

import Prelude

import Bismuth (class HasFlowRep)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console as EffC
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), contains, stripPrefix, stripSuffix)
import Data.Symbol (SProxy(..))
import Data.Validation.Semigroup (V, invalid, unV)
import Data.Variant (Variant, inj)

add2 :: Number -> Number
add2 x = x + 2.0

log :: String -> Eff (console :: CONSOLE) Unit
log s = EffC.log s

newtype MyError = MyError String
derive newtype instance errorHasFlowRep :: HasFlowRep MyError

type Validated = V (Array MyError) Unit

startsWithI :: String -> Validated
startsWithI s =
  case stripPrefix (Pattern "I") s of
    Just _ -> pure unit
    Nothing -> invalid [MyError "didn't start with 'I'"]

containsDid :: String -> Validated
containsDid s =
  if contains (Pattern "did") s
    then pure unit
    else invalid [MyError "didn't contain 'did'"]

endsWithPeriod :: String -> Validated
endsWithPeriod s =
  case stripSuffix (Pattern ".") s of
    Just _ -> pure unit
    Nothing -> invalid [MyError "didn't end with '.'"]

type ValidationResultType = Variant
  ( errors :: Array MyError
  , success :: String
  )

newtype ValidationResult = ValidationResult ValidationResultType
instance validationResultHasFlowRep :: HasFlowRep ValidationResult where
  toFlowRep _ = "ValidationResult"

validateInput :: String -> ValidationResult
validateInput s =
  let
    result = s <$ startsWithI s <> containsDid s <> endsWithPeriod s
  in
    ValidationResult $ unV
      (inj (SProxy :: SProxy "errors"))
      (inj (SProxy :: SProxy "success"))
      result
