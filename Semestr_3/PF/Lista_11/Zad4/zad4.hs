
remove :: Integer -> Integer -> [Integer] -> [Integer]
remove 1 n (x:xs)
    | n<=x && n>0 = (x-n):xs
    | otherwise = error "niepoprawna liczba gwiazdek do usunięcie"
remove row n (x:xs) = x:(remove (row-1) n xs)
remove _ _ _ = error "niepoprawny numer wiersza"

end :: [Integer] -> Bool
end [] = True
end (x:xs)
    |x == 0 = end xs
    |otherwise = False

start = [5,4,3,2,1]

listTOStr :: [Integer] -> String
listTOStr xs = "[" ++ (aux xs)
    where
        aux :: [Integer] -> String
        aux [] = "]\n"
        aux [x] = (show x) ++ "]\n"
        aux (x:xs) = (show x) ++ ", " ++ (aux xs)

board :: [Integer] -> String
board xs = aux 1 xs ++ "\n"
    where
        aux :: Integer -> [Integer] -> String
        aux _ [] = ""
        aux n (x:xs) = (show n) ++ ": " ++ (row x) ++ (aux (n+1) xs)
                where
                    row :: Integer -> String
                    row 0 = "\n"
                    row n = "* " ++ row (n-1)

rm_row :: [Integer] -> [Integer]
rm_row [] = []
rm_row (0:xs) = 0:(rm_row xs)
rm_row (n:xs) = 0:xs

start_game :: IO Bool
start_game = player_move start

player_move :: [Integer] -> IO Bool
player_move xs =
    do  putStr (board xs)
        putStr "wiersz: "
        row <- getLine
        putStr "usuniętych gwiazdek: "
        n <- getLine
        putStr "\n"
        let ys = remove (read row) (read n) xs in
            do  putStr (board ys)
                if (end ys) then return True else computer_move ys


computer_move :: [Integer] -> IO Bool
computer_move xs = 
    do let ys = rm_row xs in
        if (end ys) then return False else player_move ys

