let square_matrix m = 
  let rec check_length xss lg = 
    List.fold_left (fun a b -> (a && ((List.length b) = lg))) true xss
  in let lg = List.length m
      in check_length m lg;;

let nth_col n m =
  let rec nth_col_aux m res =   
    let rec nth_el n xs =
      match n with
      1 -> (List.hd xs)
      | _ -> (nth_el (n-1) (List.tl xs))
    in
    List.fold_left (fun a b -> a @ [(nth_el n b)]) [] m
  in (nth_col_aux m []);;

let transpose m = 
  let rec trans n res = 
    if n = 0 then res
    else (trans (n-1) ((nth_col n m)::res))
  in trans (List.length m) []

let zip xs ys =
  List.fold_left2 (fun a b c -> a @ [(b,c)]) [] xs ys;;

let zipf xs ys f = 
  let apply_f zs = List.fold_left (fun a b -> a @ [(f (fst b) (snd b))]) [] zs
  in apply_f (zip xs ys);;

let mult_vec v m = 
  let rec mult_sum n res = 
    let sum xs ys = 
      List.fold_left ( + ) 0 (zipf xs ys ( * ))
    in 
      if n = 0 then res 
      else (mult_sum (n-1) ((sum v (nth_col n m))::res))
  in mult_sum (List.length v) [];;


let rec mult_matrix m1 m2 = 
  match m1 with
  [] -> []
  | v::m -> (mult_vec v m2)::(mult_matrix m m2);;
  
open Printf;;

let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]";;


let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;

let rec print_matrix m =
  match m with
  [] -> printf "------- \n"
  | ys::yss -> print_list ys; printf "\n"; print_matrix yss;;

printf "%b " (square_matrix []);;
printf "%b " (square_matrix [[1]]);;
printf "%b " (square_matrix [[1;2]]);;
printf "%b " (square_matrix [[1;2];[1;2]]);;
printf "%b " (square_matrix [[1;2];[1;2;3]]);;
printf "%b " (square_matrix [[1;2;3];[1;2;3]]);;
printf "%b \n" (square_matrix [[1;2;3];[1;2;3];[4;5;6]]);;


print_list (nth_col 2 [[1;2];[3;4]]);;
print_list (nth_col 2 [[1;2;3];[3;4;5];[1;2;3]]);;


print_matrix (transpose [[1;2];[3;4]]);;

print_matrix (transpose [[11;12;13;14];[21;22;23;24];[31;32;33;34];[41;42;43;44]]);;

let pp_int_pair ppf (x,y) =
  fprintf ppf "(%d,%d)" x y

let rec print_tuple_list xs =
  match xs with
  [] -> printf "\n"
  | y::ys -> printf "%a;" pp_int_pair y; (print_tuple_list ys);;


print_tuple_list (zip [1;2;3;4] [5;6;7;8]);;

print_list (zipf [1;2;3;4] [0;1;2;3] (+));;
printf "\n";;
print_list (zipf [1;2;3;4] [0;1;2;3] ( * ));;
printf "\n";;

print_list (mult_vec [1;2] [[2;0];[4;5]]);;
printf "\n\n";;

print_matrix (mult_matrix [[1;2];[3;4]] [[5;6];[7;8]]);;