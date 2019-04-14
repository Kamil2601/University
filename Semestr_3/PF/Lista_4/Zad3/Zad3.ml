type 'a mtree = MNode of 'a * 'a forest 
      and 'a forest = EmptyForest | Forest of 'a mtree * 'a forest;;

let rec walk_forest f = 
      match f with
      EmptyForest -> []
      | Forest(t1, f1) -> (walk_tree t1) @ (walk_forest f1)
 and walk_tree t =
      match t with
      MNode(x, f2) -> x::(walk_forest f2);;


let find_vals forest = 
      let rec find f vals sf = 
            match f with 
            EmptyForest -> (vals, sf)
            | Forest(MNode(v,f1),f2) -> (find f2 (vals @ [v]) (sf @ [f1]))
      in find forest [] [];;

let rec bfw_forest forest = 
      match forest with
      EmptyForest -> []
      | _ -> let vals = (find_vals forest) in
            (fst vals) @ (List.fold_left (fun l1 l2 -> l1 @ l2) [] (List.map bfw_forest (snd vals)));;

let bfw_tree tree = 
      match tree with
      MNode(v,f) -> v::(bfw_forest f);;
       

let t = MNode(1,Forest
      (MNode(2,EmptyForest),
      Forest(MNode(7,EmptyForest),
      Forest(MNode(8,EmptyForest),EmptyForest))));;

let t2 = MNode(1,Forest
      (MNode(2,Forest(
                  MNode(3, Forest(
                        MNode(4,EmptyForest),
                        EmptyForest)),EmptyForest
      )),
      Forest(MNode(5,EmptyForest),
      Forest(MNode(6,Forest(
                  MNode(7,Forest(
                        MNode(8,EmptyForest),
                        EmptyForest)),EmptyForest
      )),EmptyForest))));;



let f1 = Forest
      (MNode(2,Forest(
                  MNode(3, Forest(
                        MNode(4,EmptyForest),
                        EmptyForest)),EmptyForest
      )),
      Forest(MNode(5,EmptyForest),
      Forest(MNode(6,Forest(
                  MNode(7,Forest(
                        MNode(8,EmptyForest),
                        EmptyForest)),EmptyForest
      )),EmptyForest)));;