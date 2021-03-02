data Color = Red | Black
            deriving(Show)
data RBTree a = RBNode Color (RBTree a) a (RBTree a) | RBLeaf
                deriving(Show)

left_rotate :: RBTree a -> RBTree a
left_rotate (RBNode cx a x (RBNode cy b y c)) = RBNode cy (RBNode cx a x b) y c

right_rotate :: RBTree a -> RBTree a
right_rotate (RBNode cy (RBNode cx a x b) y c) = RBNode cx a x (RBNode cy b y c)

insert :: Ord a => a -> RBTree a -> RBTree a
insert x RBLeaf = RBNode Red RBLeaf x RBLeaf
insert x (RBNode c left a right)
    | x < a = (RBNode c (insert x left) a right)
    | x > a = (RBNode c left a (insert x right))
    | otherwise = (RBNode c left a right)

t = RBNode Black RBLeaf 10 RBLeaf

