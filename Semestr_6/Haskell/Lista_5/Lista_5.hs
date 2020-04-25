{-|
Module      : Lista_5.hs
Copyright   : Kamil Michalak
-}

{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE IncoherentInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE ViewPatterns #-}

module Lista_5 where

import Control.Monad
import Control.Applicative

------------ Zadanie 1 --------------

class NFData a where
    rnf :: a -> ()

instance Num a => NFData a where
    rnf !n = n `seq` ()

instance NFData a => NFData [a] where
    rnf [] = ()
    rnf (!x:(!xs)) = rnf x `seq` rnf xs

instance (NFData a, NFData b) => NFData (a, b) where
    rnf (!a, !b) = rnf a `seq` rnf b

deepseq :: NFData a => a -> b -> b
deepseq !a !b = rnf a `seq` b

($!!) :: NFData a => (a -> b) -> a -> b
($!!) !f !x = x `deepseq` f $! x

------------ Zadanie 2 --------------

subseqM :: MonadPlus m => [a] -> m [a]
subseqM [] = return mzero
subseqM (x:xs) = do
    ys <- subseqM xs
    return (x:ys) `mplus` return ys

ipermM :: MonadPlus m => [a] -> m [a]
ipermM [] = return mzero
ipermM (x:xs) = ipermM xs >>= insert x
  where
    insert :: MonadPlus m => a -> [a] -> m [a]
    insert x [] = return [x]
    insert x ys'@(y:ys) = return (x:ys') `mplus` do
        (y :) <$> insert x ys

spermM :: MonadPlus m => [a] -> m [a]
spermM [] = return mzero
spermM xs = do
    (y,ys) <- select xs
    zs <- spermM ys
    return (y:zs)
  where
    select :: MonadPlus m => [a] -> m (a, [a])
    select []     = undefined
    select [x]    = return (x, [])
    select (x:xs) = return (x, xs) `mplus` do
        (y, ys) <- select xs
        return (y, x:ys)

------------ Zadanie 6 --------------

data List t a = Cons a (t a) | Nil
newtype SimpleList a = SimpleList { fromSimpleList :: List SimpleList a }

class ListView t where
    viewList :: t a -> List t a
    toList :: t a -> [a]
    toList (viewList -> Nil) = []
    toList (viewList -> Cons x xs) = x:(toList xs)
    cons :: a -> t a -> t a
    nil :: t a

data CList a = CList a :++: CList a | CSingle a | CNil deriving Show

instance ListView CList where
    viewList CNil = Nil
    viewList (CSingle x) = Cons x CNil
    viewList (xs :++: ys) = case viewList xs of
        Nil -> viewList ys
        Cons z zs -> Cons z (zs :++: ys)
    cons x CNil = CSingle x
    cons x (CSingle y) = (CSingle x) :++: (CSingle y)
    cons x (xs :++: ys) = (cons x xs) :++: ys
    nil = CNil

instance Functor CList where
    fmap f CNil = CNil
    fmap f (CSingle x) = CSingle (f x)
    fmap f (left :++: right) = (fmap f left) :++: (fmap f right)

instance Applicative CList where
    pure = CSingle
    CNil <*> _ = CNil
    _ <*> CNil = CNil
    fs <*> CSingle x = fmap (\f -> f x) fs
    fs <*> (xs :++: ys) = (fs <*> xs) :++: (fs <*> ys)

instance Monad CList where
    CNil >>= _ = CNil
    CSingle x >>= f = f x
    (xs :++: ys) >>= f = (xs >>= f) :++: (ys >>= f)

instance Alternative CList where
    empty = CNil
    xs <|> CNil = xs
    CNil <|> ys = ys
    xs <|> ys = xs :++: ys

instance MonadPlus CList where
    mzero = CNil
    xs `mplus` CNil = xs
    CNil `mplus` ys = ys
    xs `mplus` ys = xs :++:ys


instance Foldable CList where
    foldr _ s CNil = s
    foldr f s (CSingle x) = f x s
    foldr f s (xs :++: ys) = foldr f s' xs where
        s' = foldr f s ys

instance Traversable CList where
    traverse f CNil = pure CNil
    traverse f (CSingle x) = CSingle <$> f x
    traverse f (xs :++: ys) = pure (:++:) <*> traverse f xs <*> traverse f ys

fromList :: [a] -> CList a
fromList [] = CNil
fromList (x:xs) = CSingle x :++: fromList xs


------------ Zadanie 7 --------------

newtype DList a = DList { fromDList :: [a] -> [a] }

