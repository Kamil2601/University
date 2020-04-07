-- Kamil Michalak      --
-- Kurs języka Haskell --
-- Lista 3, 27.03.2020 --

{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE IncoherentInstances #-}
{-# LANGUAGE UndecidableInstances #-}

-------- Zadanie 1 -----------

data BTree t a = Node (t a) a (t a) | Leaf

data UTree a = UNode (UTree a) a (UTree a) | ULeaf

class BT t where
    toTree :: t a -> BTree t a

treeSize :: BT t => t a -> Int
treeSize (toTree -> Leaf) = 0
treeSize (toTree -> Node left _ right) = 1 + (treeSize left) + (treeSize right)

treeLabels :: BT t => t a -> [a]
treeLabels (toTree -> Leaf) = []
treeLabels (toTree -> Node left v right) = treeLabels left ++ [v] ++ treeLabels right

treeFold :: BT t => (b -> a -> b -> b) -> b -> t a -> b
treeFold f acc (toTree -> Leaf) = acc
treeFold f acc (toTree -> Node left v right) = f (treeFold f acc left) v (treeFold f acc right)


instance BT UTree where
    toTree ULeaf = Leaf
    toTree (UNode l x r) = Node l x r

newtype Unbalanced a = Unbalanced { fromUnbalanced :: BTree Unbalanced a }

instance BT Unbalanced where
    toTree = fromUnbalanced

tree :: UTree Int
tree = UNode (UNode (UNode ULeaf 2 ULeaf) 5 (UNode ULeaf 2 (UNode (UNode (UNode (UNode ULeaf 1 ULeaf) 1 ULeaf) 1 ULeaf) 10 (UNode ULeaf 123 ULeaf))))
             8 (UNode (UNode (UNode (UNode ULeaf 3 ULeaf) 1 (UNode ULeaf 3 (UNode ULeaf 3 ULeaf))) 2 ULeaf) 10 ULeaf)

-------- Zadanie 2 -----------

searchBT :: (Ord a, BT t) => a -> t a -> Maybe a
searchBT key (toTree -> Leaf) = Nothing
searchBT key (toTree -> Node left v right)
    | key == v = Just v
    | key < v = searchBT key left
    | otherwise = searchBT key right

toUTree :: BT t => t a -> UTree a
toUTree (toTree -> Leaf) = ULeaf
toUTree (toTree -> Node left v right) = UNode (toUTree left) v (toUTree right)

toUnbalanced :: BT t => t a -> Unbalanced a
toUnbalanced (toTree -> Leaf) = Unbalanced Leaf
toUnbalanced (toTree -> Node left v right) = Unbalanced $ 
    Node (toUnbalanced left) v (toUnbalanced right)

-------- Zadanie 3 -----------

instance (BT t, Show a) => Show (t a) where
    show (toTree -> Leaf) = "-"
    show (toTree -> Node left v right) = show' left ++ " " ++ show v ++ " " ++ show' right where
        show' leaf@(toTree -> Leaf) = show leaf
        show' tree = "(" ++ show tree ++ ")"

-------- Zadanie 4 -----------
data SubTree = Root | SubLeft | SubRight

treeBoxDrawing :: (BT t, Show a) => t a -> String
treeBoxDrawing tree = draw tree "" Root where
    draw (toTree -> Leaf) _ _ = ""
    draw (toTree -> Node left v right) prefix Root = 
        (draw right (prefix ++ " ") SubRight) ++ "\n" ++ prefix ++ "-" ++ show v ++ (draw left (prefix ++ " ") SubLeft)
    draw (toTree -> Node left v right) prefix SubLeft = 
        (draw right (prefix ++ "│") SubRight) ++ "\n" ++ prefix ++ "└" ++ show v ++ (draw left (prefix ++ " ") SubLeft)
    draw (toTree -> Node left v right) prefix SubRight = 
        (draw right (prefix ++ " ") SubRight) ++ "\n" ++ prefix ++ "┌" ++ show v ++ (draw left (prefix ++ "│") SubLeft)

----------------------------------

class BT t => BST t where
    node :: t a -> a -> t a -> t a
    leaf :: t a

instance BST UTree where
    node = UNode
    leaf = ULeaf

instance BST Unbalanced where
    node l x r = Unbalanced $ Node l x r
    leaf = Unbalanced Leaf

class Set s where
    empty :: s a
    search :: Ord a => a -> s a -> Maybe a
    insert :: Ord a => a -> s a -> s a
    delMax :: Ord a => s a -> Maybe (a, s a)
    delete :: Ord a => a -> s a -> s a


---------- Zadanie 6 -----------

instance BST s => Set s where
    empty = leaf

    search = searchBT

    insert key (toTree -> Leaf) = leaf
    insert key tree@(toTree -> Node left v right)
        | key == v = tree
        | key < v = node (insert key left) v right
        | otherwise = node left v (insert key right)

    delMax (toTree -> Leaf) = Nothing
    delMax (toTree -> Node left v (toTree -> Leaf)) = Just (v, left)
    delMax (toTree -> Node left v right) = 
        case delMax right of
            Just (m, r) -> Just (m, node left v r)

    delete _ (toTree -> Leaf) = leaf
    delete key (toTree -> Node left v right)
        | key < v = node (delete key left) v right
        | key > v = node left v (delete key left)
        | otherwise = case delMax left of
            Just (m, l) -> node l m right
            Nothing -> node left v right

-------------------------------------

data WBTree a
    = WBNode (WBTree a) a Int (WBTree a)
    | WBLeaf

wbsize :: WBTree a -> Int
wbsize (WBNode _ _ n _) = n
wbsize WBLeaf = 0

---------- Zadanie 7 -----------

instance BT WBTree where
    toTree WBLeaf = Leaf
    toTree (WBNode l v _ r) = Node l v r

wbNode' :: WBTree a -> a -> WBTree a -> WBTree a
wbNode' l v r = WBNode l v (wbsize l + wbsize r + 1) r

wbRotateLeft :: WBTree a -> a -> WBTree a -> WBTree a
wbRotateLeft left val right@(WBNode rleft _ _ rright)
    | wbsize rleft < wbsize rright = singleLeft left val right
    | otherwise = doubleLeft left val right
  where
    singleLeft x a (WBNode y b _ z) = wbNode' (wbNode' x a y) b z
    doubleLeft x a (WBNode (WBNode y1 b _ y2) c _ z) =
        wbNode' (wbNode' x a y1) b (wbNode' y2 c z)

wbRotateRight :: WBTree a -> a -> WBTree a -> WBTree a
wbRotateRight left@(WBNode lleft _ _ lright) val right
    | wbsize lright < wbsize lleft = singleRight left val right
    | otherwise = doubleRight left val right
  where
    singleRight (WBNode x a _ y) b z = wbNode' x a (wbNode' y b z)
    doubleRight (WBNode x a _ (WBNode y1 b _ y2)) c z =
        wbNode' (wbNode' x a y1) b (wbNode' y2 c z)

instance BST WBTree where
    leaf = WBLeaf
    node l a r
        | lSize + rSize < 2 = wbNode' l a r
        | rSize > ratio * lSize = wbRotateLeft l a r
        | lSize > ratio * rSize = wbRotateRight l a r
        | otherwise = wbNode' l a r
      where
        ratio = 5
        lSize = wbsize l
        rSize = wbsize r

---------- Zadanie 8 -----------

data HBTree a = HBNode (HBTree a) a Int (HBTree a) | HBLeaf

instance BT HBTree where
    toTree HBLeaf = Leaf
    toTree (HBNode l v _ r) = Node l v r

hbheight :: HBTree a -> Int 
hbheight HBLeaf = 0
hbheight (HBNode _ _ h _) = h

-- instance BST HBTree where
--     leaf = HBLeaf
