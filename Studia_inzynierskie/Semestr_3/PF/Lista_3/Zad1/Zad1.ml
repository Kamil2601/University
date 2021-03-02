let horner w x =
  let rec sum l res =
  match l with
  [] -> res
  | a::la -> sum la (res*x+a)
  in sum w 0;;

let horner2 w x = List.fold_left (fun a b -> a*x+b) 0 w;;

open Printf;;

printf "%d " (horner [1;1;1] 1);;
printf "%d " (horner2 [1;1;1] 1);;
printf "%d " (horner [1;1;1] 0);;
printf "%d " (horner2 [1;1;1] 0);;
printf "%d " (horner [5;0;1] 6);;
printf "%d " (horner2 [5;0;1] 6);;
printf "%d " (horner [3;2;1] 10);;
printf "%d \n" (horner2 [3;2;1] 10);;