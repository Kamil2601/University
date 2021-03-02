import Data.Char
------------ Zadanie 1 -----------------

intercalate :: [a] -> [[a]] -> [a]
intercalate xs []         = []
intercalate xs [ys]       = ys
intercalate xs (ys : yss) = ys ++ xs ++ intercalate xs yss

transpose :: [[a]] -> [[a]]
transpose []   = []
transpose [xs] = map (:[]) xs
transpose (xs : xss) = zipWith (:) xs (transpose xss)

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ (concat' xs)

and' :: [Bool] -> Bool
and' [] = True
and' (False:xs) = False
and' (True:xs) = and' xs

and'' :: [Bool] -> Bool
and'' xs = foldl (&&) True xs

all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' p (x:xs)
    | not $ p x = False
    | otherwise = all' p xs

all'' :: (a -> Bool) -> [a] -> Bool
all'' f xs = foldl (\a b -> a && (f b)) True xs

all3 :: (a -> Bool) -> [a] -> Bool
all3 = flip foldr True . (flip (&&) .)

maximum' :: [Integer] -> Integer
maximum' [] = undefined
maximum' [x] = x
maximum' (x:xs)
    | x > m = x
    | otherwise = m
    where m = maximum' xs

maximum'' :: [Integer] -> Integer
maximum'' [x] = x
maximum'' (x:xs) = foldl max x xs

----------- Zadanie 2 -----------

zipWith' :: (a->b->c)->[a]->[b]->[c]
zipWith' f [] [] = []
zipWith' f (x:xs) (y:ys) = (f x y):(zipWith' f xs ys)
zipWith' _ _ _ = error "Different lenghts of lists!"

newtype Vector a = Vector { fromVector :: [a] } deriving(Show)

scaleV :: Num a => a -> Vector a -> Vector a
scaleV s (Vector xs) = Vector (map (*s) xs)

norm :: Floating a => Vector a -> a
norm (Vector xs) = sqrt $ foldl (\acc x -> acc + x*x) 0 xs

sumV :: Num a => Vector a -> Vector a -> Vector a
sumV (Vector xs) (Vector ys) = Vector (zipWith' (+) xs ys)

scalarProd' :: Num a => [a] -> [a] -> a
scalarProd' xs ys  = foldl (+) 0 (zipWith' (*) xs ys)

scalarProd :: Num a => Vector a -> Vector a -> a
scalarProd (Vector xs) (Vector ys) = scalarProd' xs ys


----------- Zadanie 3 -----------

newtype Matrix a = Matrix { fromMatrix :: [[a]] } deriving Show

sumM :: Num a => Matrix a -> Matrix a -> Matrix a
sumM (Matrix xss) (Matrix yss) = Matrix (zipWith' (zipWith' (+)) xss yss)

