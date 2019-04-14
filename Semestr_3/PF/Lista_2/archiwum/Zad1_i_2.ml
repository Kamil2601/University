open Printf;;

let rec append xs ys = 
  match xs with
  [] -> ys
  | x::zs -> x::(append zs ys);;

let rec map f xs = 
  match xs with
  [] -> []
  | x::ys -> (f x)::(map f ys);;

let rec sublists xs = 
  match xs with
  [] -> [[]]
  |x::xs -> let ls = sublists xs in
    append (map (fun l -> x::l) ls) ls;;

(*let rec cycle xs n = 
  if n = 0 then xs
  else
    match xs with
    [] -> []
    | x::ys -> (cycle (append ys [x]) (n-1));;*)


let rec length xs = 
  match xs with
  [] -> 0
  | x::ys -> 1+(length ys);;

let cycle xs n =
  let rec cycle_aux left right n = 
    if n = 0 then (append right left)
    else
    match right with
    [] -> left
    | y::ys -> (cycle_aux (append left [y]) ys (n-1))
  in cycle_aux [] xs ((length xs) - n);;

let rec reverse xs =
  match xs with
  [] -> []
  | y::ys -> (append (reverse ys) [y]);;

let cycle2 xs n =
  let rec cycle_aux left right n = 
    if n = 0 then (append right (reverse left))
    else
    match right with
    [] -> left
    | y::ys -> (cycle_aux  (y::left) ys (n-1))
  in cycle_aux [] xs ((length xs) - n);;



let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;

printf "sublists [1;2;3]:\n";;
print_list_list (sublists [1;2;3]);;
printf "cycle [1;2;3;4] 1:\n";;
print_list (cycle [1;2;3;4] 1);;
printf "\n cycle [1;2;3;4;5;6;7] 3:\n";;
print_list (cycle2 [1;2;3;4;5;6;7] 3);;

