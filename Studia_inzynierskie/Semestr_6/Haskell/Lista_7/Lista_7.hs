-- Kamil Michalak      --
-- Kurs języka Haskell --
-- Lista 7, 24.04.2020 --

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE KindSignatures, GADTs #-}

--------- Zadanie 1 -----------

import Data.List(unfoldr)

data PEmpty a = PEmpty
data PFork t a = PFork (t a) a (t a)
data Pennant t a = Pennant a (t a)
data PList t a = PNil
    | PZero (PList (PFork t) a)
    | POne (Pennant t a) (PList (PFork t) a)
newtype PHeap a = PHeap (PList PEmpty a)


class Prioq t a where
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
    extractMin t = (findMin t, deleteMin t)
    findMin = fst . extractMin
    deleteMin = snd . extractMin
    fromList = foldr insert empty
    toList = unfoldr (\ t -> if isEmpty t then Nothing else Just (extractMin t))

instance Ord a => Prioq PHeap a where
    empty = PHeap PNil
    isEmpty (PHeap PNil) = True
    isEmpty _ = False
    single x = PHeap $ POne (Pennant x PEmpty) PNil
    
    merge (PHeap left) (PHeap right) = PHeap (merge' left right Nothing) where
        mergePennant :: Ord a => Pennant t a -> Pennant t a -> Pennant (PFork t) a
        mergePennant (Pennant x xs) (Pennant y ys)
            | x < y = Pennant x (PFork xs y ys)
            | otherwise = Pennant y (PFork xs x ys)

        merge' :: Ord a => PList t a -> PList t a -> Maybe (Pennant t a) -> PList t a
        merge' xs PNil Nothing = xs
        merge' PNil ys Nothing = ys
        merge' PNil PNil (Just p) = POne p PNil
        merge' (PZero xs) (PZero ys) Nothing =
            PZero (merge' xs ys Nothing)
        merge' (PZero xs) (PZero ys) (Just p) = POne p (merge' xs ys Nothing )
        merge' (POne p xs) (PZero ys) Nothing = POne p (merge' xs ys Nothing )
        merge' (PZero xs) (POne p ys) Nothing = POne p (merge' xs ys Nothing )
        merge' (POne xp xs) (POne yp ys) Nothing =
            PZero (merge' xs ys (Just (mergePennant xp yp)))
        merge' (POne xp xs) (POne yp ys) (Just p) =
            POne p (merge' xs ys (Just (mergePennant xp yp)))

    findMin (PHeap pList) = find pList where
        find :: Ord a => PList t a -> a
        find PNil = error "Empty heap!"
        find (POne (Pennant x f) PNil) = x
        find (POne (Pennant x f) xs) = min x (find xs)
        find (PZero xs) = find xs

    -- deleteMin ph = delete (findMin ph) ph where
    --     delete = PHeap 


--------- Zadanie 3 -----------

infixl 6 :*, :/
infixl 5 :+, :-
infixl 4 :<, :>, :<=, :>=, :!=, :==
infixl 3 :&&
infixl 2 :||
infixl 1 :?

data Expr a where
    C :: a -> Expr a
    P :: (Expr a, Expr b) -> Expr (a,b)
    Not :: Expr Bool -> Expr Bool
    (:+), (:-), (:*) :: Expr Integer -> Expr Integer -> Expr Integer
    (:/) :: Expr Integer -> Expr Integer -> Expr (Integer,Integer)
    (:<), (:>), (:<=), (:>=), (:!=), (:==)
        :: Expr Integer -> Expr Integer -> Expr Bool
    (:&&), (:||) :: Expr Bool -> Expr Bool -> Expr Bool
    (:?) :: Expr Bool -> Expr a -> Expr a -> Expr a
    Fst :: Expr (a,b) -> Expr a
    Snd :: Expr (a,b) -> Expr b


eval :: Expr a -> a
eval (C x) = x
eval (P (a, b)) = (eval a, eval b)
eval (Not expr) = not (eval expr)
eval (a :+ b) = (eval a) + (eval b)
eval (a :- b) = (eval a) - (eval b)
eval (a :* b) = (eval a) * (eval b)
eval (a :/ b) = (evalA `div` evalB, evalA `mod` evalB) where
    evalA = eval a
    evalB = eval b
eval (a :< b) = (eval a) < (eval b)
eval (a :> b) = (eval a) > (eval b)
eval (a :<= b) = (eval a) <= (eval b)
eval (a :>= b) = (eval a) >= (eval b)
eval (a :!= b) = (eval a) /= (eval b)
eval (a :== b) = (eval a) == (eval b)
eval (a :&& b) = (eval a) && (eval b)
eval (a :|| b) = (eval a) || (eval b)
eval ((:?) cond ifTrue ifFalse) = case eval cond of
    True -> eval ifTrue
    False -> eval ifFalse
eval (Fst expr) = fst (eval expr)
eval (Snd expr) = snd (eval expr)

--------- Zadanie 4 -----------

data Zero :: *
data Succ :: * -> *

data Red :: *
data Black :: *

data Tree :: * -> * -> * -> * where
    Empty :: Tree Black Zero a
    Black :: Tree c1 h a -> a -> Tree c2 h a -> Tree Black (Succ h) a
    Red :: Tree Black h a -> a -> Tree Black h a -> Tree Red h a

data RedBlackTree :: * -> * where
    RedBlackTree :: Tree Black h a -> RedBlackTree a

find :: Ord a => a -> RedBlackTree a -> Bool
find key (RedBlackTree tree) = aux key tree where
    aux :: Ord a => a -> Tree col h a -> Bool
    aux k Empty = False
    aux k (Black l v r)
        | k == v = True
        | k < v = aux k l
        | k > v = aux k r

flatten :: RedBlackTree a -> [a]
flatten (RedBlackTree tree) = aux tree where
    aux :: Tree col h a -> [a]
    aux Empty = []
    aux (Black l v r) = (aux l) ++ [v] ++ (aux r)
