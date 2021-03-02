open Printf;;

let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;


let find_bigger a xs = 
  let rec find xs value = 
  match xs with
  [] -> value
  | y::ys -> if (y>a && (y<value || value = a)) then (find ys y) else (find ys value)
  in find xs a;;

let rec change_el xs a b = 
  match xs with
  [] -> []
  | y::ys -> if y = a then (b::ys) else y::(change_el ys a b);;

let rev_sort xs = List.sort (fun a b -> (-(compare a b))) xs;;

let next_perm xs = 
  let rec next b e =
    match e with
    [] -> (rev_sort xs)
    | y::ys -> let v = (find_bigger y b) in
        if v != y then  ((rev_sort (change_el b v y)) @ (v::ys))
        else (next (b @ [y]) ys)
  in next [] xs;;

let all_perms xs = 
  let rec perms ys res = 
    if ys = xs then res else (perms (next_perm ys) (ys::res))
  in (perms (next_perm xs) [xs]);;



printf "%d\n" (find_bigger 3 [1;2;7;4;5;9]);;

print_list (next_perm [3;4;2;1]);;


printf "\n";;
print_list_list (all_perms [1;2;3;4]);;