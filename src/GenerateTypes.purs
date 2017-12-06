module GenerateTypes where

import Prelude

import Bismuth (generateFlowType')
import Control.Monad.Aff (launchAff_)
import Data.Array (intercalate)
import Main as Main
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Text.Prettier (defaultOptions, format)

main = launchAff_ do
  writeTextFile UTF8 "./flow-src/GeneratedTypes.js" values
  where
    values = format defaultOptions $ "// @flow\n" <> intercalate "\n"
      [ generateFlowType' "add2" Main.add2
      , generateFlowType' "log" Main.log
      ]
