{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module:      Data.Asterix
-- Copyright:   (c) 2019 Zoran Bošnjak
--              (c) 2019 Sloveniacontrol Ltd. (www.sloveniacontrol.si)
-- License:     GPL-3
-- Maintainer:  Zoran Bošnjak <zoran.bosnjak@sloveniacontrol.si>
--
-- Common asterix data types and functions.
--

module Data.Asterix
( module Data.Asterix
, module Data.Asterix.Types
, module Data.Asterix.Syntax
) where

import           Data.List
import           Data.Maybe (catMaybes)
import qualified Data.Text as T

import           Data.Asterix.Types
import           Data.Asterix.Syntax

showPath :: [Name] -> T.Text
showPath = T.intercalate "/"

findItemByName :: Basic -> [Name] -> Maybe Item
findItemByName _ [] = Nothing
findItemByName basic (x:xs) = do
    let f (Spare _) = False
        f (Item name _ _ _) = name == x
    item <- find f $ basCatalogue basic
    go item xs
  where
    go item [] = Just item
    go item (y:ys) = case item of
        Spare _ -> Nothing
        Item _ _ variation _ -> do
            let candidates = case variation of
                    Group lst -> lst
                    Extended _ _ lst -> lst
                    Compound _fspecSize lst -> catMaybes lst
                    _ -> []
                byName (Spare _) = False
                byName (Item n _ _ _) = n == y
            nextItem <- find byName candidates
            go nextItem ys

