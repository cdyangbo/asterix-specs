{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module:      Data.Asterix.Syntax.Xml
-- Copyright:   (c) 2019 Zoran Bošnjak
--              (c) 2019 Sloveniacontrol Ltd. (www.sloveniacontrol.si)
-- License:     GPL-3
-- Maintainer:  Zoran Bošnjak <zoran.bosnjak@sloveniacontrol.si>
--
-- This module defines '.xml' syntax.
--

module Data.Asterix.Syntax.Xml (syntax) where

import           Control.Monad
import           Control.Monad.Trans.State
import           Formatting as F
import           Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE

import           Data.Asterix.Types as Ast
import           Data.Asterix.Common
import           Data.Asterix.Indent

class Block a where
    enc :: a -> Accumulator ()

-- | Enclose inside a block.
enclosed :: Text -> Text -> Accumulator a -> Accumulator a
enclosed header footer act = do
    tell header
    result <- block act
    tell footer
    return result

-- | Escape XML special characters.
xml :: Text -> Text
xml = T.replace "&"     "&amp;"
    . T.replace "\""    "&quot;"
    . T.replace "'"     "&apos;"
    . T.replace "<"     "&lt;"
    . T.replace ">"     "&gt;"

instance Block a => Block (Maybe a) where
    enc Nothing = tell "<spare />"
    enc (Just x) = enc x

instance Block a => Block (Rule a) where
    enc Unspecified = tell "<raw />"
    enc (ContextFree a) = enc a
    enc (Dependent name rules) = enclosed
        (sformat ("<case item=\"" % stext % "\">") (showName name))
        "</case>"
        (forM_ rules $ \(i, rule) -> enclosed
            (sformat ("<of value=\"" % int % "\">") i)
            "</of>"
            (enc rule)
        )

instance Block Constrain where
    enc c = tell $ sformat ("<constrain type=\"" % stext % "\">" % stext % "</constrain>") a (showNumber b)
      where
        (a,b) = case c of
            EqualTo x -> ("eq", x)
            NotEqualTo x -> ("ne", x)
            GreaterThan x -> ("gt", x)
            GreaterThanOrEqualTo x -> ("ge", x)
            LessThan x -> ("lt", x)
            LessThanOrEqualTo x -> ("le", x)

instance Block Content where
    enc (ContentTable lst) = enclosed
        "<content type=\"table\">"
        "</content>"
        (forM_ lst $ \(i,t) -> tell $ sformat
            ("<value val=\"" % int % "\">" % stext % "</value>")
            i (xml t))
    enc (ContentString st) = tell $ sformat
        ("<content type=\"string\" variation=\"" % stext % "\" />") $ case st of
            StringAscii -> "ascii"
            StringICAO -> "icao"
    enc (ContentInteger signed constraints) = enclosed
        (sformat ("<content type=\"integer\" signed=\"" % stext % "\">") $ case signed of
            Signed -> "true"
            Unsigned -> "false"
            )
        "</content>"
        (mapM_ enc constraints)
    enc (ContentQuantity signed scaling fract unit constraints) = enclosed
        (sformat ("<content type=\"quantity\" signed=\"" % stext % "\" scaling=\"" % stext % "\" fractional_bits=\"" % int % "\" unit=\"" % stext % "\">")
            signed'
            (showNumber scaling)
            fract
            unit
        )
        "</content>"
        (mapM_ enc constraints)
      where
        signed' = case signed of
            Signed -> "true"
            Unsigned -> "false"

instance Block Variation where
    enc (Element n rule) = enclosed
        (sformat ("<variation type=\"element\" size=\"" % int % "\">") n)
        "</variation>"
        (enc rule)
    enc (Group items) = enclosed
        ("<variation type=\"group\">")
        "</variation>"
        (enclosed "<items>" "</items>" (mapM_ enc items))
    enc (Extended n1 n2 items) = enclosed
        (sformat ("<variation type=\"extended\" primary_size=\"" % int % "\" extension_size=\"" % int % "\">") n1 n2)
        "</variation>"
        (enclosed "<items>" "</items>" (mapM_ enc items))
    enc (Repetitive n variation) = enclosed
        (sformat ("<variation type=\"repetitive\" repetition_size=\"" % int % "\">") n)
        "</variation>"
        (enc variation)
    enc (Explicit) = tell "<variation type=\"explicit\" />"
    enc (Compound mItems) = enclosed
        ("<variation type=\"compound\">")
        "</variation>"
        (mapM_ enc mItems)

instance Block Item where
    enc (Spare n) = tell $ sformat ("<spare size=\"" % int % "\" />") n
    enc (Item name title variation (Documentation dDef dDesc dRem)) = enclosed header footer $ do
        enc variation
        doc "definition" dDef
        doc "description" dDesc
        doc "remark" dRem
      where
        header = sformat
            ("<item name=\"" % stext % "\" title=\"" % stext % "\">")
            (xml name)
            (xml title)
        footer = "</item>"
        doc t = \case
            Nothing -> return ()
            Just x -> enclosed
                ("<" <> t <> ">")
                ("</" <> t <> ">")
                (tell $ xml x)

instance Block Uap where
    enc = \case
        (Uap lst) -> enclosed "<uap>" "</uap>" $ mapM_ go lst
        (Uaps lst) -> enclosed "<uaps>" "</uaps>" $ forM_ lst $ \(name, lst') -> do
            enclosed (sformat ("<uap name=\"" % stext % "\">") name) "</uap>" $ mapM_ go lst'
      where
        go mName = tell $ sformat ("<item>" % stext % "</item>") $ maybe "-" id mName

instance Block Asterix where
    enc asterix = do
        tell "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
        tell ""
        enclosed header footer $ do
            tell $ sformat ("<title>" % stext % "</title>") (xml $ astTitle asterix)
            tell $ sformat ("<date>" % int % "-" % left 2 '0' % "-" % left 2 '0' % "</date>")
                year month day
            case astPreamble asterix of
                Nothing -> return ()
                Just preamble -> enclosed "<preamble>" "</preamble>" $ tell $ xml preamble
            enclosed "<items>" "</items>" $ mapM_ enc (astCatalogue asterix)
            enc $ astUap asterix
      where
        header = sformat
            ("<category cat=\"" % int % "\" edition=\"" % int % "." % int % "\">")
            (astCategory asterix) (editionMajor ed) (editionMinor ed)
        footer = "</category>"
        ed = astEdition asterix
        (Date year month day) = astDate asterix

-- | Syntax implementation
syntax :: Syntax
syntax = Syntax
    { syntaxDescription = "XML asterix syntax."
    , syntaxEncoder = Just encoder
    , syntaxDecoder = Nothing
    }
  where
    encoder = TE.encodeUtf8 . renderBuffer 4 . snd . flip execState (0,[]) . enc