prodM :: Num a => Matrix a -> Matrix a -> Matrix a
prodM (Matrix xss) (Matrix yss) = Matrix (map (\xs -> prodVMt xs zss) xss) where
    zss = transpose yss
    prodVMt v m = map (scalarProd' v) m

det :: Num a => Matrix a -> a
det (Matrix m) = det' m where
    det' :: Num a => [[a]] -> a
    det' [[x]] = x
    det' []  = error "Wrong matrix size in 'det'' function!"
    det' (row:rows) = minorSum row (transpose rows)

    minorSum :: Num a => [a] -> [[a]] -> a
    minorSum xs yss = aux [] yss xs 1 where
        aux _ [] [] _ = 0
        aux left (mid:right) (y:ys) one = y * one * (det' (left ++ right))
            + (aux (left ++ [mid]) right ys (-one))
        aux _ _ _ _ = error "Wrong matrix size in 'minorSum' function!"

a1 = [[1,2,3,4],
      [5,6,1,8],
      [9,1,16,12],
      [13,14,15,16]]

a2 = [[1,2,3],
      [4,5,6],
      [7,8,9]]

m1 = Matrix a1

m2 = Matrix a2

delRow :: Num a => [[a]] -> [[[a]]]
delRow [xs] = []
delRow xs'@(xs:xss) = aux [] xs' where
    aux left [] = []
    aux left (mid:right) = (left ++ right) : (aux (left ++ [mid]) right)


----------- Zadanie 4 -----------

isbn13_check :: String -> Bool
isbn13_check num = (length num == 13) && ((calc num) `mod` 10 == 0) where
    calc num = sum (zipWith (*) digits (cycle [1,3])) where
        digits = map digitToInt num


----------- Zadanie 5 -----------

newtype Natural = Natural { fromNatural :: [Word] }
base :: Word
base = round $ sqrt $ fromIntegral (maxBound::Word)

baseInteger :: Integer
baseInteger = toInteger base

----------- Zadanie 6 -----------

addLists :: [Word] -> [Word] -> [Word]
addLists a b = add a b 0 where
    add [] [] 0 = []
    add [] [] carry = [carry]
    add (x:xs) [] carry = ((x+carry) `mod` base):(add xs [] ((x+carry) `div` base))
    add [] xs carry = add xs [] carry
    add (x:xs) (y:ys) carry = (res `mod` base):(add xs ys (res `div` base)) where
        res = x + y + carry

multByDigit :: [Word] -> Word -> [Word]
multByDigit xs y = mult xs 0 where
    mult :: [Word] -> Word -> [Word]
    mult [] 0 = []
    mult [] carry = [carry]
    mult (x:xs) carry = ((x*y+carry) `mod` base):(mult xs ((x*y+carry) `div` base))

instance Num Natural where
    abs n = n

    signum (Natural [0]) = Natural [0]
    signum _ = (Natural [1])

    fromInteger n
        | n == 0 = Natural [0]
        | n < 0 = error "Natural number cannot be less than 0!" 
        | otherwise = Natural $ aux n where
            aux :: Integer -> [Word]
            aux 0 = []
            aux m = (fromInteger (m `mod` baseInteger)):(aux (m `div` baseInteger))
    
    (+) (Natural a) (Natural b) = Natural (a `addLists` b) where
    
    (*) (Natural a) (Natural b) = Natural (mult a b) where
        mult :: [Word] -> [Word] -> [Word]
        mult xs [y] = multByDigit xs y
        mult xs (y:ys) = (multByDigit xs y) `addLists` (0:(mult xs ys)) where

    (-) (Natural a) (Natural b) = Natural $ sub 0 a b where
        sub :: Word -> [Word] -> [Word] -> [Word]
        sub 0      [] [] = []
        sub borrow [] [] = error "Natural underflow!"
        sub borrow xs [] = sub 0 xs [borrow]
        sub borrow [] xs = sub 0 [borrow] xs
        sub borrow (x:xs) (y:ys) = diff : sub borrow' xs ys
          where
            subBounded :: Word -> Word -> Word -> (Word, Word)
            subBounded borrow x y
                | x < y + borrow = (base + x - borrow - y, 1)
                | otherwise      = (x - y - borrow,        0)
            (diff, borrow') = subBounded borrow x y 

----------- Zadanie 7 -----------

instance Eq Natural where
    (==) (Natural a) (Natural b)
        | (length a) /= (length b) = False
        | otherwise = aux (reverse a) (reverse b) where
            aux [] [] = True
            aux (x:xs) (y:ys)
                | x /= y = False
                | otherwise = (aux xs ys)


instance Ord Natural where
    (<=) (Natural a) (Natural b)
        | (length a) < (length b) = True
        | (length a) > (length b) = False
        | otherwise = aux (reverse a) (reverse b) where
            aux [] [] = True
            aux (x:xs) (y:ys)
                | x < y = True
                | x > y = False
                | otherwise = aux xs ys


----------- Zadanie 8 -----------

instance Real Natural where
    toRational _ = undefined

instance Enum Natural where
    toEnum _ = undefined
    fromEnum _ = undefined

instance Integral Natural where
    toInteger (Natural n) = aux n 1 where
        aux :: [Word] -> Integer -> Integer
        aux [] _ = 0
        aux (x:xs) pow = (toInteger x * pow) + (aux xs (baseInteger*pow))

    quotRem (Natural a) (Natural b) = ((Natural quot), (Natural rem)) where
        (quot, rem) = aux a b where
            aux :: [Word] -> [Word] -> ([Word],[Word])
            aux _ _ = ([0],[0])


----------- Zadanie 9 -----------

instance Show Natural where
    show = show . toInteger

----------- Zadanie 10 -----------


-- val1 = (.)(.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- po zaaplikowaniu (.) do (.):
-- (b -> c) = (b1 -> c1) -> (a1 -> b1) -> a1 -> c1
-- b = (b1 -> c1)
-- c = (a1 -> b1) -> a1 -> c1
-- (a -> (b1 -> c1)) -> a -> (a1 -> b1) -> a1 -> c1
-- val1 :: (a -> b1 -> c1) -> a -> (a1 -> b1) -> a1 -> c1

-- val2 = (.)($)
-- ($) :: (a1 -> b1) -> a1 -> b1
-- po zaaplikowaniu (.) do ($)
-- b = (a1 -> b1) 
-- c = (a1 -> b1)
-- (a -> (a1 -> b1)) -> a -> (a1 -> b1)
-- val2 :: (a -> a1 -> b1) -> a -> a1 -> b1

-- val3 = ($)(.)
-- val3 :: (b -> c) -> (a -> b) -> a -> c

-- val4 = flip flip
-- flip :: (a -> b -> c) -> b -> a -> c
-- val4 :: b -> (a -> b -> c) -> a -> c

-- val5 = (.)(.)(.)
-- (.)(.) :: (a -> b1 -> c1) -> a -> (a1 -> b1) -> a1 -> c1
-- (.) :: (b2 -> c2) -> (a2 -> b2) -> a2 -> c2
-- a = (b2 -> c2)
-- b1 = (a2 -> b2)
-- c1 = (a2 -> c2)
-- val5 :: (b2 -> c2) -> (a1 -> a2 -> b2) -> a1 -> a2 -> c2

-- val6 = (.)($)(.)
-- (.)($) :: (a -> a1 -> b1) -> a -> a1 -> b1
-- (.) = (b2 -> c2) -> (a2 -> b2) -> a2 -> c2
-- a  = (b2 -> c2)
-- a1 = (a2 -> b2)
-- b1 = (a2 -> c2)
-- (b2 -> c2) -> (a2 -> b2) -> (a2 -> c2)
-- val6 :: (b2 -> c2) -> (a2 -> b2) -> a2 -> c2

-- val7 = ($)(.)(.)
-- ($)(.) :: (b -> c) -> (a -> b) -> a -> c
-- ^^^ to samo co typ (.) a (.)(.) już policzyliśmy
-- val7 ::  (a -> b1 -> c1) -> a -> (a1 -> b1) -> a1 -> c1

-- val8 = flip flip flip
-- flip :: (a -> b -> c) -> b -> a -> c
-- flip flip :: b1 -> (a1 -> b1 -> c1) -> a1 -> c1
-- b1 = (a -> b -> c) -> b -> a -> c
-- val8 :: (a1 -> ((a -> b -> c) -> b -> a -> c) -> c1) -> a1 -> c1

-- val9 = tail $ map tail [[], ['a']]
-- map :: (a -> b) -> [a] -> [b]
-- tail :: [a] -> [a]
-- [[], ['a']] :: [[Char]]
-- map tail [[], ['a']] :: [[Char]]
-- tail $ map tail [[], ['a']] :: [[Char]]
-- val9 :: [[Char]]

-- val10 = let x = x in x x
-- x ma polimorficzny typ (? first-class polymorphism ?)
-- val10 :: a

-- val11 = (\_ -> 'a') (head [])
-- head :: [a] -> a
-- head [] :: a
-- \_ -> 'a' :: a1 -> Char
-- val11 :: Char

-- val12 = (\(_,_) -> 'a') (head [])
-- head [] :: a
-- \(_,_) -> 'a' :: (a1, b) -> Char
-- a = (a1, b)
-- val12 :: Char

-- val13 = map map
-- map :: (a -> b) -> [a] -> [b]
-- a = (a1 -> b1)
-- b = [a1] -> [b1]
-- val13 :: [a1 -> b1] -> [[a1] -> [b1]]

-- val14 = map flip
-- flip :: (a -> b -> c) -> b -> a -> c
-- map :: (a1 -> b1) -> [a1] -> [b1]
-- a1 = a -> b -> c
-- b1 = b -> a -> c
-- val14 :: [a -> b -> c] -> [b -> a -> c]

-- val15 = flip map
-- val15 :: [a] -> (a -> b) -> [b]
