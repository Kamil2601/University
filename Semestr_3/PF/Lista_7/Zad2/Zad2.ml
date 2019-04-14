type 'a list_mutable = LMnil | LMcons of 'a * 'a list_mutable ref;;


let rec concat_copy xs ys =
  match xs with
  | LMnil -> ys
  | LMcons (x, zs) ->
      let tail = ref (concat_copy !zs ys)
      in LMcons(x, tail)

let concat_share2 xs ys = 
  let rec aux xs ys = 
    match !xs with
    LMnil -> ys
    | LMcons(x,tl) -> ref (LMcons(x,(aux tl ys)))
  in !(aux (ref xs)  (ref ys));;      

let concat_share xs ys = 
  let start = (ref xs) in
    let rec aux l1 l2 = 
      match !l1 with
      LMnil -> l1 := l2; start
      | LMcons(x,tl) -> (aux tl ys)
  in !(aux (ref xs) ys);;
  

let l1 = LMcons(1,ref LMnil);;
let l2 = LMcons(2,ref (LMcons(3,ref (LMcons(4,ref LMnil)))));;

open Printf;;

let print_lm lm = 
  let rec aux lm = 
    match lm with
    LMnil -> printf "]\n";
    | LMcons(x, tl) -> printf "%d, " x; (aux !tl)
  in printf "[ "; (aux lm);;


let l3 = concat_share l1 l2;;

print_lm l3;

