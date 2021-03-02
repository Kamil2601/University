open Printf;;
open Syntax;;
open Print;;

type 'a check = Ok of 'a prop | Err of string


let rec solve pr assum = 
  match pr with
  Ax(f) -> if List.mem f assum then Ok(f) else Err("Unprooved formula "^(Print.print_prop f)^" used!")
  | TopI -> Ok(Top)
  | ConjI(pr1, pr2) -> (match ((solve pr1 assum), (solve pr2 assum)) with
                      (Err(msg), _) -> Err(msg)
                      | (_, Err(msg)) -> Err(msg)
                      | (Ok(s1),Ok(s2)) -> Ok(Conj(s1,s2)))
  | DisjIL(pr,f) -> (match ((solve pr assum),f) with
                    | (Err(msg),_) -> Err(msg)
                    | (Ok(s),_) -> Ok(Disj(s, f)))
  | DisjIR(f,pr) -> (match (f,(solve pr assum)) with
                    | (_, Err(msg)) -> Err(msg)
                    | (_,Ok(s)) -> Ok(Disj(f,s)))
  | ImplI((f,pr)) -> (match (solve pr (f::assum)) with
                     Err(msg) -> Err(msg)
                     | Ok(f1) -> Ok(Impl(f,f1)))
  | BotE(f) -> Ok(f)
  | ConjEL(pr) -> (match (solve pr assum) with
                  Err(msg) -> Err(msg)
                  | Ok(f) ->( match f with
                            Conj(l,_) -> Ok(l)
                            | _ -> Err("ConjER - not conjunction inside!")))
  | ConjER(pr) -> (match (solve pr assum) with
                  Err(msg) -> Err(msg)
                  | Ok(f) ->(match f with
                            Conj(_,r) -> Ok(r)
                            | _ -> Err("ConjER - not conjunction inside!")))
  | DisjE(pr,(f1,pr1),(f2,pr2)) -> (let s = (solve pr assum) 
                                  and s1 = (solve pr1 (f1::assum))
                                  and s2 = (solve pr2 (f2::assum)) in 
                                  match (s,s1,s2) with
                                  (Ok(Disj(p,q)),Ok(r1),Ok(r2)) -> 
                                  if r1=r2 then Ok(r1)
                                  else Err("DisjE - different results of "^ (Print.print_prop p) ^ ":" ^ (print_prop r1) ^ " and " ^ (print_prop q) ^ ":" ^ (print_prop r2))
                                  | _ -> Err("DisjE - not disjunction inside!"))
  | ImplE(pr1,pr2) -> match ((solve pr1 assum),(solve pr2 assum)) with
                            (Ok(p), Ok(Impl(a,b))) -> if a=p then Ok(b) else Err("ImplE - a!=p in (p, a->b)!")
                            | (Err(msg), _) -> Err(msg)
                            | (_, Err(msg)) -> Err(msg)
                            | (_, _) -> Err("ImplE - not implication inside!");;


let check_intro f facts = 
  match f with
  Conj(a,b) -> (List.mem a facts) && (List.mem b facts)
  | Disj(a,b) -> (List.mem a facts) || (List.mem b facts)
  | _ -> false;;

let rec check_conj_e form facts = 
  match facts with
  [] -> false
  | fact::tl -> match fact with
                Conj(a,b) -> if a=form || b=form then true else (check_conj_e form tl)
                | _ -> (check_conj_e form tl);;

let check_impl_e form facts = 
  let rec aux ft = 
    match ft with
    [] -> false
    | (Impl(a,b))::tl -> if b=form && (List.mem a facts) then true else (aux tl)
    | f::tl -> (aux tl)
  in aux facts;;

let check_disj_e form facts = 
  let rec aux ft = 
    match ft with
    [] -> false
    | Disj(a,b)::tl -> if (a=form || (List.mem (Impl(a,form)) facts))
                    && (b=form || (List.mem (Impl(b,form)) facts))
                  then true else (aux tl)
    | f::tl -> (aux tl)
  in aux facts;;

let derivable f facts =
  if List.mem f facts then true
  else if List.mem Bot facts then true
  else if (check_intro f facts) then true
  else if (check_conj_e f facts) then true
  else if (check_disj_e f facts) then true
  else if (check_impl_e f facts) then true
  else false;;


let rec validate pr facts = 
  match pr with
  PDone(f) -> (if (derivable f facts) 
              then Ok(f) 
              else Err("PDone: Final conlcusion cannot be derived!"))
  | PConc(f, pr1) ->( if (derivable f facts)
              then (validate pr1 (f::facts))
              else Err("PConc: formula [ " ^ (Print.print_prop f) ^ " ] cannot be derived!"))
  | PHyp((assumption,frame_pr),pr) -> 
        let frame_res = (validate frame_pr (assumption::facts))
        in match frame_res with
          Err(_) -> frame_res
          | Ok(res) -> 
              let impl = Impl(assumption, res)
              in (validate pr (impl::facts));;                 

let check_proof proof target = 
  match (solve proof []) with
  Err(msg) -> msg
  |Ok(f) -> if f=target then "Proof is correct" else "Target cannot be derived";;

let check_proof_list proof target = 
  match (validate proof []) with
  Err(msg) -> msg
  |Ok(f) -> if f=target then "Proof is correct" else "Target cannot be derived";;

let rec check_proofs proofs = 
  match proofs with
  [] -> []
  | pr::tl -> match pr with
              TGoal(s,f,pr) -> (s,(check_proof pr f))::(check_proofs tl)
              | SGoal(s,f,pr) -> (s,(check_proof_list pr f))::(check_proofs tl);;

let rec print_list xs = 
  match xs with
  [] -> ()
  | (y,z)::ys -> printf "%s - %s\n" y z; (print_list ys);;


