type term =
  | Var of int
  | Lam of term
  | App of term * term

type 'a env = 'a list

type mvalue =
  | Clo of term * mvalue env

type stack =
  | E_mt
  | E_arg of term * mvalue env * stack

let rec eval t e c =
  match t with
  | Var n -> 
    let Clo(t', e') = List.nth e n in eval t' e' c
  | Lam s ->
    ( match c with
      | E_mt -> (Clo (s, e))
      | E_arg (t', e', c') ->
        eval s (Clo(t', e')::e) c' )
  | App (t1, t2) ->
    eval t1 e (E_arg (t2, e, c))

let rec eval_Krivine (t : term) : mvalue =
  eval t [] E_mt
