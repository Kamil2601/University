module type PQUEUE =
  sig
    type priority
    type 'a t
    exception EmptyPQueue
    val empty : 'a t
    val insert : 'a t -> priority -> 'a -> 'a t
    val remove : 'a t -> priority * 'a * 'a t
  end

module PQueue : PQUEUE with type priority=int = 
  struct
    type priority = int
    type 'a t = EmptyPQ | Insert of ('a * priority) * 'a t
    exception EmptyPQueue

    let empty = EmptyPQ
    let rec insert queue pr el = 
      match queue with 
      EmptyPQ -> Insert((el, pr), EmptyPQ)
      | Insert((el1,pr1),tl) ->
        if pr > pr1 then Insert((el,pr),queue)
        else Insert((el1,pr1),(insert tl pr el))

    let remove queue =
      match queue with
      EmptyPQ -> raise EmptyPQueue
      | Insert((el,pr),tl) -> (pr,el,tl)
  end

open Printf;;


let print_pq pq= 
  let rec aux pq = 
    if pq = PQueue.empty then printf "]\n"
    else
      let (pr, el, tl) = (PQueue.remove pq) in (printf "(%s, %d), " el pr); (aux tl)
  in printf "[ "; aux pq ;;

let q = PQueue.empty;;

let q = PQueue.insert q 5 "a";;

let q = PQueue.insert q 4 "b";;

let q = PQueue.insert q 6 "c";;

print_pq q;;

let pq = PQueue.insert(PQueue.insert PQueue.empty 1000 "kot") 2 "pies";;


let list_to_pq xs = 
  let rec aux q l = 
    match l with
    [] -> q
    | x::tl -> aux (PQueue.insert q x x) tl
  in aux (PQueue.empty) xs;;


let pq_to_list pq = 
  let rec aux pq res = 
    if pq = PQueue.empty then res
    else let (pr, el, tl) = (PQueue.remove pq) in (aux tl (el::res))
  in aux pq [];;

let pq_sort xs = pq_to_list (list_to_pq xs);;
