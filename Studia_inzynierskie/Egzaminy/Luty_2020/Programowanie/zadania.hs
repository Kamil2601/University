
maksymalnyZysk :: [Integer] -> Integer 
maksymalnyZysk [] = error "empty list"
maksymalnyZysk [_] = 0
maksymalnyZysk (x:xs) = max buyHere buyLater where
    buyHere = maximum xs - x
    buyLater = maksymalnyZysk xs

sortujBity :: [Integer] -> [Integer]
sortujBity xs = aux xs [] [] where
    aux [] zeros ones = zeros ++ ones
    aux (0:xs) zeros ones = aux xs (0:zeros) ones
    aux (1:xs) zeros ones = aux xs zeros (1:ones)


(+++) :: [a] -> [a] -> [a]
(+++) [] xs = xs
(+++) (x:xs) ys = x:(+++) xs ys
