-- Kamil Michalak      --
-- Kurs języka Haskell --
-- Lista 4, 03.04.2020 --

{-# LANGUAGE ViewPatterns #-}

---------- Zadanie 1 -----------

data BTree a = BNode (BTree a) a (BTree a) | BLeaf deriving Show

-- flatten_aux a (Node l v r) = flatten (Node l v r) ++ a = flatten l ++ [v] ++ flatten r ++ a =
-- = flatten l ++ [v] ++ flatten_aux a r = flatten l ++ (v:(flatten_aux a r)) = 
-- = flatten_aux (v:(flatten_aux a r)) l


flatten :: BTree a -> [a]
flatten = flatten_aux [] where 
    flatten_aux::[a] -> BTree a -> [a]
    flatten_aux a BLeaf = a
    flatten_aux a (BNode left v right) = flatten_aux (v:(flatten_aux a right)) left

-- qsort_aux a xs = qsort xs ++ a
-- qsort_aux a (x:xs) = qsort (x:xs) ++ a = 
-- = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [y | y <- xs, y >= x] ++ a =
-- = qsort [y | y <- xs, y < x] ++ [x] ++ (qsort_aux a [y | y <- xs, y >= x]) =
-- = qsort [y | y <- xs, y < x] ++ (x:(qsort_aux a [y | y <- xs, y >= x])) = 
-- = qsort_aux (x:(qsort_aux a [y | y <- xs, y >= x])) [y | y <- xs, y < x]

qsort :: Ord a => [a] -> [a]
qsort = qsort_aux [] where
    qsort_aux :: Ord a => [a] -> [a] -> [a]
    qsort_aux a [] = a
    qsort_aux a (x:xs) = qsort_aux (x:(qsort_aux a greater)) lesser where
        greater = [y | y <- xs, y >= x]
        lesser = [y | y <- xs, y < x]

---------- Zadanie 2 -----------

queens::Int->[[Int]]
queens n = queens' [] 1 1 where
    canPut::[Int] -> Int -> Int -> Bool
    canPut placed col row = aux placed col row 1 where
            aux [] _ _ _ = True
            aux (x:xs) col row i
                | row == x || (x+i) == (col+row) || (x-i) == (row-col) = False
                | otherwise = aux xs col row (i+1)
    queens'::[Int]->Int->Int->[[Int]]
    queens' placed col row
        | col > n = []
        | row > n = []
        | col == n =
            case canPut placed col row of
                True -> (placed ++ [row]):nextRow
                False -> nextRow
        | otherwise =
            case canPut placed col row of
                True -> nextRow ++ nextCol
                False -> nextRow
        where
            nextCol = (queens' (placed ++ [row]) (col + 1) 1)
            nextRow = (queens' placed col (row + 1))

---------- Zadanie 3 -----------

data BinTree = BinTree :/\: BinTree | BinTreeLeaf deriving Show

binTree :: Int -> BinTree
binTree 0 = BinTreeLeaf
binTree n 
    | odd n = let t = binTree (n `div` 2) in t :/\: t
    | otherwise = uncurry (:/\:) $ create2 n
    where
        create2 0 = (BinTreeLeaf, BinTreeLeaf :/\: BinTreeLeaf)
        create2 n
            | even n    = (t1 :/\: t2, t2 :/\: t2)
            | otherwise = (t1 :/\: t1, t1 :/\: t2)
            where
                (t1, t2) = create2 $ (n - 1) `div` 2


---------- Zadanie 4 -----------

binTreeLeaves :: Int -> BinTree
binTreeLeaves n
    | n <= 0 = error "Wrong number of leaves!"
    | otherwise = aux (n-1) BinTreeLeaf BinTreeLeaf
    where
        aux 0 acc _ = acc
        aux n acc subTree
            | even n = aux (n `div` 2) acc (subTree :/\: subTree)
            | otherwise = aux (n `div` 2) (subTree :/\: acc) (subTree :/\: subTree)


---------- Zadanie 5 -----------

class Queue q where
    emptyQ :: q a
    isEmptyQ :: q a -> Bool
    put :: a -> q a -> q a
    get :: q a -> (a, q a)
    get q = (top q, pop q)
    top :: q a -> a
    top = fst . get
    pop :: q a -> q a
    pop = snd . get

data SimpleQueue a = SimpleQueue { front :: [a], rear :: [a] } deriving Show

instance Queue SimpleQueue where
    emptyQ = SimpleQueue { front=[], rear=[]}
    isEmptyQ queue = case (front queue, rear queue) of
        ([],[]) -> True
        _ -> False

    put x (SimpleQueue {front=[], rear=[]}) = SimpleQueue {front=[x],rear=[]}
    put x (SimpleQueue {front=xs, rear=ys}) = SimpleQueue {front=xs, rear=(x:ys)}

    get (SimpleQueue {front=[], rear=[]}) = error "Empty queue!"
    get (SimpleQueue {front=[x], rear=ys}) = (x, SimpleQueue {front=(reverse ys), rear=[]})
    get (SimpleQueue {front=(x:xs), rear=ys}) = (x, SimpleQueue {front=xs, rear=ys})


---------- Zadanie 6 -----------

primes :: [Integer]
primes = 2:[ p | p <- [3..], and [ p `mod` q /= 0 | q <- takeWhile (\q -> q * q <= p) primes]]

---------- Zadanie 7 -----------

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)


---------- Zadanie 8 -----------

(<+>) :: Ord a => [a] -> [a] -> [a]
xs <+> [] = xs
[] <+> ys = ys
xs'@(x:xs) <+> ys'@(y:ys)
    | x == y = x:(xs <+> ys)
    | x < y = x:(xs <+> ys')
    | otherwise = y:(xs' <+> ys)

d235 :: [Integer]
d235 = 1:map (*2) d235 <+> map (*3) d235 <+> map (*5) d235

---------- Zadanie 9 -----------

naturalTree :: BTree Int
naturalTree = naturalTreeFrom 1 where
    naturalTreeFrom n = BNode (naturalTreeFrom (2*n)) n (naturalTreeFrom (2*n+1))


takeDepth :: Int -> BTree a -> BTree a
takeDepth 0 _ = BLeaf
takeDepth n BLeaf = BLeaf
takeDepth n (BNode l v r) = BNode (takeDepth (n-1) l) v (takeDepth (n-1) r)

---------- Zadanie 10 -----------

infiniteBTree :: BTree Int
infiniteBTree = BNode infiniteBTree 1 infiniteBTree

data RoseTree a = RNode a [RoseTree a]

infiniteRoseTree :: RoseTree Int
infiniteRoseTree = RNode 1 (cycle [infiniteRoseTree])

---------- Zadanie 11 -----------

showFragList :: Show a => Int -> [a] -> String
showFragList n xs = "[" ++ aux n xs where
        aux _ [] = "]"
        aux 0 _ = "…]"
        aux _ [x] = show(x) ++ "]"
        aux n (x:xs) = show(x) ++ "," ++ aux (n-1) xs

data BTree' t a = Node (t a) a (t a) | Leaf deriving Show

class BT t where
    toTree :: t a -> BTree' t a

showFragTree :: (BT t, Show a) => Int -> t a -> String
showFragTree _ (toTree -> Leaf) = "Leaf"
showFragTree 0 _ = "…"
showFragTree n (toTree -> tree) = case tree of
    Node left v right ->
        "Node " ++ showLeft ++ show v ++ showRight where
            showLeft = showSubTree left
            showRight = showSubTree right
            where 
                showSubTree t@(toTree -> Leaf) = "Leaf"
                showSubTree t@(toTree -> _) = "(" ++ showFragTree (n-1) t ++ ")"

showFragRose :: Show a => Int -> RoseTree a -> String
showFragRose 0 _ = "…"
showFragRose n (RNode v xss) = "RNode " ++ showFragList n (map (showFragRose (n-1)) xss)


---------- Zadanie 12 -----------

data Cyclist a = Elem (Cyclist a) a (Cyclist a)

fromList :: [a] -> Cyclist a
fromList [] = error "must have at least one element"
fromList xs = first where 
    (first,last) = aux last xs first
    aux :: Cyclist a -> [a] -> Cyclist a -> (Cyclist a, Cyclist a)
    aux prev []     next = (next,prev)
    aux prev (x:xs) next = (this, last)
        where
            this = Elem prev x rest 
            (rest,last) = aux this xs next

forward :: Cyclist a -> Cyclist a
forward (Elem _ _ next) = next

backward :: Cyclist a -> Cyclist a
backward (Elem prev _ _) = prev

label :: Cyclist a -> a
label (Elem _ a _) = a

enumInts :: Cyclist Integer
enumInts = Elem (prevFrom enumInts (-1)) 0 (nextFrom enumInts 1)
  where
    prevFrom next n = this
      where
        this = Elem prev n next
        prev = prevFrom this $ n - 1
    nextFrom prev n = this
      where
        this = Elem prev n next
        next = nextFrom this $ n + 1
