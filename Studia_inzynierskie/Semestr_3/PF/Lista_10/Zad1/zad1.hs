data BTree a = Leaf | Node (BTree a) a (BTree a)
                deriving(Show)

aux :: Integer -> BTree a -> (Integer,BTree Integer)
aux n Leaf = (n, Leaf)
aux n (Node left _ right) = 
    let (n1,new_left) = aux (n+1) left in 
        let (n2,new_right) = aux n1 right in (n2,(Node new_left n new_right))

dfnum :: BTree a -> BTree Integer

dfnum tree = let (_,new_tree) = aux 0 tree in new_tree

t = Node (Node (Node Leaf "d" (Node Leaf "e" Leaf)) "a" Leaf) "b" (Node Leaf "c" Leaf)



zeros :: BTree a -> BTree Integer
zeros Leaf = Leaf
zeros (Node left _ right) = Node (zeros left) 0 (zeros right)


change :: BTree Integer -> [Bool] -> Integer -> (BTree Integer,[[Bool]])
change tree road i = go tree road i road 
        where
            go :: BTree Integer -> [Bool] -> Integer -> [Bool] -> (BTree Integer,[[Bool]])
            go Leaf _ _ _ = (Leaf,[])
            go (Node left _ right) [] i road = ((Node left i right),(create left right road))
                    where
                        create :: BTree a -> BTree a -> [Bool] -> [[Bool]]
                        create Leaf Leaf _ = []
                        create (Node _ _ _) Leaf road = [road ++ [False]]
                        create Leaf (Node _ _ _)  road = [road ++ [True]]
                        create (Node _ _ _) (Node _ _ _) road = [road ++ [False], road ++ [True]]
            go (Node left val right) (x:xs) i road 
                    | (x == False) = let (new_left,res) = (go left xs i road) in (Node new_left val right, res)
                    | otherwise = let (new_right,res) = (go right xs i road) in (Node left val new_right, res)
                       


enum :: BTree Integer -> [[Bool]] -> Integer -> (BTree Integer, [[Bool]], Integer)

enum tree [] i = (tree, [], i)
enum tree (x:xs) i = let (new_tree,res) = (change tree x i) in enum new_tree (xs ++ res) (i+1)

bfnum :: BTree a -> BTree Integer

bfnum tree = let (new_tree, _, _) = enum (zeros tree) [[]] 1 in new_tree