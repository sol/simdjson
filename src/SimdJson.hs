{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module SimdJson where

import Prelude hiding (length)
import Data.Array.Byte
import Foreign.C
import GHC.Exts

isValidUtf8 :: ByteArray -> Int -> Int -> Bool
isValidUtf8 (ByteArray payload) offset length = result /= 0
  where
    result = c_simdjson_validate_utf8 payload (fromIntegral offset) (fromIntegral length)

foreign import ccall unsafe "_hs_simdjson_validate_utf8" c_simdjson_validate_utf8 :: ByteArray# -> CSize -> CSize -> CBool
