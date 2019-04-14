type 'a llist = LNil | LCons of 'a * 'a llist Lazy.t;;

let lhd = function
  LNil -> failwith "lhd"
  | LCons (x, _) -> x;;

let ltl = function
  LNil -> failwith "ltl"
  | LCons (_, lazy t) -> t;;

let rec ltake n lxs = 
    match (n,lxs) with
    (0,_) -> []
    | (_, LNil ) -> []
    | (_, LCons(y,lazy(yls))) -> y::(ltake (n-1) yls);;

let rec pi_from sum k = 
  let v = (if (mod_float k 2.0) = 1.0 then sum+.1.0/.(2.0*.k-.1.0) else sum-.1.0/.(2.0*.k-.1.0)) in
  LCons(4.*.v, (lazy (pi_from v (k+.1.0))));;

let pi = pi_from 0.0 1.0;;


let rec triple_map f stream = 
  let x1 = (lhd stream) and x2 = (lhd (ltl stream)) and x3 = (lhd (ltl (ltl stream))) in
  LCons((f x1 x2 x3), lazy (triple_map f (ltl stream)));;


let euler x y z = z -. (y-.z)*.(y-.z)/.(x-.2.*.y+.z);;

let new_pi = triple_map euler pi;;
  