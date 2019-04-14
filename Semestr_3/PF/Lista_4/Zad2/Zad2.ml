open Printf;;

type 'a btree = Leaf | Node of 'a btree * 'a * 'a btree;;

let t = Node(Node(Leaf,1,Leaf),2,Node(Leaf,2,Node(Leaf,3,Node(Leaf,4,Leaf))));;


(*let rec nodes t = 
  match t with
  Leaf -> 0
  | Node(t1,_,t2) -> 1 + (nodes t1) + (nodes t2);;
  
let rec balanced t =
  match t with
  Leaf -> true
  | Node(t1,_,t2) -> (balanced t1) && (balanced t2) && abs((nodes t1) - (nodes t2))<=1;;*)


let rec nodes2 t =
  match t with
  Leaf -> (0, true)
  | Node(t1,_,t2) -> let res1 = (nodes2 t1) and res2 = (nodes2 t2) in
    match res1, res2 with
    (x, true), (y, true) -> if abs(x-y)<=1 then (x+y+1, true) else (x+y+1, false) 
    | (x, _), (y, _) -> (x+y+1, false);;

let balanced2 t = (snd (nodes2 t))
  
let div_list xs = 
  let rec div b e n =
    if n=0 then (b,e)
    else (div (b @ [(List.hd e)]) (List.tl e) (n-1))
  in
  let steps = (List.length xs)/2
    in let left, right = (div [] (List.tl xs) steps)
          in (left,(List.hd xs),right);;

let rec make_tree xs = 
  match xs with
  [] -> Leaf
  | _ -> let (l1, v, l2) = (div_list xs)
      in
      Node((make_tree l1),v,(make_tree l2));;
  

let x,y = (nodes2 t) in printf "%d %b\n" x y;;
printf "%b\n" (balanced2 t);;