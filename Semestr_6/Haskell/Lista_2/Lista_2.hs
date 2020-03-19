{-# LANGUAGE ParallelListComp #-}

-------- Zadanie 1 -----------

subseqC :: [a] -> [[a]]
subseqC []       = [[]]
subseqC (x : xs) = concat [ [x : subseq, subseq] | subseq <- res ]
    where res = subseqC xs

ipermC :: [a] -> [[a]]
ipermC []       = [[]]
ipermC (x : xs) = concat [ insert x perm | perm <- ipermC xs ]  where
    insert x []           = [[x]]
    insert x ys'@(y : ys) = (x : ys') : map (y :) (insert x ys)

spermC :: [a] -> [[a]]
spermC [] = [[]]
spermC xs = concat [ map (y :) (spermC ys) | (y, ys) <- select xs ]  where
    select :: [a] -> [(a, [a])]
    select []       = []
    select (x : xs) = (x, xs) : [ (z, x : zs) | (z, zs) <- select xs ]

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) =
    qsort [ y | y <- xs, y <= x ] ++ x : (qsort [ y | y <- xs, y > x ])

zipC :: [a] -> [b] -> [(a,b)]
zipC xs ys = [(x,y) | x <- xs | y <- ys]

-------- Zadanie 2 -----------

subseqF :: [a] -> [[a]]
subseqF []       = [[]]
subseqF xs = foldr ((:) . (:) (head xs)) yss yss where yss = subseqF xs


ipermF :: [a] -> [[a]]
ipermF [] = [[]]
ipermF (x:xs) = concatMap insert (ipermF xs) where
    insert [] = [[x]]
    insert ys'@(y:ys) = (x:ys') : map (y:) (insert ys)

qsortP :: Ord a => [a] -> [a]
qsortP [] = []
qsortP xs = q xs where
    q = (concat .
            (
                (
                    zipWith ($)
                    [((uncurry ((qsortP .) . ((flip (.) tail) . (filter . ((>=) . head))))) . ((,) <*> id)),
                    ((:[]) . head),
                    ((uncurry ((qsortP .) . ((flip (.) tail) . (filter . ((<) . head))))) . ((,) <*> id))]
                ) . (cycle . (:[]))
            ))

---------- Zadanie 3 --------------

data Combinator = S | K | Combinator :$ Combinator
infixl :$

instance Show Combinator where
    show S = "S"
    show K = "K"
    show (left :$ right@(_:$_)) = show left ++ "(" ++ show right ++ ")"
    show (left :$ right)        = show left ++ show right

---------- Zadanie 4 --------------

evalC :: Combinator -> Combinator
evalC S = S
evalC K = K
evalC (K :$ x :$ _) = evalC x
evalC (S :$ x :$ y :$ z) = evalC (evalC x) :$ (evalC z) :$ (evalC (y :$ z))

---------- Zadanie 5 --------------

data BST a = NodeBST (BST a) a (BST a) | EmptyBST deriving Show

searchBST :: Ord a => a -> BST a -> Maybe a
searchBST x EmptyBST = Nothing
searchBST x (NodeBST left y right)
    | x == y = Just x
    | x < y = searchBST x left
    | otherwise = searchBST x right

insertBST :: Ord a => a -> BST a -> BST a
insertBST x EmptyBST = NodeBST EmptyBST x EmptyBST
insertBST x tree@(NodeBST left y right)
    | y == x = tree
    | x < y = NodeBST (insertBST x left) y right
    | otherwise = NodeBST left y (insertBST x right)


----------- Zadanie 6 --------------

deleteMaxBST :: Ord a => BST a -> (BST a, a)
deleteMaxBST EmptyBST = error "Empty BST"
deleteMaxBST (NodeBST left x EmptyBST) = (left, x)
deleteMaxBST (NodeBST left x right) = (NodeBST left x bst, res) where
    (bst, res) = deleteMaxBST right


deleteBST :: Ord a => a -> BST a -> BST a
deleteBST x EmptyBST = EmptyBST
deleteBST x (NodeBST left y right)
    | x < y = NodeBST (deleteBST x left) y right
    | x > y = NodeBST left y (deleteBST x right)
deleteBST x (NodeBST EmptyBST y right)
    | x == y = right
deleteBST x (NodeBST left y EmptyBST)
    | x == y = left 
deleteBST x (NodeBST left y right)
    | x == y = (NodeBST delMaxLeft maxLeft right) where
        (delMaxLeft, maxLeft) = deleteMaxBST left


-- tree = NodeBST EmptyBST 3 EmptyBST
-- tree2 = insertBST 5 tree
-- tree3 = insertBST 2 tree2
-- tree4 = insertBST 4 tree3

----------- Zadanie 7 --------------

data Tree23 a = Node2 (Tree23 a) a (Tree23 a)
    | Node3 (Tree23 a) a (Tree23 a) a (Tree23 a)
    | Empty23
    deriving Show

search23 :: Ord a => a -> Tree23 a -> Maybe a
search23 _ Empty23 = Nothing
search23 x (Node2 left y right)
    | x == y = Just x
    | x < y = search23 x left
    | otherwise = search23 x right
search23 x (Node3 left a mid b right)
    | x == a || x == b = Just x
    | x < a = search23 x left
    | x < b = search23 x mid
    | otherwise = search23 x right

----------- Zadanie 8 --------------

data InsResult a = BalancedIns (Tree23 a) | Grown (Tree23 a) a (Tree23 a)

insert23 :: Ord a => a -> Tree23 a -> Tree23 a
insert23 x tree = 
    case result of
        BalancedIns tree -> tree
        Grown left x right -> Node2 left x right
    where
        result = ins x tree
        ins :: Ord a => a -> Tree23 a -> InsResult a
        ins x Empty23 = Grown Empty23 x Empty23
        ins x tree@(Node2 left y right)
            | x == y = BalancedIns tree
            | x < y = let insLeft = ins x left in
                case insLeft of
                    BalancedIns res -> BalancedIns (Node2 res y right)
                    Grown u a v -> BalancedIns (Node3 u a v y right)
            | otherwise = let insRight = ins x right in
                case insRight of
                    BalancedIns res -> BalancedIns (Node2 left y res)
                    Grown v b w -> BalancedIns (Node3 left y v b w)
        ins x tree@(Node3 left a mid b right)
            | x == a || x == b = BalancedIns tree
            | x < a = let insLeft = ins x left in
                case insLeft of
                    BalancedIns res -> BalancedIns (Node3 res a mid b right)
                    Grown l z r -> Grown (Node2 l z r) a (Node2 mid b right)
            | x < b = let insMid = ins x mid in
                case insMid of
                    BalancedIns res -> BalancedIns (Node3 left a res b right)
                    Grown l z r -> Grown (Node2 left a l) z (Node2 r b right)
            | otherwise = let insRight = ins x right in
                case insRight of
                    BalancedIns res -> BalancedIns (Node3 left a mid b res)
                    Grown l z r -> Grown (Node2 left a mid) b (Node2 l z r)
