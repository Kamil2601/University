module type PQUEUE =
  sig
    type priority
    type 'a t
    exception EmptyPQueue
    val empty : 'a t
    val insert : 'a t -> priority -> 'a -> 'a t
    val remove : 'a t -> priority * 'a * 'a t
  end


module type ORDTYPE =
  sig
    type t
    type comparison = LT | EQ | GT
    val compare : t -> t -> comparison
end

module PQueue (OrdType: ORDTYPE) : PQUEUE with type priority = OrdType.t = 
  struct
    type priority = OrdType.t
    type 'a t = EmptyPQ | Insert of ('a * priority) * 'a t
    exception EmptyPQueue

    let empty = EmptyPQ

    let rec insert queue pr el = 
      match queue with 
      EmptyPQ -> Insert((el, pr), EmptyPQ)
      | Insert((el1,pr1),tl) ->
        if (OrdType.compare pr pr1) == OrdType.GT then Insert((el,pr),queue)
        else Insert((el1,pr1),(insert tl pr el))

    let remove queue =
      match queue with
      EmptyPQ -> raise EmptyPQueue
      | Insert((el,pr),tl) -> (pr,el,tl)
  end

module OrdType_int : ORDTYPE with type t = int = 
  struct
    type t = int
    type comparison = LT | EQ | GT

    let compare a b = 
      if a < b then LT
      else if a = b then EQ
      else GT
  end

module PQueue_int = PQueue(OrdType_int);;


let list_to_pq xs = 
  let rec aux q l = 
    match l with
    [] -> q
    | x::tl -> aux (PQueue_int.insert q x x) tl
  in aux (PQueue_int.empty) xs;;

let pq_to_list pq = 
  let rec aux pq res = 
    if pq = PQueue_int.empty then res
    else let (pr, el, tl) = (PQueue_int.remove pq) in (aux tl (el::res))
  in aux pq [];;

let pq_sort xs = pq_to_list (list_to_pq xs);;
open Printf;;

let print_list xs = printf "[ "; List.iter (printf "%d; ") xs; printf "]\n" 

let sort (type a) (ord : (module ORDTYPE with type t = a)) (xs : a list) =
  let (module OrdType) = ord
  in let (module Queue) = 
      (module PQueue (OrdType) : PQUEUE with type priority = OrdType.t)
  in let rec to_queue xs =
      match xs with
      | [] -> Queue.empty
      | x::xs -> Queue.insert (to_queue xs) x x in
  let pq_to_list pq = 
    let rec aux pq res = 
      if pq = Queue.empty then res
      else let (pr, el, tl) = (Queue.remove pq) in (aux tl (el::res))
    in aux pq []
  in pq_to_list (to_queue xs);;

let l0 = pq_sort [5;2;5;1;7;2;5];;
let l1 = sort (module OrdType_int) [5;2;5;1;7;2;5];;

print_list l0;;
print_list l1;;