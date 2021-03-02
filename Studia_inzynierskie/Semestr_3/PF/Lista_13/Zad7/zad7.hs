import Control.Monad

iperm :: MonadPlus m => [a] -> m [a]
iperm [] = return []
iperm (x:xs) = big_insert x (iperm xs)
        where
            big_insert :: MonadPlus m => a -> m [a] -> m [a]
            big_insert x yss = yss >>= (insert x)
                where
                    insert :: MonadPlus m =>  a -> [a] -> m [a]
                    insert x [] = return [x]
                    insert x (y:ys) = (return (x:y:ys)) `mplus` (fmap (mplus (return y)) (insert x ys))

sperm :: MonadPlus m => [a] -> m [a]
sperm [] = return []
sperm [x] = return [x]
sperm xs = (select xs) >>= (\(y,ys) -> fmap (\zs -> y:zs) (sperm ys))
        where
            select :: MonadPlus m => [a] -> m (a, [a])
            select [x] = return (x, [])
            select (x:xs) = (return (x,xs)) `mplus` fmap (\(y,ys) -> (y,x:ys)) (select xs)
            
iperm_test xs = (iperm xs)::[[Integer]]
sperm_test xs = (sperm xs)::[[Integer]]




