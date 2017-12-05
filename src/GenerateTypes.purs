module GenerateTypes where

import Prelude

import Bismuth (class HasFlowRep, generateFlowType)
import Control.Monad.Aff (launchAff_)
import Data.Array (intercalate)
import Main as Main
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Text.Prettier (defaultOptions, format)
import Type.Prelude (Proxy(..))

generateFlowType' :: forall a
   . HasFlowRep a
  => String
  -> a
  -> String
generateFlowType' s a = generateFlowType s (Proxy :: Proxy a)

main = launchAff_ do
  writeTextFile UTF8 "./flow-src/GeneratedTypes.js" values
  where
    values = format defaultOptions $ "// @flow\n" <> intercalate "\n"
      [ generateFlowType' "add2" Main.add2
      ]
