-- Kamil Michalak 299089
-- Kurs języka Haskell
-- Lista 11, 20.06.2020

{-# LANGUAGE ExistentialQuantification, RankNTypes, FlexibleInstances, QuantifiedConstraints #-}

import Control.Monad (ap, MonadPlus, mzero, mplus)
import Control.Applicative (Alternative, empty, (<|>))


-- Zadanie 1
data Yoneda f a = Yoneda (forall x. (a -> x) -> f x)

instance Functor t => Functor (Yoneda t) where
    fmap f (Yoneda g) = Yoneda h where
        xs = g id
        ys = fmap f xs
        h p = fmap p ys

fromYoneda :: Yoneda f a -> f a
fromYoneda (Yoneda t) = t id

toYoneda :: (Functor f) => f a -> Yoneda f a
toYoneda xs = Yoneda (\g -> fmap g xs)

-- Zadanie 2
newtype DList a = DList { fromDList :: [a] -> [a] }

repDList :: DList a -> Yoneda DList a
repDList (DList fxs) = Yoneda f where
    xs = fxs []
    f g = DList (\tl -> map g xs ++ tl)

repList :: [a] -> Yoneda DList a
repList xs = Yoneda f where
    f g = DList (\tl -> (map g xs) ++ tl)

-- instance Semigroup (Yoneda DList a) where
--     (Yoneda gxs) <> (Yoneda gys) = Yoneda inside where
--         fxs = fromDList $ gxs id
--         fys = fromDList $ gys id
--         inside = (\transform -> 
--             DList (\tl -> map transform (fxs $ fys []) ++ tl))

-- Zadanie 3
instance Functor DList where
    fmap f (DList fxs) = DList fys where
        xs = fxs []
        ys = map f xs
        fys tl = ys ++ tl

instance Semigroup (DList a) where
    (DList fxs) <> (DList fys) = DList fzs where
        fzs = fxs . fys

instance (Functor f, forall x. (Semigroup (f x))) => Semigroup (Yoneda f a) where
    (Yoneda fxs) <> (Yoneda fys) = Yoneda fzs where
        xs = fxs id
        ys = fys id
        zs = xs <> ys
        fzs t = fmap t zs

-- Zadanie 4

newtype Cod f a = Cod { runCod :: forall x. (a -> f x) -> f x }

instance Functor (Cod f) where
    fmap f (Cod m) = Cod $ \k -> m (\x -> k (f x))

instance Applicative (Cod f) where
    pure  = return
    (<*>) = ap

instance Monad (Cod f) where
    return x = Cod $ \k -> k x
    m >>= k = Cod $ \c -> runCod m (\a -> runCod (k a) c)

fromCod :: (Monad m) => Cod m a -> m a
fromCod (Cod f) = f return

toCod :: (Monad m) => m a -> Cod m a
toCod m = Cod (\f -> m >>= f)

instance (Alternative v) => Alternative (Cod v) where
    empty = undefined
    (<|>) = undefined

instance MonadPlus m => MonadPlus (Cod m) where
    mzero = toCod mzero
    mplus left right = toCod $ fromCod left `mplus` fromCod right
