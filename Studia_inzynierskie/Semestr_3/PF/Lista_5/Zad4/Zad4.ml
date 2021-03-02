type formula = Var of string | Not of formula | And of formula * formula | Or of formula * formula | Imp of formula * formula;;

type proof = Proof of element list * formula
    and element = Form of formula | Frame of formula * proof;;


let rec vars_formula form = 
  let rec vars_f f = 
    match f with
    Var(p) -> ([p],[])
    | Not(f1) -> let (pos,neg)=(vars_f f1) in (neg, pos)
    | And(f1,f2) -> let (pos1,neg1)=(vars_f f1) and (pos2,neg2)=(vars_f f2) in (pos1 @ pos2, neg1 @ neg2)
    | Or(f1,f2) -> let (pos1,neg1)=(vars_f f1) and (pos2,neg2)=(vars_f f2) in (pos1 @ pos2, neg1 @ neg2)
    | Imp(f1,f2) -> let (neg1,pos1)=(vars_f f1) and (pos2,neg2)=(vars_f f2) in (pos1 @ pos2, neg1 @ neg2)
  in let (pos,neg) = (vars_f form) in (List.sort_uniq compare pos, List.sort_uniq compare neg);;

let vars_list forms = 
  let rec aux fs pos neg = 
    match fs with
    [] -> (List.sort_uniq compare pos, List.sort_uniq compare neg)
    | f::fs_tl -> let (pos1,neg1)=(vars_formula f) in (aux fs_tl (pos @ pos1) (neg @ neg1))
  in aux forms [] [];;

let vars_els els = 
  let rec aux els pos neg = 
    match els with
    [] -> (List.sort_uniq compare pos, List.sort_uniq compare neg)
    | el::els_tl -> 
      match el with
      Form(f) -> let (pos1,neg1)=(vars_formula f) in (aux els_tl (pos @ pos1) (neg @ neg1))
      | Frame(f,pr) -> let (pos1,neg1)=(vars_formula f) and (pos2,neg2)=(vars_pr pr)
                        in (aux els_tl (pos @ pos1 @ pos2) (neg @ neg1 @ neg2))
    
  and vars_pr pr = 
    match pr with
    Proof(els,form) -> let (pos1,neg1)=(aux els [] []) and (pos2,neg2)=(vars_formula form)
                    in (List.sort_uniq compare (pos1 @ pos2), List.sort_uniq compare (neg1 @ neg2))
  in (aux els [] []);;

let vars_proof pr = 
  match pr with
  Proof(els,form) -> let (pos1,neg1)=(vars_els els) and (pos2,neg2)=(vars_formula form)
                  in (List.sort_uniq compare (pos1 @ pos2), List.sort_uniq compare (neg1 @ neg2));;

