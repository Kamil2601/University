-- Kamil Michalak      --
-- Kurs języka Haskell --
-- Lista 6, 17.04.2020 --


------------- Zadanie 1 -------------

(><) :: [a] -> [b] -> [(a,b)]
(><) _ [] = []
(><) xs (y:ys) = aux xs ys [y] where
    aux :: [a] -> [b] -> [b] -> [(a,b)]
    aux [] _ _ = []
    aux xs@(x:xs') [] ypref = (zip xs ypref) ++ (aux xs' [] ypref)
    aux xs (y:ys) ypref = (zip xs ypref) ++ (aux xs ys (y:ypref))


natPairs :: [(Integer, Integer)]
natPairs = [0..] >< [0..]

------------- Zadanie 2 -------------

class Set s where
    emptyS :: s a
    searchS :: Ord a => a -> s a -> Maybe a
    insertS :: Ord a => a -> s a -> s a
    delMaxS :: Ord a => s a -> Maybe (a, s a)
    deleteS :: Ord a => a -> s a -> s a

class Dictionary d where
    emptyD :: d k v
    searchD :: Ord k => k -> d k v -> Maybe v
    insertD :: Ord k => k -> v -> d k v -> d k v
    deleteD :: Ord k => k -> d k v -> d k v

data KeyValue key value = KeyValue { key :: key, value :: value }
newtype SetToDict s k v = SetToDict (s (KeyValue k v))

instance Eq k => Eq (KeyValue k v) where
    (==) left right = (==) (key left) (key right)

instance Ord k => Ord (KeyValue k v) where
    (<=) left right = (<=) (key left) (key right)


instance Set s => Dictionary (SetToDict s) where
    emptyD = SetToDict emptyS
    searchD k (SetToDict s) =
        case searchS (KeyValue {key=k, value=undefined}) s of
            Nothing -> Nothing
            Just KeyValue {value=v} -> Just v
    insertD k v (SetToDict s) = SetToDict (insertS (KeyValue {key=k, value=v}) s)
    deleteD k (SetToDict s) = SetToDict (deleteS (KeyValue {key=k, value=undefined}) s)

------------- Zadanie 3 -------------

data PrimRec = Zero | Succ | Proj Int Int
    | Comb PrimRec [PrimRec] | Rec PrimRec PrimRec

arityCheck :: PrimRec -> Maybe Int
arityCheck Zero = Just 1
arityCheck Succ = Just 1
arityCheck (Proj i n)
    | i > 0 && n > 0 && i <= n = Just n
    | otherwise = Nothing
arityCheck (Comb f gs) = case arityCheck f of
    Nothing -> Nothing
    Just m -> aux m where
        aux m
            | m <= 0 = Nothing
            | m /= (length gs) = Nothing
            | otherwise = if (aux' gs) then Just m else Nothing where
                aux' (x:xs) = headArity /= Nothing &&
                    all (\g -> (arityCheck g) == headArity) xs where
                        headArity = arityCheck x
arityCheck (Rec g h) = case arityCheck g of
    Nothing -> Nothing
    Just n -> case arityCheck h of
        Just m -> if m == n+2 then Just (n+1) else Nothing
        Nothing -> Nothing


------------- Zadanie 4 -------------

evalPrimRec :: PrimRec -> [Integer] -> Integer
evalPrimRec primRec xs = case arityCheck primRec of
    Nothing -> error "Incorrect function!"
    Just n -> aux primRec xs where
        aux evalPrimRec xs
            | length xs == n && all (>= 0) xs = eval primRec xs
            | otherwise = error "Incorrect arguments!"
        where
            eval Zero _ = 0
            eval Succ [n] = n+1
            eval (Proj i _) args = args !! (i-1)
            eval (Comb f gs) args = let results = map (\g -> eval g args) gs in
                eval f results
            eval (Rec g h) (0:args) = eval g args
            eval f@(Rec g h) (n:args) = let resRec = eval f ((n-1):args) in
                eval h (n:resRec:args)

 ------------- Zadanie 5 -------------

data Nat = S Nat | Z deriving Show

iter :: (a -> a) -> a -> Nat -> a
iter _ g Z = g
iter f g (S n) = f (iter f g n)

rec :: (Nat -> a -> a) -> a -> Nat -> a
rec f g = snd . iter (\(n, x) -> (S n, f n x)) (Z, g)

 ------------- Zadanie 6 -------------

reverse' :: [a] -> [a]
reverse' = foldr (\x acc -> acc ++ [x]) []

tail' :: [a] -> [a]
tail' xs = fst $ foldr f ([],xs) xs where
    f x (acc,[y]) = (acc, [])
    f x (acc, y:ys) = (x:acc, ys)

zip' :: [a] -> [b] -> [(a, b)]
zip' = foldr f (const [])
  where
    f x r []     = []
    f x r (y:ys) = (x,y) : r ys


 ------------- Zadanie 7 -------------

data RAList a = RAZero (RAList (a,a)) | RAOne a (RAList (a,a)) | RANil deriving Show

data List t a = Cons a (t a) | Nil deriving Show

class ListView t where
    viewList :: t a -> List t a
    toList :: t a -> [a]
    cons :: a -> t a -> t a
    nil :: t a

unpack :: [(a, a)] -> [a]
unpack = foldr (\(l,r) acc -> l:r:acc) []

instance ListView RAList where
    nil = RANil

    toList RANil = []
    toList (RAZero xs) = unpack (toList xs)
    toList (RAOne x xs) = x:(unpack (toList xs))

    cons x RANil = RAOne x RANil
    cons x (RAZero xs) = RAOne x xs
    cons x (RAOne y xs) = RAZero (cons (x,y) xs)

    viewList RANil = Nil
    viewList (RAOne x xs) = Cons x (RAZero xs)
    viewList (RAZero xs) = case viewList xs of
        Nil -> Nil
        Cons (l,r) (RAZero RANil) -> Cons l (RAOne r RANil)
        Cons (l,r) ys -> Cons l (RAOne r ys)


