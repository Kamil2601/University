let id_stream n = n;;
let hd s = s(0);;
let tail s = fun n -> s(n+1);;
print_int (hd (tail (tail id_stream)));;
print_string "\n"
let add s a = fun n -> s(n) + a;;
print_int (hd (add (tail (tail id_stream)) 10));;
print_string "\n"
let replace n a s = fun k -> if k mod n = 0 then a else s(k);;
print_int (hd (tail (tail (replace 3 2137 id_stream))));;
print_string "\n"
let take n s = fun k -> s(k*n);;
print_int (hd (take 10 id_stream));;
print_string "\n";;

let map f s = fun n -> f(s(n));;
let map2 f s1 s2 = fun n -> (f (s1(n)) (s2(n)));;

let rec tabulate ?(b=0) e s=
  if b > e
    then []
    else [(s b)] @ (tabulate ~b:(b + 1) e s);;


open Printf;;
List.iter (printf "%d ") (tabulate 5 id_stream);;
print_string "\n";;

printf ("Test map\n");;
List.iter (printf "%d ") (tabulate 5 (map (fun x -> x+1) id_stream));;
printf ("\n");;

printf ("Test map2\n");;
List.iter (printf "%d ") (tabulate 5 (map2 (+) id_stream id_stream));;
printf ("\n")

let rec scan f a s = fun k -> if k = 0 then (f a (s 0)) else (f ((scan f a s) (k-1)) (s k));;

printf "Test scan\n";;
List.iter (printf "%d ") (tabulate 5 (scan (+) 0 id_stream));;
printf "\n";;