-- Kamil Michalak      --
-- Kurs języka Haskell --
-- Lista 7, 24.04.2020 --


import Control.Applicative
import Test.QuickCheck

---------- Zadanie 1 -------------

data Tree = Leaf | Single Tree | Double Tree Tree deriving Show

data Spec = MinNodes Int -- co najmniej n konstruktorow
    | MaxNodes Int -- co najwyzej n konstruktorow
    | MinDepth Int -- glebokosc co najmniej n
    | MaxDepth Int -- glebokosc co najwyzej n
    | MinPaths Int -- co najmniej n sciezek
    | MaxPaths Int -- co najwyzej n sciezek

-- (drzewo, wysokość, liczba węzłów, liczba ścieżek od korzenia, liczba pozostałych ścieżek)
type TreeInfo = (Tree, Int, Int, Int, Int)

joinTrees :: TreeInfo -> TreeInfo -> TreeInfo
joinTrees (left, leftHeight, leftNodes, leftRootPaths, leftRestPaths)
    (right, rightHeight, rightNodes, rightRootPaths, rightRestPaths) = 
    (Double left right,
    max leftHeight rightHeight + 1,
    leftNodes + rightNodes + 1,
    leftRootPaths + rightRootPaths + 1,
    leftRootPaths * rightRootPaths + leftRootPaths + leftRestPaths +
    rightRootPaths + rightRestPaths)

higherTree :: TreeInfo -> TreeInfo
higherTree (tree, height, nodes, rootPaths, restPaths) =
    (Single tree, height + 1, nodes + 1, rootPaths + 1, rootPaths + restPaths)

tree :: TreeInfo -> Tree
tree (t, _, _, _, _) = t

height :: TreeInfo -> Int
height (_, h, _, _, _) = h

paths :: TreeInfo -> Int
paths (_, _, _, rootPaths, restPaths) = rootPaths + restPaths

nodes :: TreeInfo -> Int
nodes (_,_,  n, _, _) = n

leafInfo :: TreeInfo
leafInfo = (Leaf, 0, 1, 1, 0)

type Conditions = (Int, Int, Int, Int, Int, Int)

findConditions :: [Spec] -> Conditions
findConditions xs = foldl f (-1,-1,-1,-1,-1,-1) xs where
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MinNodes n) = 
        (max minNodes n, maxNodes, minDepth, maxDepth, minPaths, maxPaths)
    f (minNodes, -1, minDepth, maxDepth, minPaths, maxPaths) (MaxNodes n) = 
        (minNodes, n, minDepth, maxDepth, minPaths, maxPaths)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MaxNodes n) = 
        (minNodes, min maxNodes n, minDepth, maxDepth, minPaths, maxPaths)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MinDepth n) = 
        (minNodes, maxNodes, max minDepth n, maxDepth, minPaths, maxPaths)
    f (minNodes, maxNodes, minDepth, -1, minPaths, maxPaths) (MaxDepth n) = 
        (minNodes, maxNodes, minDepth, n, minPaths, maxPaths)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MaxDepth n) = 
        (minNodes, maxNodes, minDepth, min maxDepth n, minPaths, maxPaths)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MinPaths n) = 
        (minNodes, maxNodes, minDepth, maxDepth, max minPaths n, maxPaths)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, -1) (MaxPaths n) = 
        (minNodes, maxNodes, minDepth, maxDepth, minPaths, n)
    f (minNodes, maxNodes, minDepth, maxDepth, minPaths, maxPaths) (MaxPaths n) = 
        (minNodes, maxNodes, minDepth, maxDepth, minPaths, min maxPaths n)
    


type TreePred = TreeInfo -> Bool

checkTreeInfo :: TreePred -> TreePred -> TreePred -> TreeInfo -> Bool
checkTreeInfo heightPred nodesPred pathPred tree = 
    heightPred tree && nodesPred tree && pathPred tree

auxGen :: [TreeInfo] -> [TreeInfo] -> TreePred -> TreePred -> TreePred -> [TreeInfo]
auxGen [] restTrees _ _ _ = []
auxGen highestTrees restTrees heightPred nodesPred pathPred
    = newHeighest ++ (auxGen newHeighest newRest heightPred nodesPred pathPred) where
        single = map higherTree highestTrees
        left = joinTrees <$> highestTrees <*> restTrees
        right = joinTrees <$> restTrees <*> highestTrees
        full = joinTrees <$> highestTrees <*> highestTrees
        newHeighest = filter (checkTreeInfo heightPred nodesPred pathPred)
            (single ++ left ++ right ++ full)
        newRest = restTrees ++ highestTrees


genTree :: [Spec] -> [Tree]
genTree condList = Leaf : (map tree $ aux $ findConditions condList) where
    aux (minN, maxN, minH, maxH, minP, maxP) = 
        filter (checkTreeInfo minHP minNP minPP) $ auxGen [leafInfo] [] maxHP maxNP maxPP
        where
            minHP = (\t -> height t >= minH)
            maxHP = case maxH of
                -1 -> const True
                _ -> (\t -> height t <= maxH)
            minNP = (\t -> nodes t >= minN)
            maxNP = case maxN of
                -1 -> const True
                _ -> (\t -> height t <= maxN)
            minPP = (\t -> height t >= minP)
            maxPP = case maxP of
                -1 -> const True
                _ -> (\t -> height t <= maxP)


---------- Zadanie 3 -------------

data Queue a = Queue { front :: [a], rear :: [a] }
    deriving Show
empty :: Queue a
empty = Queue [] []

pushBack :: a -> Queue a -> Queue a
pushBack x (Queue [] []) = Queue [x] []
pushBack x (Queue xs ys) = Queue xs (x:ys)

popFront :: Queue a -> Queue a
popFront q@(Queue [] []) = q
popFront (Queue [x] xs) = Queue (reverse xs) []
popFront (Queue (x:xs) (ys)) = Queue xs ys

peek :: Queue a -> a
peek (Queue [] []) = error "Empty queue"
peek (Queue (x:xs) _) = x

isEmpty :: Queue a -> Bool
isEmpty (Queue [] []) = True
isEmpty _ = False

data SlowQueue a = SlowQueue [a]
slowEmpty :: SlowQueue a
slowEmpty = SlowQueue []

slowPush :: a -> SlowQueue a -> SlowQueue a
slowPush x (SlowQueue xs) = (SlowQueue (xs ++ [x]))

slowPop :: SlowQueue a -> SlowQueue a
slowPop (SlowQueue []) = error "Empty slow queue"
slowPop (SlowQueue (x:xs)) = SlowQueue xs

slowPeek :: SlowQueue a -> a
slowPeek (SlowQueue []) = error "Empty slow queue"
slowPeek (SlowQueue (x:xs)) = x

invariant :: Queue Int -> Bool
invariant (Queue xs ys) = (length xs > 0) || (length ys == 0)

instance Arbitrary a => Arbitrary (Queue a) where
    arbitrary = sized arbitrarySizedQueue

arbitrarySizedQueue :: Arbitrary a => Int -> Gen (Queue a)
arbitrarySizedQueue n = aux n (Queue [] []) where
    aux :: Arbitrary a => Int -> Queue a -> Gen (Queue a)
    aux 0 q = return q
    aux m q = do
        op <- (choose (1 :: Int, 2 :: Int))
        case op of
            1 -> aux (m-1) (popFront q)
            _ -> do
                val <- arbitrary
                aux (m-1) (pushBack val q)

-- Sprawdzenie niezmiennika
-- quickCheck invariant
-- Wynik: OK