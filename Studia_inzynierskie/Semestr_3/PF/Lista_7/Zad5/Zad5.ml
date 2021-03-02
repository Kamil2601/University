type 'a lnode = {item: 'a; mutable next: 'a lnode};;

let mk_circular_list e =
  let rec x = {item=e; next=x}
  in x;;

let insert_head e l =
  let x = {item=e; next=l.next}
  in l.next <- x; l;;

let insert_tail e l =
  let x = {item=e; next=l.next}
  in l.next <- x; x;;

let rec make_list n = 
  match n with
  0 -> failwith "error"
  | 1 -> mk_circular_list 1
  | _ -> insert_tail n (make_list (n-1));;

let rec find n l = 
  if l.next.item = n then l else (find n l.next);;

let rec step n l =
  match n with 
  0 -> l
  | _ -> (step (n-1) l.next);;


let elim_head l = let it = l.next.item in l.next <- (l.next).next; (l,it);;

let joseph n m = 
  let rec aux l res = 
    if l == l.next then res @ [l.item]
    else let l1 = (step (m-1) l) in 
          let tup = (elim_head l1) in (aux (fst tup) (res @ [(snd tup)]))
  in let t1 = (elim_head (find m (make_list n))) in aux (fst t1) [snd t1];;

open Printf;;  
let print_list xs = 
  printf "[ ";
  List.iter (printf "%d, ") xs;
  printf "]\n";;


print_list (joseph 7 3);;
print_list (joseph 5 1);;
print_list (joseph 2 2);;
print_list (joseph 10 2);;