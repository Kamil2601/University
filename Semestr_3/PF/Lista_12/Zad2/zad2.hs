{-# LANGUAGE FunctionalDependencies , FlexibleContexts , FlexibleInstances #-}
import Data.Char

{-
class Applicative m => Monad (m :: * -> *) where
    (>>=) :: m a -> (a -> m b) -> m b
    (>>) :: m a -> m b -> m b
    return :: a -> m a
    fail :: String -> m a-}
--    {-# MINIMAL (>>=) #-}

class Monad m => StreamTrans m i o | m -> i o where
    readS' :: m (Maybe i)
    emitS' :: o -> m ()

    
newtype ListTrans i o a = LT' {unLT :: [i] -> ([i], [o], a)}

instance Functor (ListTrans i o) where
    fmap g (LT' f) = LT' h
        where
            h xs = let (fi, fo, fa) = (f xs) in
                (fi, fo, (g fa))

instance Applicative (ListTrans i o) where
    pure a = LT' (\xs -> (xs,[],a))
    (<*>) (LT' g) (LT' f) = (LT' h) where
        h xs = let (fi, fo, fa) = (f xs) in
                let (gi,go,ga) = (g xs) in
                    (fi,fo,ga fa) 
    


instance Monad (ListTrans i o) where
    return a = pure a
    (>>=) (LT' f) g = LT' h
        where
            h xs = 
                let (fi,fo,fa) = f xs in let (LT' k) = g fa in 
                    let (ki,ko,ka) = k fi in (ki,ko ++ fo, ka)



instance StreamTrans (ListTrans i o) i o where
    readS' = LT' h where
        h [] = ([],[],Nothing)
        h (x:xs) = (xs,[],(Just x))
    emitS' x = LT' (\xs -> (xs,[x],()))


transform :: ListTrans i o a -> [i] -> ([o], a)
transform (LT' f) xs = let (fi,fo,a) = f xs in (fo,a)



toLower' :: StreamTrans m Char Char => m Integer
toLower' = aux 0
        where
            aux :: StreamTrans m Char Char => Integer -> m Integer
            aux n = do
                c <- readS'
                if c==Nothing then return n
                else do
                    let (Just x) = c in emitS' (toLower x)
                    let (Just x) = c in if (toLower x) == x then aux n else aux (n+1)


transform_to_lower :: [Char] -> ([Char],Integer)
transform_to_lower xs = let (str,n) = transform toLower' xs in (reverse str, n)