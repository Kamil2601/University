{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Monads {- ? -} where

import Prelude hiding (Monad, return) -- note: not hiding (>>=)
import Test.QuickCheck
import Control.Monad

class (Functor m) => Monad m where
  return :: a -> m a
  join :: m (m a) -> m a

law1 :: (Eq (m a), Monad m) => m a -> Bool
law1 m = (join . fmap return) m == id m

law2 :: (Eq (m a), Monad m) => m a -> Bool
law2 m = (join . return) m == id m

law3 :: (Eq (m a), Monad m) => m (m (m a)) -> Bool
law3 m = (join . fmap join) m == (join . join) m


-------------------------
-- Kill-all list monad(?)
-------------------------

isSingle :: [a] -> Bool
isSingle [a] = True
isSingle _   = False

trivial :: [[a]] -> Bool
trivial [xs] = True
trivial xss  = all isSingle xss

newtype KAList a = KAList { unKAList :: [a] }
--   deriving (Functor, Eq)

-- instance (Show a) => Show (KAList a) where
--   show (KAList xs) = show xs

-- instance Monad KAList where
--   return x = KAList [x]
--   join (KAList xss) = KAList $ if
--     | trivial xss' -> concat xss'
--     | otherwise    -> []
--    where
--     xss' = map unKAList xss

instance Arbitrary a => Arbitrary (KAList a) where
  arbitrary = do
    return $ ((KAList []) :: KAList a)

-- Postaw ptaszka:
-- [ ] Monada
-- [ ] Nie monada
--
-- Jeśli nie monada, to wpisz kontrprzykład: 


--------------------------------
-- Kill singletons list monad(?)
--------------------------------

newtype KSList a = KSList { unKSList :: [a] }
  deriving (Functor, Eq)

instance (Show a) => Show (KSList a) where
  show (KSList xs) = show xs

instance Monad KSList where
  return x = KSList [x]
  join (KSList xss) = KSList $ if
    | trivial xss' -> concat xss'
    | otherwise    -> concat $ filter (not . isSingle) xss'
   where
    xss' = map unKSList xss

-- Postaw ptaszka:
-- [ ] Monada
-- [ ] Nie monada
--
-- Jeśli nie monada, to wpisz kontrprzykład: 


----------------------------
-- Kill primes list monad(?)
----------------------------

isPrime :: Int -> Bool
isPrime n = all (\k -> n `mod` k /= 0) $ takeWhile (\k -> k*k <= n) primes
  
primes :: [Int]
primes = 2 : [n | n <- [3,5..], isPrime n]

newtype KPList a = KPList { unKPList :: [a] }
  deriving (Functor, Eq)

instance (Show a) => Show (KPList a) where
  show (KPList xs) = show xs

instance Monad KPList where
  return x = KPList [x]
  join (KPList xss) = KPList $ if
    | trivial xss'                -> concat xss'
    | any null xss'               -> []
    | isPrime (length xss')       -> []
    | any (isPrime . length) xss' -> []
    | otherwise                   -> concat xss'
   where
    xss' = map unKPList xss

-- Postaw ptaszka:
-- [ ] Monada
-- [ ] Nie monada
--
-- Jeśli nie monada, to wpisz kontrprzykład: 


-----------------------
-- Palindromad monad(?)
-----------------------

palindromize :: [a] -> [a]
palindromize xs = xs ++ reverse (init xs)

newtype Palindromad a = Palindromad { unPalindromad :: [a] }
  deriving (Functor, Eq)

instance (Show a) => Show (Palindromad a) where
  show (Palindromad xs) = show xs

instance Monad Palindromad where
  return x = Palindromad [x]
  join (Palindromad xss) = Palindromad $ if
    | null xss      -> []
    | any null xss' -> []
    | otherwise     -> (init xss' >>= palindromize) ++ last xss'
   where
    xss' = map unPalindromad xss

-- Postaw ptaszka:
-- [ ] Monada
-- [ ] Nie monada
--
-- Jeśli nie monada, to wpisz kontrprzykład: 


-----------------------------
-- Short Palindromad monad(?)
-----------------------------

newtype SPalindromad a = SPalindromad { unSPalindromad :: [a] }
  deriving (Functor, Eq)

instance (Show a) => Show (SPalindromad a) where
  show (SPalindromad xs) = show xs

instance Monad SPalindromad where
  return x = SPalindromad [x]
  join (SPalindromad xss) = SPalindromad $ take 100 $ if
    | trivial xss'  -> concat xss'
    | null xss      -> []
    | any null xss' -> []
    | otherwise     -> (init xss' >>= palindromize) ++ last xss'
   where
    xss' = map unSPalindromad xss

-- Postaw ptaszka:
-- [ ] Monada
-- [ ] Nie monada
--
-- Jeśli nie monada, to wpisz kontrprzykład: 
