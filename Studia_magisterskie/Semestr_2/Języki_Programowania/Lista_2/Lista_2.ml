type exp = True | False | Zero | If of exp * exp * exp | Succ of exp | Pred of exp | IsZero of exp;;

type nvalue = Zero | Succ of nvalue;;
type value = True | False | N of nvalue;;

exception NoRuleApplies;;


(* Zadanie 4 *)

let rec eval (t: exp): value = 
    match t with
    | True -> True
    | False -> False
    | Zero -> N Zero
    | If (if', then', else') -> (
        match (eval if') with
        | True -> eval then'
        | False -> eval else'
        | _ -> raise NoRuleApplies
    )
    | Succ e -> (
        match (eval e) with
        | N value -> N (Succ value)
        | _ -> raise NoRuleApplies
    )
    | Pred e -> (
        match (eval e) with
        | (N Zero) -> N Zero
        | (N (Succ nval)) -> N nval
        | _ -> raise NoRuleApplies
    )
    | IsZero e -> (
        match (eval e) with
        | N Zero -> True
        | N (Succ _) -> False
        | _ -> raise NoRuleApplies
    )

;;

let exp1 = IsZero (Succ (Succ False));;
let exp2 = IsZero (Succ (Succ Zero));;



(* Zadanie 5 *)


type term =
    TmTrue
    | TmFalse
    | TmIf of term * term * term
    | TmZero
    | TmSucc of term
    | TmPred of term
    | TmIsZero of term
    | TmAnd of term * term
    | TmAdd of term * term

let rec isnumericval t = match t with
    | TmZero -> true
    | TmSucc t1 -> isnumericval t1
    | _ -> false

let rec isval t = match t with
    | TmTrue -> true
    | TmFalse -> true
    | t when isnumericval t -> true
    | _ -> false

;;

let rec eval1 t = match t with
    | TmIf (TmTrue, t2, _) -> t2
    | TmIf (TmFalse, _, t3) -> t3
    | TmIf (t1, t2, t3) -> TmIf ((eval1 t1), t2, t3) 
    | TmSucc t1 -> TmSucc (eval1 t1)
    | TmPred TmZero -> TmZero
    | TmPred (TmSucc nv1) when (isnumericval nv1) -> nv1
    | TmPred t1 -> TmPred (eval1 t1)
    | TmIsZero TmZero -> TmTrue
    | TmIsZero (TmSucc nv1) when (isnumericval nv1) -> TmFalse
    | TmIsZero t1 -> TmIsZero (eval1 t1)
    (* And *)
    | TmAnd (TmTrue, TmTrue) -> TmTrue
    | TmAnd (TmTrue, TmFalse) -> TmFalse
    | TmAnd (TmFalse, TmTrue) -> TmFalse
    | TmAnd (TmFalse, TmFalse) -> TmFalse
    | TmAnd (nv1, t2) when (isval nv1) -> TmAnd (nv1, (eval1 t2))
    | TmAnd (t1, t2) -> TmAnd ((eval1 t1), t2)
    (* Add *)
    | TmAdd (TmZero, nv2) when (isnumericval nv2) -> nv2
    | TmAdd ((TmSucc nv1), nv2) when (isnumericval nv1) && (isnumericval nv2) -> TmAdd (nv1, (TmSucc nv2))
    | TmAdd (nv1, t2) when (isnumericval nv1) -> TmAdd (nv1, (eval1 t2))
    | _ -> raise NoRuleApplies

