class Monad m => Random m where
    random :: m Int

newtype RS t = RS {unRS :: Int -> (Int, t )}

instance Functor RS where
    fmap g (RS h) = h' where
        h' = let (h1,h1) = (h x) in let 