{-# LANGUAGE Rank2Types #-}

newtype Church = Church (forall a. (a -> a) -> (a -> a))

unChurch :: Church -> (forall a. (a -> a) -> (a -> a))
unChurch (Church n) = n

zero :: Church
zero = Church (\f x -> x)

successor :: Church -> Church
successor (Church n) = Church (\f x -> f (n f x))

predecessor :: Church -> Church
predecessor (Church n) = 
    Church (\f x -> n (\g h -> h (g f)) (\u -> x) (\u -> u))

add :: Church -> Church -> Church
add (Church n) (Church m) = Church (\f x -> m f (n f x))

multiply :: Church -> Church -> Church
multiply (Church n) (Church m) = Church (\f -> m (n f))

substract :: Church -> Church -> Church
substract m n = unChurch n predecessor m

isZero :: Church -> Bool
isZero (Church n) = n (\x -> False) True

intToChurch :: Integer -> Church
intToChurch 0 = zero
intToChurch n = successor $ intToChurch (n-1)

churchtoInt :: Church -> Integer
churchtoInt n
    | isZero n = 0
    | otherwise = 1 + (churchtoInt $ predecessor n)

instance Eq Church where
    n == m 
        |isZero n = isZero m
        |isZero m = isZero n
        |otherwise = predecessor n == predecessor m


instance Show Church where
    show n = show $ churchtoInt n

instance Ord Church where
    compare n m = compare (churchtoInt n) (churchtoInt m)
    n <= m = (churchtoInt n) <= (churchtoInt m)

instance Num Church where
    n + m = add n m
    n - m = substract n m
    n * m = multiply n m
    abs n = n
    signum n
        |isZero n = zero
        |otherwise = successor zero
    fromInteger = intToChurch
    negate n = n
      
    