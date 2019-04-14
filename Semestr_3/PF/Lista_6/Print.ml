open Syntax;;

open Printf;;

let rec print_prop f = 
  match f with
  Var(s) -> s
  | Top ->  "True"
  | Bot ->  "False"
  | Conj(f1,f2) ->  "(" ^ (print_prop f1) ^ " ^ " ^ (print_prop f2) ^ ")"
  | Disj(f1,f2) ->  "(" ^ (print_prop f1) ^ " v " ^ (print_prop f2) ^ ")"
  | Impl(f1,f2) ->  "(" ^ (print_prop f1) ^ " => " ^ (print_prop f2) ^ ")";;

(*let rec print_tab t = 
  match t with
  0 -> printf ""
  | _ -> printf " "; (print_tab (t-1));;

let rec print_l pr t = 
  (print_tab t);
  match pr with 
  PDone(f) -> printf "PDone("; (print_prop f); printf ")"
  | PConc(f,pr1) -> printf "PConc("; (print_prop f); printf ",\n"; (print_l pr1 (t+1)); printf ")"
  | PHyp((f,pr1),pr2) -> printf "PHyp(["; (print_prop f); printf ":\n"; (print_l pr1 (t+2)); printf "]\n";
                        (print_l pr2 (t+1));;


let print_proof pr = 
  match pr with
  SGoal(s,f,p) -> (printf "%s - " s); (print_prop f); printf"\n";  (print_l p 0)
  | _ -> ();;
  
let rec print_proofs prs = 
  match prs with
  [] -> ()
  | pr::tl -> (print_proof pr);printf "\n"; (print_proofs tl);;*)

