open Printf;;

let print_tuple t = 
  let (x,y) = t in printf "(%d, %d)\n" x y;;


let print_list xs = 
  printf "[";
  (List.iter (print_tuple) xs);
  printf "]";;

let rec find_el a xs = 
  match xs with
  [] -> false
  | y::ys -> if a=y then true else find_el a ys;;

let all_numbers = 
  let rec all x y res = 
    if (x+y)<100 then (all x (y+1) ((x,y)::res))
      else if x<99 then (all (x+1) (x+2) res) else res
  in all 1 2 [];;


let find_versions_m mult= 
  let rec find a n = 
    if float(a)>=sqrt(float(mult)) then n
    else if (mult/a)*a=mult then (find (a+1) (n+1)) else (find (a+1) n)
  in find 1 0;;

let throw_bad1 = 
  let rec throw ys res = 
    match ys with
    [] -> res
    | z::zs -> if (find_versions_m ((fst z)*(snd z)))>1 then (throw zs (res @ [z])) else (throw zs res)
  in throw all_numbers [];;


let find_versions_a sum = 
  let rec find a res = 
    if 2*a>=sum then res else (find (a+1) (res @ [(a, sum-a)])) 
  in find 1 [];;

let rec check_versions xs =
  match xs with
  [] -> true
  | y::ys -> if (find_versions_m ((fst y)*(snd y))) == 1 then false else (check_versions ys);;

print_list throw_bad1;;
printf "\n\n";;

let throw_bad2 = 
  let rec throw xs res =
    match xs with
    [] -> res
    | y::ys -> if (check_versions (find_versions_a ((fst y)+(snd y))))
    then (throw ys (res @ [y])) else (throw ys res)
  in throw throw_bad1 [];;


let throw_bad3 = 
  let rec throw ys res = 
    match ys with
    [] -> res
    | z::zs -> if  (find_versions_a ((fst z)*(snd z)))==1 then (throw zs (res @ [z])) else (throw zs res)
  in throw throw_bad2 [];;


print_list throw_bad2;;

printf "%d %d %d %d\n" (List.length all_numbers) (List.length throw_bad1) (List.length throw_bad2) (List.length throw_bad3);;