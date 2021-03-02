open Printf;;

let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;

let partition pred xs = 
  let rec part left right ys =
    match ys with
    [] -> (left,right)
    | z::zs -> if (pred z) then (part (z::left) right zs) else (part left (z::right) zs)
    in part [] [] xs;;


let rec length xs = 
  match xs with
  [] -> 0
  | x::ys -> 1+(length ys);;

let rec append xs ys = 
  match xs with
  [] -> ys
  | x::zs -> x::(append zs ys);;


let rec quicksort xs cmp =
  match xs with
  [] -> []
  | x::[] -> xs
  | x::ys -> let smaller, bigger = (partition (fun y -> (cmp y x)) ys)
              in let sorted_s, sorted_b = (quicksort smaller cmp), (quicksort bigger cmp)
                in (append sorted_s (x::sorted_b));;

let x,y = (partition (fun x -> x mod 2 = 0) [1;2;3;4;5;6;7;8;9])
in (print_list x); (printf "\n"); (print_list y); (printf "\n");;

print_list (quicksort [1;2;3;3;2;1] (<=));;
printf "\n";

