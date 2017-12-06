module GenerateTypes where

import Prelude

import Bismuth (toFlowRep')
import Bismuth.LibDef (createModuleDefinition)
import Control.Monad.Aff (launchAff_)
import Data.StrMap (fromFoldable)
import Data.Tuple (Tuple(..))
import Main as Main
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Text.Prettier (defaultOptions, format)

main = launchAff_ do
  writeTextFile UTF8 "./flow-lib/GeneratedDef.js" values
  where
    values = format defaultOptions $ "// @flow\n" <>
      createModuleDefinition
        "../output/Main"
        []
        (fromFoldable
          [ Tuple "add2" (toFlowRep' Main.add2)
          , Tuple "log" (toFlowRep' Main.log)
          ])
