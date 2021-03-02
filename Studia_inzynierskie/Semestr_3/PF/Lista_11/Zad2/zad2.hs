{-# LANGUAGE KindSignatures, MultiParamTypeClasses, FlexibleInstances #-}

import Data.List (unfoldr)
import Data.Bool (bool)

(><) :: (a -> b) -> (a -> c) -> a -> (b,c)
(f >< g) x = (f x, g x)

warbler :: (a -> a -> b) -> a -> b
warbler f x = f x x


class Ord a => Prioq (t :: * -> *) (a :: *) where
    empty :: t a
    isEmpty :: t a -> Bool
    single :: a -> t a
    insert :: a -> t a -> t a
    merge :: t a -> t a -> t a
    extractMin :: t a -> (a, t a)
    findMin :: t a -> a
    deleteMin :: t a -> t a
    fromList :: [a] -> t a
    toList :: t a -> [a]
    insert = merge . single
    single = flip insert empty
    extractMin = findMin >< deleteMin
    findMin = fst . extractMin
    deleteMin = snd . extractMin
    fromList = foldr insert empty
    toList = unfoldr . warbler $ bool (Just . extractMin) (const Nothing) . isEmpty


newtype ListPrioq a = LP { unLP :: [a]}
    deriving Show

instance Ord a => Prioq ListPrioq a where
    empty = LP {unLP = []}
    isEmpty (LP []) = True
    isEmpty _ = False
    single v = LP [v]
    merge (LP xs) (LP ys) = LP (mrg xs ys) where
        mrg :: Ord a => [a] -> [a] -> [a]
        mrg xs [] = xs
        mrg [] ys = ys
        mrg (x:xs) (y:ys)
            | x < y = x : (mrg xs (y:ys))
            | otherwise = y : (mrg (x:xs) ys)
    insert v (LP xs) = LP (ins v xs) where
        ins :: Ord a => a -> [a] -> [a]
        ins v [] = [v]
        ins v (x:xs)
            | v < x = v:(x:xs)
            | otherwise = x : (ins v xs)
    extractMin (LP []) = error "empty queue"
    extractMin (LP (x:xs)) = (x, (LP xs))
    findMin (LP []) = error "empty queue"
    findMin (LP (x:xs)) = x
    deleteMin (LP []) = error "empty queue"
    deleteMin (LP (x:xs)) = (LP xs)
    fromList xs = (LP xs)
    toList (LP xs) = xs
        

