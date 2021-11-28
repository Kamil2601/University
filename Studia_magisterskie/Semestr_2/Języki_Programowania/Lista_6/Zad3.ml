type var = string

type termType = 
  | TBool
  | TFun of termType * termType

type term =
  | Var of var
  | True | False
  | Lam of var * term
  | App of term * term
  | If  of term * term * term
  | Ann of term * termType


(* type context = [];; *)

let rec lookup x ctx = 
  match ctx with
  | [] -> None
  | (y, t)::ys -> if y=x then Some t else lookup x ys 


let rec inferType ctx t = 
  match t with
  | Var x -> lookup x ctx
  | True -> Some TBool
  | False -> Some TBool
  | Ann (t', ty) -> checkType ctx t' ty
  | App (t1, t2) -> (
    match (inferType ctx t1) with
      | Some (TFun (ty1, ty2)) -> (
        match (checkType ctx t2 ty1) with
          | (Some ty3) -> if ty3 = ty1 then Some ty2 else None
          | _ -> None
      )
      | _ -> None
  )
  | _ -> None

and checkType ctx t ty = 
  match t with
  | If(t1, t2, t3) -> (
    match (checkType ctx t1 TBool, checkType ctx t2 ty, checkType ctx t2 ty) with
      | (Some TBool, Some ty2, Some ty3) -> Some ty
      | _ -> None
    )
  | Lam(x, t') -> (
    match ty with
    | TFun(ty1, ty2) -> (
      match (checkType ((x, ty1)::ctx) t' ty2) with
        | (Some ty3) -> Some (TFun(ty1, ty2))
        | None -> None
      )
    | _ -> None
  )
  | _ -> (
    match inferType ctx t with 
      | Some ty' -> if ty = ty' then Some ty else None
      | None -> None
    )