dappend :: DList a -> DList a -> DList a
dappend xs ys = DList $ (xs' ++) . (fromDList ys) where
    xs' = fromDList xs []

instance ListView DList where
    toList xs = fromDList xs []
    viewList xs = case toList xs of
        [] -> Nil
        (y:ys) -> Cons y (DList (\tl -> ys ++ tl))
    cons x xs = DList $ (x:) . (fromDList xs)
    nil = DList id

instance Functor DList where
    fmap f xs = DList (\tl -> ys ++ tl) where
        ys = map f (toList xs)

instance Applicative DList where
    pure x = DList (\tl -> x:tl)
    xs <*> ys = DList (\tl -> zs ++ tl) where
        zs = (toList xs) <*> (toList ys)

instance Monad DList where
    return x = DList (\tl -> x:tl)
    xs >>= f = let ys = map toList $ map f (toList xs) in
        DList (\tl -> (concat ys) ++ tl)

instance Alternative DList where
    empty = nil
    (<|>) = dappend

instance MonadPlus DList where
    mzero = nil
    mplus = dappend


x :: (a -> b -> b) -> b -> [a] -> b
x = foldr

instance Foldable DList where
    foldr f s xs = foldr f s (toList xs)

instance Traversable DList where
    traverse f xs = DList . (++) <$> traverse f (toList xs)

------------ Zadanie 8 --------------

data LTree a = LTree a :/\: LTree a | LLeaf a deriving Show
data Digit a = Zero | One (LTree a) deriving Show
newtype RAList a = RAList { fromRAList :: [Digit a] } deriving Show

ralookup :: RAList a -> Int -> a
ralookup (RAList xs) i = aux xs i 1 where
    aux [] _ _ = undefined
    aux (Zero:ys) i leafs = aux ys i (2*leafs)
    aux ((One t):ys) i leafs
        | leafs >= i = ltlookup t i leafs where
            ltlookup (LLeaf x) i _ = x
            ltlookup (left :/\: right) i l
                | i < l `div` 2 = (ltlookup left i (l `div` 2))
                | otherwise = (ltlookup right (i - l `div` 2) (l `div` 2))

raupdate :: RAList a -> Int -> a -> RAList a
raupdate (RAList xs) i v = RAList (aux xs i 1) where
    aux [] _ _ = []
    aux (Zero:ys) i leafs = Zero:(aux ys i (2*leafs))
    aux ((One t):ys) i leafs
        | leafs >= i = (One (ltupdate t i leafs)):ys where
            ltupdate (LLeaf x) i _ = LLeaf v
            ltupdate (left :/\: right) i l
                | i < l `div` 2 = (ltupdate left i (l `div` 2)) :/\: right
                | otherwise = left :/\: (ltupdate right (i - l `div` 2) (l `div` 2))


instance ListView RAList where
    nil = RAList []
    toList (RAList xs) = toList' xs where
        toList' [] = []
        toList' (Zero:ys) = toList' ys
        toList' ((One tree):ys) = treeToList tree ++ toList' ys where
            treeToList (LLeaf x) = [x]
            treeToList (left :/\: right) = (treeToList left) ++ (treeToList right)

    cons x (RAList xs) = RAList (join (LLeaf x) xs) where
        join t [] = [One t]
        join t (Zero:ys) = (One t):ys
        join t ((One t'):ys) = Zero:(join (t :/\: t') ys)

    viewList (RAList xs) = view xs where
        view [] = Nil
        view (Zero:ys) = view ys
        view ((One t):ys) = Cons z (RAList (zs ++ (consZeroIf ys)))
            where
                (One (LLeaf z):zs) = cutTree t
                cutTree :: LTree a -> [Digit a]
                cutTree x@(LLeaf x') = [One x]
                cutTree (left :/\: right) = (cutTree left) ++ [One right]
                consZeroIf [] = []
                consZeroIf zs = Zero:zs

instance Functor LTree where
    fmap f (LLeaf x) = LLeaf (f x)
    fmap f (left :/\: right) = (fmap f left) :/\: (fmap f right)

instance Functor Digit where
    fmap f Zero = Zero
    fmap f (One t) = One (fmap f t)

instance Functor RAList where
    fmap f (RAList xs) = RAList (map (fmap f) xs)

toRAList :: [a] -> RAList a
toRAList xs = RAList (aux xs (length xs) 1) where
    aux [] _ _ = []
    aux ys len leafs
        | even (len `div` leafs) = Zero:(aux ys len (2*leafs))
        | otherwise = (One tree):(aux zs (len-leafs) (2*leafs)) where
            (tree, zs) = makeTree ys leafs
            makeTree (q:qs) 1 = (LLeaf q, qs)
            makeTree qs l = (left :/\: right, tl) where
                half = l `div` 2
                (left, tl') = makeTree qs half
                (right, tl) = makeTree tl' half

instance Applicative RAList where
    pure x = RAList [One (LLeaf x)]
    xs <*> ys = toRAList $ (toList xs) <*> (toList ys)

instance Monad RAList where
    xs >>= f = let ys = concatMap toList $ map f (toList xs) in
        toRAList ys

instance Alternative RAList where
    empty = RAList []
    xs <|> ys = toRAList $ (toList xs) ++ (toList ys)

instance MonadPlus RAList where
    mzero = RAList []
    mplus = (<|>)

instance Foldable RAList where
    foldr f s xs = foldr f s (toList xs)
