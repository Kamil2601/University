
let (fresh,reset) = 
  let counter = ref 0 in
  let fresh s = 
    let res = s ^ (string_of_int !counter) in
      (incr counter); res in
  let reset n = counter := n in
    fresh,reset;


open Printf;;    

printf "%s %s %s %s %s %s\n" (fresh "x") (fresh "x") (fresh "x") (fresh "x") (fresh "x") (fresh "x");;

printf "%s\n" (fresh "y");;

printf "%s\n" (fresh "z");;

(reset 123);;

printf "%s\n" (fresh "a");;
printf "%s\n" (fresh "a");;
printf "%s\n" (fresh "a");;

