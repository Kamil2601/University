-- Kamil Michalak --

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
            | x < y = case ins x left of
                    BalancedIns res -> BalancedIns (Node2 res y right)
                    Grown u a v -> BalancedIns (Node3 u a v y right)
            | otherwise = case ins x right of
                    BalancedIns res -> BalancedIns (Node2 left y res)
                    Grown v b w -> BalancedIns (Node3 left y v b w)
        ins x tree@(Node3 left a mid b right)
            | x == a || x == b = BalancedIns tree
            | x < a = case ins x left of
                    BalancedIns res -> BalancedIns (Node3 res a mid b right)
                    Grown l z r -> Grown (Node2 l z r) a (Node2 mid b right)
            | x < b = case ins x mid of
                    BalancedIns res -> BalancedIns (Node3 left a res b right)
                    Grown l z r -> Grown (Node2 left a l) z (Node2 r b right)
            | otherwise = case ins x right of
                    BalancedIns res -> BalancedIns (Node3 left a mid b res)
                    Grown l z r -> Grown (Node2 left a mid) b (Node2 l z r)


----------- Zadanie 9 --------------

data DelResult a = BalancedDel (Tree23 a) | Shrinked (Tree23 a)

delMax :: Tree23 a -> (DelResult a, a)
delMax Empty23 = error "Cannot delete Max from empty tree!"
delMax (Node2 left root Empty23) = (Shrinked left, root)
delMax (Node2 left root right) = let (delRes, val) = delMax right in
    case delRes of
        BalancedDel tree -> (BalancedDel (Node2 left root tree), val)
        Shrinked tree ->
            case left of
                Node2 u a v ->  (Shrinked (Node3 u a v root tree), val)
                Node3 u a v b w -> (BalancedDel (Node2 (Node2 u a v) b (Node2 w root tree)), val)
delMax (Node3 left leftRoot mid rightRoot Empty23) = (BalancedDel (Node2 left leftRoot mid), rightRoot)
delMax (Node3 left leftRoot mid rightRoot right) = let (delRes, val) = delMax right in
    case delRes of
        BalancedDel tree -> (BalancedDel (Node3 left leftRoot mid rightRoot tree), val)
        Shrinked tree -> 
            case mid of
                Node2 v b w ->  (BalancedDel (Node2 left leftRoot (Node3 v b w rightRoot tree)), val)
                Node3 v b w c x -> (BalancedDel (Node3 left leftRoot (Node2 v b w) c (Node2 x rightRoot tree)), val)



deleteMax23 :: Tree23 a -> (Tree23 a, a)
deleteMax23 tree = case delMax tree of
    (BalancedDel res, val) -> (res, val)
    (Shrinked res, val) -> (res, val)


del :: Ord a => a -> Tree23 a -> DelResult a
del _ Empty23 = BalancedDel Empty23
del key tree@(Node2 Empty23 root Empty23)
    | key == root = Shrinked Empty23
    | otherwise = BalancedDel tree
del key (Node2 left root right)
    | key == root = let (delRes, maxKey) = delMax left in
        case delRes of
                BalancedDel delTree -> BalancedDel (Node2 delTree maxKey right)
                Shrinked delTree -> 
                    case right of
                        Node2 v b w -> Shrinked (Node3 delTree maxKey v b w)
                        Node3 v b w c x -> BalancedDel (Node2 (Node2 delTree maxKey v) b (Node2 w c x))
    | key < root = 
        case del key left of
            BalancedDel delTree -> BalancedDel (Node2 delTree root right)
            Shrinked delTree -> 
                case right of
                    Node2 v b w -> Shrinked (Node3 delTree root v b w)
                    Node3 v b w c x -> BalancedDel (Node2 (Node2 delTree root v) b (Node2 w c x))
    | otherwise =
        case del key right of
            BalancedDel delTree -> BalancedDel (Node2 left root delTree)
            Shrinked delTree ->
                case left of
                    Node2 u a v ->  Shrinked (Node3 u a v root delTree)
                    Node3 u a v b w -> BalancedDel (Node2 (Node2 u a v) b (Node2 w root delTree))
del key tree@(Node3 Empty23 leftRoot Empty23 rightRoot Empty23)
    | key == leftRoot = BalancedDel (Node2 Empty23 rightRoot Empty23)
    | key == rightRoot = BalancedDel (Node2 Empty23 leftRoot Empty23)
    | otherwise = BalancedDel tree
