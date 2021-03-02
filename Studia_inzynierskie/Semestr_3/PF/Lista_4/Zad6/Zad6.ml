type 'a place = Tuple of 'a list * 'a list * 'a list;;

let findNth xs n = 
  let rec find b e n = 
    if n=0 then Tuple(b, [(List.hd e)], (List.tl e))
    else
      (find ((List.hd e)::b) (List.tl e) (n-1))
  in (find [] xs n);;

let collapse tup = 
  match tup with
  Tuple(x,y,z) -> match y with 
                  [] -> (List.rev x)@z
                  | _ ->(List.rev x)@((List.hd y)::z);;


let del tup = 
  match tup with
  Tuple(x,y,z) ->
            match z with
            [] -> (Tuple(x, [], z))
            | a::b -> Tuple(x, [a], b);;

let add el tup =
  match tup with
  Tuple(x,[],z)->Tuple(x,[el],z)
  | Tuple(x,y,z)->Tuple(x,[el],(List.hd y)::z);;

let next tup = 
  match tup with
  Tuple(x,y,[]) -> 
      (match y with
      [] -> Tuple(x,[],[])
      | a::b -> Tuple(a::x,[],[]))
  |Tuple(x,y,z) -> Tuple((List.hd y)::x,[(List.hd z)], (List.tl z));;

let prev tup =
  match tup with
  Tuple([],y,z) -> (match y with
                  [] -> Tuple([],[],z)
                  | a::b -> Tuple([],[],(a::z)))
  | Tuple(x,y,z) -> Tuple((List.tl x),[(List.hd x)],(List.hd y)::z);;


type 'a btree = Leaf | Node of 'a btree * 'a * 'a btree;;
type 'a btplace = Tuple of a' btree * 'a btree * bool list;;