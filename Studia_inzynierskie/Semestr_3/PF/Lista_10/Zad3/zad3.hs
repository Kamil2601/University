
eol :: (String -> a) -> String -> a
eol cont s = (cont (s ++ "\n"))

int :: (String -> a) -> String -> (Integer -> a)
int cont s = \n -> (cont (s ++ (show n)))

flt :: (String -> a) -> String -> (Float -> a)
flt cont s = \n -> (cont (s ++ (show n)))

str :: (String -> a) -> String -> (String -> a)
str cont s1 = \s2 -> (cont (s1 ++ s2))

lit :: String -> (String -> a) -> (String -> a)
lit s cont s' = cont (s' ++ s)


(^^^) :: (b -> c) -> (a -> b) -> (a -> c)
(^^^) f g = \x -> f (g x)

--sprintf :: (a -> b) -> String

--sprintf (lit s) = s