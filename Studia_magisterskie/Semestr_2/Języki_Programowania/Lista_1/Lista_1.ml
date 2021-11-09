type exp = True | False | Zero | If of exp * exp * exp | Succ of exp | Pred of exp | IsZero of exp;;

type symbol = True' | False' | Zero' | If' | Then' | Else' | Succ' | Pred' | IsZero';;


(* Zadanie 5 *)

let rec parse' (xs: symbol list): exp * symbol list = 
    match xs with
        | True'::ys -> (True, ys)
        | False'::ys -> (False, ys)
        | Zero'::ys -> (Zero, ys)
        | Succ'::ys -> let (res, zs) = (parse' ys) in (Succ res, zs)
        | Pred'::ys -> let (res, zs) = (parse' ys) in (Pred res, zs)
        | IsZero'::ys -> let (res, zs) = (parse' ys) in (IsZero res, zs)
        | If'::ys -> 
            let (resIf, zs1) = (parse' ys) in 
            let (resThen, zs2) = (parse' (List.tl zs1)) in
            let (resElse, zs3) = (parse' (List.tl zs2)) in 
                (If (resIf, resThen, resElse), zs3)
;;

let parse (xs: symbol list): exp = fst (parse' xs);;


let test = [Succ'; Pred'; Pred'; Pred'; Succ'; Succ'; False'];;

let test2 = [If'; If'; True'; Then'; False'; Else'; False'; Then'; True'; Else'; Zero']

let test3 = [If'; True'; Then'; True'; Else'; False']

let test4 = [If'; IsZero'; Succ'; Pred'; Succ'; Zero'; Then'; Zero'; Else'; Zero']