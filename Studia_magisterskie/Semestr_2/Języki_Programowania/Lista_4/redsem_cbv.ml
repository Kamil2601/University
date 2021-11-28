(* Semantyka redukcyjna rachunku lambda w wersji CBV. *)

type var = string

type term =
  | Var of var
  | Lam of var * term
  | App of term * term

type value =
  | V_lam of var * term

let value_to_term =
  function
  | V_lam (x, t) ->
    Lam (x, t)

type redex =
  | R_beta of value * value

(* Zakładamy, że v jest zamknięta. *)
let rec subst (t : term) (x : var) (v : value) : term =
  match t with
  | Var y ->
    if x = y
    then value_to_term v
    else t
  | Lam (y, t') ->
    if x = y
    then t
    else Lam (y, subst t' x v)
  | App (t1, t2) ->
    App (subst t1 x v, subst t2 x v)

let contract (r : redex) : term =
  match r with
  | R_beta (V_lam (x, t), v) ->
    subst t x v

type ectx =
  | E_mt
  | E_arg of term * ectx
  | E_fun of value * ectx

let rec plug (c : ectx) (t : term) : term =
  match c with
  | E_mt ->
    t
  | E_arg (s, c') ->
    plug c' (App (t, s))
  | E_fun (v, c') ->
    plug c' (App (value_to_term v, t))

type dec =
  | D_val of value
  | D_dec of redex * ectx

let decompose (t : term) : dec =
  let rec decompose_t t c =
    match t with
    | Var x ->
      failwith ("Unbound identifier " ^ x)
    | Lam (x, s) ->
      decompose_e c (V_lam (x, s))
    | App (t1, t2) ->
      decompose_t t1 (E_arg (t2, c))
  and decompose_e c v =
    match c with
    | E_mt ->
      D_val v
    | E_arg (t, c') ->
      decompose_t t (E_fun (v, c'))
    | E_fun (u, c') ->
      D_dec (R_beta (u, v), c')
  in decompose_t t E_mt

let rec eval (t : term) : value =
  match decompose t with
  | D_val v ->
    v
  | D_dec (r, c) ->
    eval (plug c (contract r))


(* Tw: decompose jest funkcją totalną na zbiorze termów zamkniętych taką, że

          decompose t = D_dec (r, c) wtw t = plug (c, r).

   Wniosek (jednoznaczność rozkładu): term zamknięty t albo jest wartością,
   albo istnieje dokładnie jeden redeks r i kontekst c takie, że t = plug (c, r).
*)


(************************************************)
(* Obserwacja:

   decompose_t (plug c t) mt = decompose_t t c

   Otrzymujemy zoptymalizowaną implementację semantyki redukcyjnej
   znaną jako maszyna abstrakcyjna CK.
 *)

(*
let rec eval' (d : dec) : value =
  match d with
  | D_val v ->
    v
  | D_dec (r, c) ->
    eval' (decompose_t (contract r) c)

let eval t = eval' (decompose_t t E_mt)
*) 

let rec eval_t t c =
  match t with
  | Var x ->
    failwith ("Unbound identifier " ^ x)
  | Lam (x, s) ->
    eval_e c (V_lam (x, s))
  | App (t1, t2) ->
    eval_t t1 (E_arg (t2, c))
and eval_e c v =
  match c with
  | E_mt ->
    v
  | E_arg (t, c') ->
    eval_t t (E_fun (v, c'))
  | E_fun (u, c') ->
    eval_t (contract (R_beta (u, v))) c'

let rec eval' (t : term) : value =
  eval_t t E_mt

(************************************************)

(* Zastępujemy podstawienie środowiskiem.
   Otrzymujemy maszynę abstrakcyjną znaną jako CEK. *)

type 'a env = (var * 'a) list
let mt_env : 'a env = []
let lookup_env (x : var) (e : 'a env) = List.assoc x e
let update_env (e : 'a env) (x : var) (v : 'a) : 'a env = (x, v) :: e
    
type mvalue =
  | Clo of var * term * mvalue env

type stack =
  | E_mt
  | E_arg of term * mvalue env * stack
  | E_fun of mvalue * stack

let rec eval_cek_t t e c =
  match t with
  | Var x ->
    lookup_env x e
  | Lam (x, s) ->
    eval_cek_e c (Clo (x, s, e))
  | App (t1, t2) ->
    eval_cek_t t1 e (E_arg (t2, e, c))
and eval_cek_e c v =
  match c with
  | E_mt ->
    v
  | E_arg (t, e, c') ->
    eval_cek_t t e (E_fun (v, c'))
  | E_fun (Clo (x, t, e), c') ->
    eval_cek_t t (update_env e x v) c'

let rec eval_cek (t : term) : mvalue =
  eval_cek_t t mt_env E_mt

(* EOF *)
