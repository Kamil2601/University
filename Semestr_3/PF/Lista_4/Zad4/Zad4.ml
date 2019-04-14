type formula = Var of string | Not of formula | And of formula * formula | Or of formula * formula;;

let find_vars formula = 
  let rec find form =
    match form with
    Var(str) -> [str]
    | Not(f) -> (find f)
    | And(f1,f2) -> (find f1) @ (find f2)
    | Or(f1,f2) -> (find f1) @ (find f2)
  in List.sort_uniq compare (find formula);;
  
let rec gen_values var_list = 
  match var_list with
  [] -> [[]]
  | v::l -> let vals = (gen_values l) in
          (List.map (fun l -> (v, true)::l) vals) @ (List.map (fun l -> (v, false)::l) vals);;

let rec find_value var vals = 
  match vals with
  [] -> false
  | (a, b)::vals2 -> if a = var then b else (find_value var vals2);;


let rec check_formula form vals = 
  match form with
  Var(str) -> (find_value str vals)
  | Not(f) -> not (check_formula f vals)
  | And(f1,f2) -> (check_formula f1 vals) && (check_formula f2 vals)
  | Or(f1,f2) -> (check_formula f1 vals) || (check_formula f2 vals)

let check_taut form = 
  let rec check valss =
    match valss with
    [] -> (true, [])
    | vals::valss2 -> if (check_formula form vals)=false then (false, vals) else (check valss2)
  in (check (gen_values (find_vars form)));;

open Printf;;

(*printf "%b\n" (check_taut (Or(Var("p"),Not(Var("p")))));;*)

let rec nnf form = 
  match form with
  Var(p) -> Var(p)
  | Or(f1,f2) -> Or((nnf f1),(nnf f2))
  | And(f1,f2) -> And((nnf f1),(nnf f2))
  | Not(f) ->
          match f with
          Var(p) -> Not(f)
          | Not(f1) -> (nnf f1)
          | And(f1, f2) -> Or((nnf(Not(f1))),(nnf(Not(f2))))
          | Or(f1, f2) -> And((nnf(Not(f1))),(nnf(Not(f2))));;


let rec find_and form = 
  match form with
  Var(p) -> false
  | Not(f) -> false
  | And(f1,f2) -> true
  | Or(f1,f2) -> (find_and f1) || (find_and f2);;

let rec in_cnf form = 
  match form with 
  Var(p) -> true
  | Not(f) -> true;
  | And(f1,f2) -> (in_cnf f1) && (in_cnf f2)
  | Or(f1, f2) -> (not ((find_and f1) || (find_and f2)));;

let cnf formula = 
  let rec cn form =
    if (in_cnf form ) then form
    else match form with
    Var(p) -> Var(p)
    | Not(f) -> Not(f)
    | And(f1,f2) -> And((cn f1),(cn f2))
    | Or(f1,f2) -> match f1 with 
                    And(fa,fb) -> cn(And(Or(fa,f2),Or(fb,f2)))
                    | _ -> match f2 with
                          And(fa,fb) -> cn(And(Or(f1,fa),Or(f1,fb)))
                          | _ -> cn(Or((cn f1),(cn f2)))
  in  cn (nnf formula);;

let f = Or(
            And(Var("p"),Var("q")),
            And(Var("r"),Var("s")))


let rec find_pos form = 
  match form with
  Var(p) -> [p]
  | And(f1,f2) -> (find_pos f1) @ (find_pos f2)
  | Or(f1,f2) -> (find_pos f1) @ (find_pos f2)
  | Not(f) -> [];;

let rec check_taut_cnf form = 
  let rec check form pos_list = 
    match form with
    | Or(f1,f2) -> (check f1 pos_list) || (check f2 pos_list)
    | Var(p) -> (List.mem p pos_list)
    | Not(f) -> false
    | _ -> false;;
  in match form with
    And(f1,f2) -> (check_taut_cnf f1) && (check_taut_cnf f2)
    | _ -> (check form (find_pos form));;


let rec find_or form = 
  match form with
  Var(p) -> false
  | Not(f) -> true
  | And(f1,f2) -> false
  | Or(f1,f2) -> (find_or f1) || (find_or f2);;

let rec in_dnf form = 
  match form with 
  Var(p) -> true
  | Not(f) -> true;
  | And(f1,f2) -> (not ((find_and f1) || (find_and f2)))
  | Or(f1, f2) -> (in_dnf f1) && (in_dnf f2);;


let dnf formula = 
  let rec dn form =
    if (in_dnf form ) then form
    else match form with
    Var(p) -> Var(p)
    | Not(f) -> Not(f)
    | Or(f1,f2) -> Or((dn f1),(dn f2))
    | And(f1,f2) -> match f1 with 
                    Or(fa,fb) -> dn(Or(And(fa,f2),And(fb,f2)))
                    | _ -> match f2 with
                          Or(fa,fb) -> dn(Or(And(f1,fa),And(f1,fb)))
                          | _ -> dn(Or((dn f1),(dn f2)))
  in  dn (nnf formula);;

  
let rec check_cont_dnf form = 
  let rec check form pos_list = 
    match form with
    | And(f1,f2) -> (check f1 pos_list) || (check f2 pos_list)
    | Var(p) -> (List.mem p pos_list)
    | Not(f) -> false
    | _ -> false
  in match form with
    Or(f1,f2) -> (check_cont_dnf f1) && (check_cont_dnf f2)
    | _ -> (check form (find_pos form));;


printf "%b" (check_cont_dnf (Or((And(Var("p"),Not(Var("p")))),(And(Var("q"),Not(Var("q")))))));;
