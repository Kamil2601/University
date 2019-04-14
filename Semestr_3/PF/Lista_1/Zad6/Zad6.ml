let zero: ('a -> 'a) -> 'a -> 'a = fun f -> fun x -> x;;
let succ n = fun f x -> f (n f x);;
let add k l = l (succ k);;
let ctrue = fun x y -> x;;
let cfalse = fun x y -> y;;
let isZero f = if (f ctrue) =  then ctrue else cfalse;;
let bool_of_cbool = fun cb -> (cb true false);;
let rec cnum_of_int n = if n = 0 then zero else succ(cnum_of_int (n-1));;
let rec find_n n f g = if f==g then n else find_n (n+1) (succ f) g;;
let int_of_cnum f = (find_n 0 zero f);;


open Printf;;
printf("%b\n") (bool_of_cbool (isZero zero));;
printf("%b\n") (bool_of_cbool (isZero (succ zero)));;