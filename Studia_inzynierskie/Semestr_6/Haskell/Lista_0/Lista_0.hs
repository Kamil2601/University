
-- explode :: Integer -> [Integer]
-- explode = reverse . unfoldr aux
--   where
--     aux :: Integer -> Maybe (Integer, Integer)
--     aux 0 = Nothing
--     aux n = Just (n `mod` 10, n `div` 10)

-- implode :: [Integer] -> Integer
-- implode = foldl (\n m -> n * 10 + m) 0

subsequences :: [a] -> [[a]]
subsequences []       = [[]]
subsequences (x : xs) = foldr (\ys zss -> (x : ys) : zss) yss yss
    where yss = subsequences xs

inits :: [a] -> [[a]]
inits []       = [[]]
inits (x : xs) = [] : map (x :) (inits xs)

tails :: [a] -> [[a]]
tails []       = [[]]
tails (x : xs) = (x : head tails') : tails' where tails' = tails xs

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) =
    qsort [ y | y <- xs, y < x ] ++ [x] ++ qsort [ y | y <- xs, y >= x ]


isort :: Ord a => [a] -> [a]
isort []       = []
isort (x : xs) = insert x (isort xs)  where
    insert x [] = [x]
    insert x ys'@(y : ys) | x <= y    = x : ys'
                          | otherwise = y : (insert x ys)


elem' :: Eq a => a -> [a] -> Bool
elem' x [] = False
elem' x (y : ys) | x == y    = True
                 | otherwise = elem' x ys

intersperse :: a -> [a] -> [a]
intersperse x []       = []
intersperse x [y]      = [y]
intersperse x (y : ys) = y : x : (intersperse x ys)
