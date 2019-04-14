open Printf;;

let rec append xs ys = 
  match xs with
  [] -> ys
  | x::zs -> x::(append zs ys);;

let put_el ys x = 
  let rec put b e res =
  match e with
  [] -> ((append b [x])::res)
  | z::zs -> (put (append b [z]) zs ((append b (x::e))::res))
  in (put [] ys [])

let put_everywhere x xss = 
  let rec put yss res = 
    match yss with
    [] -> res
    | zs::zss -> (put zss (append (put_el zs x) res))
  in (put xss []);;

let rec perm xs = 
  match xs with
  [] -> [[]]
  | y::ys -> (put_everywhere y (perm ys));;


let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;
  
let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;

printf "perm [1;2;3;4]: \n";;
print_list_list (perm [1;2;3;4]);;