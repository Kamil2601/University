
let duplicates xs = 
  let rec dupl xs res = 
    let rec find_a a xs res =
      match xs with
      | b::ys -> if a=b then (find_a b ys (a::res)) else (res, xs)
      | _ -> (res, xs)
    in
    match xs with
    [] -> res
    | a::ys -> let tuple = (find_a a xs []) in (dupl (snd tuple) (res @ [(fst tuple)]))
  in dupl xs [];;


  

open Printf;;

let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;

print_list_list (duplicates [1;1;1;2;2;3;3;3;4;3;3;3;3]);;
