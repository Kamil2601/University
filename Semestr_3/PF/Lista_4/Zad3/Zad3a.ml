type 'a mtree_lst = MTree of 'a * ('a mtree_lst ) list

let rec walk_tree tree = 
  match tree with
  MTree(v,[]) -> [v]
  | MTree(v,tl) -> v::(List.fold_left (fun l1 l2 -> l1 @ l2) [] (List.map walk_tree tl));;
  

let find_vals tree_list = 
  let rec find tl vals stls =
    match tl with
    [] -> (vals, stls)
    | (MTree(v,l))::tl2 -> (find tl2 (vals @ [v]) (stls @ [l]))
  in (find tree_list [] []);;

let rec bfw_tree_list tree_list = 
  match tree_list with
  [] -> []
  | _ -> let vals = (find_vals tree_list) 
          in (fst vals) @ (List.fold_left (fun l1 l2 -> l1 @ l2) [] (List.map bfw_tree_list (snd vals)));;
          
let rec bfw_tree tree =
  match tree with
  MTree(v,tl) -> v::(bfw_tree_list tl);;

let t5 = MTree(1, [MTree(2,[MTree(3,[]);MTree(4,[])]);MTree(5,[])]);;