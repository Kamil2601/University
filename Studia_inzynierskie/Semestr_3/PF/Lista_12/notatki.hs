{-# LANGUAGE FunctionalDependencies , FlexibleContexts , FlexibleInstances #-}




instance Functor (State s) where
    fmap :: (a->b) -> State s a -> State s b
    fmap f (State g) = State h where
        h s = let (s' x) = g s in (s', f x)

{-
Applicative
<*> State s (a->b) -> State s (a) -> (State s b)
State <*>
-}

class Monad m => StreamTrans m i o | m -> i o where
    readS :: m (Maybe i)
    emitS :: o -> m ()

toLower :: StreamTrans m Char Char => m Integer

    do
        c <- readS
        Just capitals -> emitS(..)

instance StreamTrans IO Char Char where
    readS = ...
    emitS = ...

ListTrans i o a = LT {unLT :: [i]->([i],[o],[a])}
[o] - wsadzić listę pustą

instance Monad ( ListTrans i o ) where - monada stanu
    return :: a -> ListTrans i o a
    return x = LT

LT f >>= g


Zad5

class Monad m = > Nondet m where
    amb :: m a -> m a -> m a
    fail :: m 
    
match :: Nondet m => RegExpr -> String -> m ()

match :: Nondet m => RegExpr -> String -> m String