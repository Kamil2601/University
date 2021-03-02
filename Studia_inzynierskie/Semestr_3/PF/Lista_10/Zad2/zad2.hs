data BTree a = Leaf | Node (BTree a) a (BTree a)
                deriving(Show)

data Array a = Arr Integer (BTree a)
                deriving(Show)


aempty :: Array a
aempty = Arr 0 Leaf

asub :: Array a -> Integer -> a
asub (Arr n tree) i
    | i > n = error "To large index"
    | i == 0 = error "Index 0 given"
    | otherwise = find i tree
        where
            find :: Integer -> BTree a -> a
            find 1 (Node _ val _) = val
            find i (Node left _ right)
                | (mod i 2 == 0) = find (quot i 2) left
                | otherwise = find (quot i 2) right

a = Arr 4 (Node (Node (Node Leaf "d" Leaf) "b" Leaf) "a" (Node Leaf "c" Leaf))

aupdate :: Array a -> Integer -> a -> Array a

aupdate (Arr n tree) i val
    | i > n = error "To large index"
    | i == 0 = error "Index 0 given"
    | otherwise = Arr n (change tree i val)
            where
                change :: BTree a -> Integer -> a -> BTree a
                change (Node left _ right) 1 v = Node left v right
                change (Node left val right) i v
                    | (mod i 2 == 0) = Node (change left (quot i 2) v) val right
                    | otherwise = Node left val (change right (quot i 2) v)


ahiext :: Array a -> a -> Array a

ahiext (Arr n tree) val = Arr (n+1) (add tree (n+1) val)
                where
                    add :: BTree a -> Integer -> a -> BTree a
                    add Leaf _ v = Node Leaf v Leaf
                    add (Node left val right) i v 
                        | (mod i 2 == 0) = Node (add left (quot i 2) v) val right
                        | otherwise = Node left val (add right (quot i 2) v)
        

ahirem (Arr n tree) = Arr (n-1) (delete tree n)
                where
                    delete :: BTree a -> Integer -> BTree a
                    delete _ 1 = Leaf
                    delete (Node left val right) i
                        | (mod i 2 == 0) = Node (delete left (quot i 2)) val right
                        | otherwise = Node left val (delete right (quot i 2))