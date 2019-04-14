module type VERTEX =
  sig
    type t
    type label
    val equal : t -> t -> bool
    val create : label -> t
    val label : t -> label
  end;;


module type EDGE = 
  sig
    type vertex
    type t
    type label
    
    val equal : t -> t -> bool
    val create : vertex -> vertex -> label -> t
    val label : t -> label
    val v_begin : t -> vertex
    val v_end : t -> vertex
  end;;

module Vertex (Label : sig type t end) : VERTEX with type label = Label.t =
  struct
    type label = Label.t
    type t = V of label

    let equal v1 v2 = v1 = v2
    let create lb = V(lb)
    let label (V(lb)) = lb
  end


module Edge (Label : sig type t end) (Vertex : VERTEX) : EDGE with type label = Label.t and type vertex = Vertex.t = 
  struct
    type label = Label.t
    type vertex = Vertex.t
    type t = E of label * vertex * vertex
    let equal e1 e2 = e1 = e2
    let create v_b v_e lb = E(lb,v_b,v_e)
    let label (E(lb,_,_)) = lb
    let v_begin (E(_,v_b,_)) = v_b
    let v_end (E(_,_,v_e)) = v_e
  end


module type GRAPH =
  sig
    (* typ reprezentacji grafu *)
    type t
    module V : VERTEX
    type vertex = V.t
    module E : EDGE with type vertex = vertex
    type edge = E.t
    (* funkcje wyszukiwania *)
    val mem_v : t -> vertex -> bool
    val mem_e : t -> edge -> bool
    val mem_e_v : t -> vertex -> vertex -> bool
    val find_e : t -> vertex -> vertex -> edge
    val succ : t -> vertex -> vertex list
    val pred : t -> vertex -> vertex list
    val succ_e : t -> vertex -> edge list
    val pred_e : t -> vertex -> edge list
    (* funkcje modyfikacji *)
    val empty : t
    val add_e : t -> edge -> t
    val add_v : t -> vertex -> t
    val rem_e : t -> edge -> t
    val rem_v : t -> vertex -> t
    (* iteratory *)
    val fold_v : ( vertex -> 'a -> 'a ) -> t -> 'a -> 'a
    val fold_e : ( edge -> 'a -> 'a ) -> t -> 'a -> 'a
  end 


module Graph (Ve : VERTEX) (Ed : EDGE with type vertex=Ve.t) : GRAPH with module V = Ve and module E = Ed =
  struct
    module V = Ve
    module E = Ed
    type vertex = V.t
    type edge = E.t
    type t = G of vertex list * edge list
    
    let mem_v (G(v_l,_)) v = List.mem v v_l
    let mem_e (G(_,e_l)) e = List.mem e e_l
    let mem_e_v (G(_,e_l)) vb ve = 
      let rec aux l = 
        (match l with
        [] -> false
        | (edge1)::tl ->
            if vb = (E.v_begin edge1) && ve = (E.v_end edge1) then true else (aux tl))
      in aux e_l
    let find_e (G(_,e_l)) vb ve =
      let rec aux l = 
        (match l with
        [] -> failwith "Edge doesn't exist"
        | (edge1)::tl ->
            if vb = (E.v_begin edge1) && ve = (E.v_end edge1) then edge1 else (aux tl))
      in aux e_l
    
    let succ (G(_,e_l)) v = 
      let rec aux l res = 
        match l with
        [] -> res
        | ed::tl -> if (E.v_begin ed)=v then (aux tl ((E.v_end ed)::res)) else (aux tl res)
      in aux e_l []

    let pred (G(_,e_l)) v = 
      let rec aux l res = 
        match l with
        [] -> res
        | ed::tl -> if (E.v_end ed)=v then (aux tl ((E.v_begin ed)::res)) else (aux tl res)
      in aux e_l []
      
    let succ_e (G(_,e_l)) v = 
      let rec aux l res = 
        match l with
        [] -> res
        | ed::tl -> if (E.v_begin ed)=v then (aux tl (ed::res)) else (aux tl res)
      in aux e_l []

    let pred_e (G(_,e_l)) v = 
      let rec aux l res = 
        match l with
        [] -> res
        | ed::tl -> if (E.v_end ed)=v then (aux tl (ed::res)) else (aux tl res)
      in aux e_l []

    let empty = G([],[])
    
    let add_e (G(v_l,e_l)) e =
      if (List.mem (E.v_begin e) v_l) && (List.mem (E.v_end e) v_l)
        then G(v_l,e::e_l) else failwith "vertex doesn't exist";;
    let add_v (G(v_l,e_l)) v = G((v::v_l,e_l))
    let rem_e (G(v_l,e_l)) e =
      let rec aux l = 
        match l with
        [] -> []
        | e1::tl -> if e=e1 then tl else e1::(aux tl)
      in G(v_l,(aux e_l))

    let rem_v (G(v_l,e_l)) v = 
      let rec aux1 l = 
        (match l with
        [] -> []
        | v1::tl -> if v1=v then tl else v1::(aux1 tl)) in
      let rec aux2 l = 
        match l with
        [] -> []
        | e::tl -> if (E.v_begin e)=v || (E.v_end e)=v then (aux2 tl) else e::(aux2 tl)
      in G((aux1 v_l),(aux2 e_l)) 

    let fold_v f (G(v_l,e_l)) start = 
      let rec aux l value = 
        match l with
        [] -> value
        | v::tl -> (aux tl (f v value))
      in aux v_l start

    let fold_e f (G(v_l,e_l)) start = 
      let rec aux l value = 
        match l with
        [] -> value
        | e::tl -> (aux tl (f e value))
      in aux e_l start
  end



  
module Vertex_int = Vertex(struct type t = int end);;

module Edge_int = Edge (struct type t = int end) (Vertex_int);;

module Graph_int = Graph(Vertex_int) (Edge_int);;

open Printf;;

let print_vertex_int v = printf "V(%d)" (Vertex_int.label v);;

let print_edge_int e = (printf "E[%d: " (Edge_int.label e));
  (print_vertex_int (Edge_int.v_begin e)); (print_vertex_int (Edge_int.v_begin e));
  (printf " -> "); (print_vertex_int (Edge_int.v_begin e)); (printf "]");;


let gr = Graph_int.empty;;
let v1 = Vertex_int.create 1;;

print_vertex_int v1;;

let gr = Graph_int.add_v gr v1;;


