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
            
instance (StreamTrans IO Char Char) where
    readS' = do
        c <- getLine
        if c == "" then return Nothing else
            return (Just (head c))
    emitS' c = putChar c





