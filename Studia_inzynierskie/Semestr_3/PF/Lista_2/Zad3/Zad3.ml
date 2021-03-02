open Printf;;

let print_list xs = 
  printf "[";
  (List.iter (printf "%d;") xs);
  printf "]; ";;

let rec print_list_list xss =
  match xss with
  [] -> printf "\n"
  | ys::yss -> print_list ys; print_list_list yss;;


let rec append xs ys = 
  match xs with
  [] -> ys
  | x::zs -> x::(append zs ys);;


let rec merge xs ys cmp = 
  match xs with
  [] -> ys
  | x::zs ->
    match ys with
    [] -> xs
    | y::ps -> if (cmp x y) then x::(merge zs ys cmp) else y::(merge xs ps cmp);;

let merge2 xs ys cmp = 
  let rec mg zs ps res = 
    match zs with
    [] -> (match ps with
          [] -> res
          | p::qs -> (mg zs qs (p::res)))
    | z::rs -> (match ps with
          [] -> (mg rs ps (z::res))
          | p::qs -> (if (cmp z p) then (mg rs ps (z::res)) else (mg zs qs (p::res))))
  in mg xs ys [];;


let merge3 xs ys cmp = 
  let rec mg zs ps res = 
    match zs with
    [] -> (match ps with
          [] -> res
          | p::qs -> (mg zs qs (append res [p])))
    | z::rs -> (match ps with
          [] -> (mg rs ps (append res [z]))
          | p::qs -> (if (cmp z p) then (mg rs ps (append res [z])) else (mg zs qs (append res [p]))))
  in mg xs ys [];;

let rec length xs = 
  match xs with
  [] -> 0
  | x::ys -> 1+(length ys);;

let rec append xs ys = 
  match xs with
  [] -> ys
  | x::zs -> x::(append zs ys);;

let divide xs = 
  let rec div left right n = 
    if n=0 then (left,right)
    else
    match right with
    [] -> (left,right)
    | y::ys -> (div (append left [y]) ys (n-1))
    in div [] xs ((length xs)/2);;

let rec reverse xs =
  match xs with
  [] -> []
  | y::ys -> (append (reverse ys) [y]);;

let neg cmp =
  (fun x y -> (not (cmp x y)));;
  

let rec mergesort xs cmp= 
  if (length xs) > 1 then
    let ys, zs = (divide xs) in
      let sorted_ys, sorted_zs = (mergesort ys (neg cmp)), (mergesort zs (neg cmp))
        in
        (merge2 sorted_ys sorted_zs (neg cmp))
  else xs;;



print_list (merge [1;2;5] [3;4;5] (<=)); printf "\n";;

let x,y = (divide [1;2;3;4;5;6]) in (print_list x); (print_list y); printf"\n";;

print_list (mergesort [1;5;2;6;3;7;3;1;0] (<)); printf"\n";;