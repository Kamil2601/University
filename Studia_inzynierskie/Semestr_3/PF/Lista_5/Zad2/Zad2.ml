type move = Fill of int | Drain of int | Transfer of int*int;;

type 'a llist = LNil | LCons of 'a * 'a llist Lazy.t;;

let lhd = function
  LNil -> failwith "lhd"
  | LCons (x, _) -> x;;

let ltl = function
  LNil -> failwith "ltl"
  | LCons (_, lazy t) -> t;;

let rec ltake n lxs = 
  match (n,lxs) with
  (0,_) -> []
  | (_, LNil ) -> []
  | (_, LCons(y,lazy(yls))) -> y::(ltake (n-1) yls);;

let rec fill n volumes water = 
  match n with
  0 -> (List.hd volumes)::(List.tl water)
  | _ -> (List.hd water)::(fill (n-1) (List.tl volumes) (List.tl water));;

let rec drain n water = 
  match n with
  0 -> 0::(List.tl water)
  | _ -> (List.hd water)::(drain (n-1) (List.tl water));;

let transfer k l volumes water = 
  let trans v_k v_l w_k w_l = 
    let rec aux k l wat = 
      if k<0 && l<0 then wat
      else if k=0 then (if (v_l-w_l)>w_k then 0 else w_k-(v_l-w_l))::(aux (k-1) (l-1) (List.tl wat))
      else if l=0 then (if (v_l-w_l)<w_k then v_l else w_l+w_k)::(aux (k-1) (l-1) (List.tl wat))
      else (List.hd wat)::(aux (k-1) (l-1) (List.tl wat))
    in aux k l water
  in trans (List.nth volumes k) (List.nth volumes l) (List.nth water k) (List.nth water l);;

let fill_s n volumes state = ((fill n volumes (fst state)), (snd state) @ [Fill(n)]);;
let drain_s n state = ((drain n (fst state)), (snd state) @ [Drain(n)]);;
let transfer_s k l volumes state  = ((transfer k l volumes (fst state)), (snd state) @ [Transfer(k,l)]);;


let fill_all volumes state = 
  let rec aux n res = 
    match n with
    -1 -> res
    | _ -> (aux (n-1) ((fill_s n volumes state)::res))
  in aux ((List.length volumes) - 1) [];;

let drain_all volumes state = 
  let rec aux n res = 
    match n with
    -1 -> res
    | _ -> (aux (n-1) ((drain_s n state)::res))
  in aux ((List.length volumes) - 1) [];;

let transfer_all volumes state = 
  let start = (List.length volumes) - 1 in
    let rec aux k l res = 
      match k with
      -1 -> res
      | _ ->( match l with
            -1 -> (aux (k-1) start res)
            | _ -> if k=l then (aux k (l-1) res)
                          else (aux k (l-1) ((transfer_s k l volumes state)::res)))
    in aux start start [];;


let next volumes state = 
  (fill_all volumes state) @ (drain_all volumes state) @ (transfer_all volumes state);;

let rec next_all volumes states = 
  match states with
  [] -> []
  | state::states_tl -> (next volumes state) @ (next_all volumes states_tl);;

let rec step_from volumes states = LCons(states, lazy (step_from volumes (next_all volumes states)));;

let rec check volume state = 
  match state with
  [] -> false
  | hd::tl -> if hd=volume then true else (check volume tl);;

let rec zero_list n =
  match n with
  0 -> []
  | _ -> 0::(zero_list (n-1));;

let start glasses = [((zero_list (List.length glasses)),[])];;

(*Tworzy listę leniwą rozwiązań*)
let make_list glasses volume = 
  let rec aux all states =
    match states with
    [] -> let s = (next_all glasses all) in (aux s s)
    | s::tl -> if (check volume (fst s)) then LCons((snd s), lazy (aux all tl))
                            else (aux all tl)
  in (aux (start glasses) (start glasses));;

(*Bierze n rozwiązań z listy leniwej*)
let nsols (glasses, volume) n =
  ltake n (make_list glasses volume);;

(*let nsols glasses volume n = 
  let rec aux all states res i = 
    if i = 0 then res
    else
    match states with
    [] -> let s = (lhd (ltl (step_from glasses all))) in (aux s s res i)
    | state::states_tl -> if (check volume (fst state)) 
                          then (aux all states_tl ((snd state)::res) (i-1))
                          else (aux all states_tl res i)
  in aux (start glasses) (start glasses) [] n;;*)


nsols [3;2;1] 2 3;;
nsols [4;9] 5 1;;
nsols [10;2;1] 5 3;;
nsols [5;6;4] 2 1;;