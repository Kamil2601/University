let rec horner w x =
  match w with
  [] -> 0
  | a::v -> a+x*(horner v x);;


let horner2 w x = List.fold_right (fun a b -> a+x*b) w 0


open Printf;;

printf "%d " (horner [1;1;1] 1);;
printf "%d " (horner2 [1;1;1] 1);;
printf "%d " (horner [1;1;1] 0);;
printf "%d " (horner2 [1;1;1] 0);;
printf "%d " (horner [1;0;5] 6);;
printf "%d " (horner2 [1;0;5] 6);;
printf "%d " (horner [1;2;3] 10);;
printf "%d \n" (horner2 [1;2;3] 10);;