(* Ewaluatory dla rachunku lambda w wersji CBV. *)

type var = string

type term =
  | Var of var
  | Lam of var * term
  | App of term * term

let rec subst (t : term) (x : var) (v : term) : term =
  match t with
  | Var y ->
    if x = y
    then v
    else t
  | Lam (y, t') ->
    if x = y
    then t
    else Lam (y, subst t' x v)
  | App (t1, t2) ->
    App (subst t1 x v, subst t2 x v)



type 'a env = (var * 'a) list
let mt_env : 'a env = []
let lookup_env (x : var) (e : 'a env) = List.assoc x e
let update_env (e : 'a env) (x : var) (v : 'a) : 'a env = (x, v) :: e

type redt = Base of term
          | Arr of term * (redt -> redt)

let rec reify r =
  match r with
  | Base t -> t
  | Arr (t, _) -> t

let rec substs t e = List.fold_right (fun (x, v) s -> subst s x v) e t

let rec eval t (ts : term env) (rs : redt env) : redt =
  match t with
  | Var x -> lookup_env x rs
  | Lam (x, t) ->
     Arr (substs (Lam (x, t)) ts, fun e -> eval t (update_env ts x (reify e)) (update_env rs x e))
  | App (t1, t2) ->
     match eval t1 ts rs with
     | Arr (_, f) -> f (eval t2 ts rs)
     | _ -> failwith "Type error"

let eval_nbe t = reify (eval t [] [])

(* klasyczny ewaluator wyższego rzędu *)


type value = Fun of (value -> value)

let rec eval_cbv t (rs : value env) : value =
  match t with
  | Var x -> lookup_env x rs
  | Lam (x, t) ->
    Fun (fun e -> eval_cbv t (update_env rs x e))
  | App (t1, t2) ->
    let Fun f = eval_cbv t1 rs in f (eval_cbv t2 rs)

type value_cbn = Fun_cbn of (term -> value_cbn)

let rec eval_cbn t (rs : term env) : value_cbn =
  match t with
  | Var x -> eval_cbn (lookup_env x rs) rs
  | Lam (x, t) ->
    Fun_cbn ((fun t' -> eval_cbn t (update_env rs x t')))
  | App (t1, t2) ->
    let Fun_cbn f = eval_cbn t1 rs in f t2
