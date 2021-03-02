g :: [a] -> [a] -> [b] -> [b] -> Bool -> [(a,b)]
g [] _ _ _ _ = []
g _ _ [] _ _ = []
g (x:xs) [] (y:ys) [] True = error "Error"
g (x:xs) [] (y:ys) [] False = (x,y) : (g (x:xs) [] ys [y] True) 
g [x] xpref (y:ys) ypref True = (x,y) : (g [x] xpref ys (y:ypref) False) 
g (x:xs) xpref (y:ys) (y2:ypref) True = (x,y) : (g xs (x:xpref) (y2:y:ys) (ypref) True) 
g (x:xs) xpref (y:ys) [] True = (x,y) : (g xs (x:xpref) (y:ys) [] False) 
g (x:xs) xpref [y] ypref False = (x,y) : (g xs (x:xpref) [y] ypref True) 
g (x:xs) (x2:xpref) (y:ys) (ypref) False = (x,y) : (g (x2:x:xs) xpref ys (y:ypref) False)
g (x:xs) [] (y:ys) ypref False = (x,y) : (g (x:xs) [] ys (y:ypref) True)


connect :: [a] -> [b] -> [(a,b)]
connect [] _ = []
connect _ [] = []
connect (x:xs) (y:ys) = (x,y) : (connect xs ys)

h :: [a] -> [b] -> [b] -> [(a,b)]
h [] _ _ = []
h (x:xs) [] ypref = (connect (x:xs) ypref) ++ (h xs [] ypref)
h (xs) (y:ys) ypref = (connect xs ypref) ++ (h xs ys (y:ypref))

(><) :: [a] -> [b] -> [(a,b)]
(><) xs (y:ys) = h xs ys [y] 