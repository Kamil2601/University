type 'a btree = Leaf | Node of 'a btree * 'a * 'a btree;;

let prod tree = 
  let rec cps_prod tree k = 
    match tree with
    Leaf -> k 1
    | Node(t1,v,t2) -> cps_prod t1 (fun x -> cps_prod t2 (fun y -> k (x * v * y)))
  in cps_prod tree (fun x -> x);;


let prod_better tree = 
  let rec cps_prod tree k = 
    match tree with
    Leaf -> k 1
    | Node(t1,v,t2) -> 
          if v=0 then 0 else
          cps_prod t1 (fun x -> cps_prod t1 (fun y -> k (x * v * y)))
  in cps_prod tree (fun x -> x);;

  open Printf;;

let t = Node(Node(Leaf,1,Leaf),2,Node(Leaf,5,Node(Leaf,3,Node(Leaf,4,Leaf))));;


printf "%d\n" (prod t);;