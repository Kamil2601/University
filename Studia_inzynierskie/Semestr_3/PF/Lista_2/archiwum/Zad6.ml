open Printf;;

let rec sufixes xs = 
  match xs with
  [] -> [[]]
  | y::ys -> xs::(sufixes ys);;


let rec prefixes xs = 
  let rec add x xss = 
    match xss with
    [] -> []
    | ys::yss -> (x::ys)::(add x yss)
  in match xs with
  [] -> [[]]
  | y::ys -> []::(add y (prefixes ys));;


let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;


print_list_list (sufixes [1;2;3;4]);;
print_list_list (prefixes [1;2;3;4]);;
              