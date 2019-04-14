import Prelude hiding ((++), head, tail, length, null, (!!))
import qualified Prelude ((++), head, tail, length, null, (!!))

class List l where
    nil :: l a
    cons :: a -> l a -> l a
    head :: l a -> a
    tail :: l a -> l a
    (++) :: l a -> l a -> l a
    (!!) :: l a -> Int -> a
    toList :: [a] -> l a
    fromList :: l a -> [a]
    
--ZADANIE 1
instance List [] where
    nil = []
    cons x xs = x:xs
    head [] = error "empty list"
    head (x:xs) = x
    tail [] = error "empty list"
    tail (x:xs) = xs
    xs ++ [] = xs
    [] ++ ys = ys
    (x:xs) ++ ys = x:(xs ++ ys)
    (!!) [] _ = error "empty list/wrong index"
    (!!) (x:xs) n
        | n == 0 = x
        | n > 0 = xs !! (n-1)
        | n < 0 = error "wrong index"
    toList xs = xs
    fromList xs = xs


------------------------------------
--ZADANIE 2
class List l => SizedList l where
    length :: l a -> Int
    null :: l a -> Bool
    null l = length l == 0

instance SizedList [] where
    length [] = 0
    length (x:xs) = 1 + length xs
    null [] = True
    null _ = False 
------------------------------------

--ZADANIE 3

data SL l a = SL {len :: Int, list :: l a}
    deriving(Show)


instance List l => List (SL l) where
    nil = SL 0 nil
    cons x xs = SL {len = ((len xs) + 1), list = (cons x (list xs))}
    head (SL 0 _) = error "empty list"
    head (SL _ xs) =  (head xs)
    tail (SL 0 _) = error "empty list"
    tail (SL n xs) = SL (n-1) (tail xs)
    (SL n xs) ++ (SL m ys) = SL (n+m) (xs ++ ys)
    (!!) (SL 0 _) _ = error "empty list"
    (!!) (SL n xs) i
        | i == 0 = (head xs)
        | i < 0 || i >= n = error "wrong index"
        | otherwise = xs !! i
    toList xs = SL (length xs) (toList xs)
    fromList (SL _ xs) = fromList xs

instance List l => SizedList (SL l) where
    length xs = len xs
    null (SL 0 _) = True
    null _ = False
---------------------------------------------


--ZADANIE 4

infixr 6 :+
data AppList a = Nil | Sngl a | AppList a :+ AppList a


instance Show a => Show (AppList a) where
    show t = "[" ++ (aux t) ++ "]"
        where
            aux Nil = ""
            aux (Sngl x) = (show x) ++ ", "
            aux (t1 :+ t2) = (aux t1) ++ (aux t2)

print_tree :: Show a => AppList a -> String
print_tree Nil = "Nil"
print_tree (Sngl x) = " (Sngl " ++ (show x) ++ ") "
print_tree (t1 :+ t2) = "( " ++ (print_tree t1) ++ " :+ " ++ (print_tree t2) ++ ")"

instance List AppList where
    nil = Nil
    cons x t = (Sngl x ) :+ t
    head Nil = error "empty list"
    head (Sngl x) = x
    head (t1 :+ t2) = head t1
    tail Nil = error "empty list"
    tail (Sngl _) = Nil
    tail ((Sngl _) :+ t2) = t2
    tail (t1 :+ t2) = (tail t1) :+ t2
    Nil ++ t2 = t2
    t1 ++ Nil = t1
    t1 ++ t2 = t1 :+ t2
    fromList Nil = []
    fromList (Sngl x) = [x]
    fromList (t1 :+ t2) = (fromList t1) ++ (fromList t2)
    toList [] = Nil
    toList [x] = (Sngl x)
    {-
    toList xs = let n = div (length xs) 2
        in concat (toList (take n xs)) (toList (drop n xs))
            where 
                concat Nil t2 = t2
                concat t1 Nil = t1
                concat t1 t2 = t1 :+ t2-}
    toList (x:xs) = (Sngl x) :+ (toList xs)
    (!!) t n = (fromList t) !! n



instance SizedList AppList where
    null Nil = True
    null _ = False
    length Nil = 0
    length (Sngl x) = 1
    length (t1 :+ t2) = (length t1) + (length t2)
    
-------------------------------


--ZADANIE 5

newtype DiffList a = DL ([a] -> [a])

instance Show a => Show (DiffList a) where
    show (DL f) = show (f [])

instance List DiffList where
    nil = DL id
    cons x (DL f) = DL (\xs -> x:(f xs))
    head (DL f) = head (f []) 
    tail (DL f) = DL (\xs -> (tail (f xs)))
    (DL f) ++ (DL g) = DL (\xs -> (f (g xs)))
    (DL f) !! n = (f []) !! n
    toList xs = DL (\ys -> xs ++ ys)
    fromList (DL f) = (f [])

instance SizedList DiffList where
    null (DL f) = aux (f []) where
        aux [] = True
        aux _ = False
    length (DL f) = length (f [])


-------------------------------------

--ZADANIE 6

data RAL a = Empty | Zero (RAL (a,a)) | One a (RAL (a,a))

instance Show a => Show (RAL a) where
    show Empty = ""
    --show (One (x,y) r) = (show $ One x Empty) ++ "," ++ (show  $ One y Empty) ++ "," ++ (show r)
    show (One x r) = (show x) ++ "," ++ (show r)
    show (Zero r) = (show r)

instance List RAL where
    nil = Empty
    cons x Empty = One x Empty
    cons x (Zero t) = One x t
    cons x (One y t) = Zero $ cons (x,y) t
    head Empty = error "empty list"
    head (One x t) = x
    head (Zero t) = fst $ head t
    tail Empty = error "empty list"
    tail (One x Empty) = Empty
    tail (One x t) = Zero t
    tail (Zero t) = One (snd $ head t) (tail t)
    Empty ++ t = t
    t ++ Empty = t
    t1 ++ t2 = cons (head t1) ((tail t1) ++ t2)
    Empty !! _ = error "empty list"
    t !! 0 = head t
    t !! n
        | n < 0 = error "wrong index"
        | otherwise = (tail t) !! (n-1)
    toList [] = Empty
    toList (x:xs) = cons x (toList xs)
    fromList Empty = []
    fromList t = (head t):(fromList (tail t))

instance SizedList RAL where
    null Empty = True
    null _ = False
    length Empty = 0
    length t = 1 + length (tail t)

    
    


-- z = Zero $ Zero $ One ((2,3),(4,5))  Empty