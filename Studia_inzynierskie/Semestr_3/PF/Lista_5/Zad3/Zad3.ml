type formula = Var of string | Not of formula | And of formula * formula | Or of formula * formula | Imp of formula * formula;;


type proof = Proof of element list * formula
    and element = Form of formula | Frame of formula * proof;;