del key (Node3 left leftRoot mid rightRoot right)
    | key == leftRoot = let (delRes, maxKey) = delMax left in
        case delRes of
            BalancedDel delTree -> BalancedDel (Node3 delTree maxKey mid rightRoot right)
            Shrinked delTree -> 
                case mid of
                    Node2 v b w -> BalancedDel (Node2 (Node3 delTree maxKey v b w) rightRoot right)
                    Node3 v b w c x -> BalancedDel (Node3 (Node2 delTree maxKey v) b (Node2 w c x) rightRoot right)
    | key == rightRoot = let (delRes, maxKey) = delMax mid in
        case delRes of
            BalancedDel delTree -> BalancedDel (Node3 left leftRoot delTree maxKey right)
            Shrinked delTree ->
                case left of
                    Node2 u a v -> BalancedDel (Node2 (Node3 u a v leftRoot delTree) maxKey right)
                    Node3 u a v b w -> BalancedDel (Node3 (Node2 u a v) b (Node2 w leftRoot delTree) maxKey right)
    | key < leftRoot =
        case del key left of
            BalancedDel delTree -> BalancedDel (Node3 delTree leftRoot mid rightRoot right)
            Shrinked delTree -> 
                case mid of
                    Node2 v b w -> BalancedDel (Node2 (Node3 delTree leftRoot v b w) rightRoot right)
                    Node3 v b w c x -> BalancedDel (Node3 (Node2 delTree leftRoot v) b (Node2 w c x) rightRoot right)
    | key < rightRoot = 
        case del key mid of
            BalancedDel delTree -> BalancedDel (Node3 left leftRoot delTree rightRoot right)
            Shrinked delTree ->
                case left of
                    Node2 u a v -> BalancedDel (Node2 (Node3 u a v leftRoot delTree) rightRoot right)
                    Node3 u a v b w -> BalancedDel (Node3 (Node2 u a v) b (Node2 w leftRoot delTree) rightRoot right)
    | otherwise = 
        case del key right of
        BalancedDel tree -> BalancedDel (Node3 left leftRoot mid rightRoot tree)
        Shrinked tree -> 
            case mid of
                Node2 v b w ->  BalancedDel (Node2 left leftRoot (Node3 v b w rightRoot tree))
                Node3 v b w c x -> BalancedDel (Node3 left leftRoot (Node2 v b w) c (Node2 x rightRoot tree))

delete23 :: Ord a => a -> Tree23 a -> Tree23 a
delete23 key tree = case del key tree of
    BalancedDel res -> res
    Shrinked res -> res


----------- Zadanie 10 --------------

data Tree234 a = N2 (Tree234 a) a (Tree234 a)
    | N3 (Tree234 a) a (Tree234 a) a (Tree234 a)
    | N4 (Tree234 a) a (Tree234 a) a (Tree234 a) a (Tree234 a)
    | E234

data RBTree a = Black (RBTree a) a (RBTree a)
    | Red (RBTree a) a (RBTree a)
    | RBTEmpty

from234 :: Tree234 a -> RBTree a
from234 E234 = RBTEmpty
from234 (N2 left root right) = Black rbLeft root rbRight where
    rbLeft = from234 left
    rbRight = from234 right
from234  (N3 left leftRoot mid rightRoot right) = Black rbLeft leftRoot rbRight where
    rbLeft = from234 left
    rbRight = Red (from234 mid) rightRoot (from234 right)
from234 (N4 left leftRoot leftMid midRoot rightMid rightRoot right) = Black rbLeft midRoot rbRight where
    rbLeft = Red (from234 left) leftRoot (from234 leftMid)
    rbRight = Red (from234 rightMid) rightRoot (from234 right)

to234 :: RBTree a -> Tree234 a
to234 RBTEmpty = E234
to234 (Black
        (Red leftLeft leftRoot rightLeft)
        root
        (Red leftRight rightRoot rightRight)) =
            N4 (to234 leftLeft) leftRoot (to234 rightLeft) root (to234 leftRight) rightRoot (to234 rightRight)
to234 (Black
        (Red leftLeft leftRoot rightLeft)
        root
        right) = 
            N3 (to234 leftLeft) leftRoot (to234 rightLeft) root (to234 right)
to234 (Black
        left
        root
        (Red leftRight rightRoot rightRight)) = 
            N3 (to234 left) root (to234 leftRight) rightRoot (to234 rightRight)
to234 (Black left root right) = N2 (to234 left) root (to234 right)