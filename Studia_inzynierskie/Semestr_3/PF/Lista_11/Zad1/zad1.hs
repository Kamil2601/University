ana :: (b -> Maybe (a, b)) -> b -> [a]
ana f st = case f st of
    Nothing -> []
    Just (v, st') -> v : ana f st'

iterate' :: (a -> a) -> a ->[a]
iterate' f v = ana (\x -> Just((f x),(f x)) ) v


map' :: (a -> b) -> ([a] -> [b])
map' f xs = ana ( \ys -> case ys of
                        [] -> Nothing
                        (z:zs) -> Just((f z),zs)) xs

zip' :: [a] -> [b] -> [(a,b)]
zip' xs ys = ana f (xs,ys)
    where
        f :: ([a],[b]) -> Maybe((a,b),([a],[b]))
        f ([], _) = Nothing
        f (_, []) = Nothing
        f (x:xs, y:ys) = Just((x,y),(xs,ys))

cata :: (a -> b -> b) -> b -> [a] -> b
cata f v [] = v
cata f v (x:xs) = f x (cata f v xs)

length' :: [a] -> Integer
length' xs = cata (\_ res -> res + 1) 0 xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = cata (\elem res -> if p elem then elem:res else res) [] xs


data Expr a b =
    Number b
    | Var a
    | Plus (Expr a b) (Expr a b)

data Either3 a b c =
    Left' a
    | Middle' b
    | Right' c


anaExpr :: (c -> Either3 a b (c,c)) -> c -> Expr b a
anaExpr f st = case f st of
    Left' num -> Number num
    Middle' var -> Var var
    Right' (r,l) -> Plus (anaExpr f l) (anaExpr f r)

cataExpr :: (a -> b, b -> b -> b) -> Expr a b -> b
cataExpr f@(env, g) expr = case expr of 
    Number n -> n
    Var x -> env x
    Plus a b -> g (cataExpr f a) (cataExpr f b)


eval :: Num b => Eq a => [(a , b)] -> Expr a b -> b
eval env expr = cataExpr (lookup, (+)) expr
    where
        lookup var = snd (head (filter' ((== var) . fst) env))