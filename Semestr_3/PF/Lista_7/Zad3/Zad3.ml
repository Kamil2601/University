type ('a,'b) memo = Memo of ('a * 'b) list;;

let init_array = ref (Memo([]));; 


let find_result arg results = 
  let rec find x vals = 
    match vals with
    [] -> None
    | (a,b)::tl -> if a = x 
                  then Some b
                  else (find x tl)
  in match !results with
      Memo(xs) -> find arg xs;;

let add_result arg res results = 
  match !results with
  Memo(xs) -> results := Memo((arg, res)::xs);;

let fib_memo_call_table = init_array


let rec fib_memo n = 
  match n with
  0 -> 0
  | 1 -> 1
  | n -> match find_result n fib_memo_call_table with
        None ->
          let res = fib_memo (n-1) + fib_memo(n-2) in 
          add_result n res fib_memo_call_table;
          res
        | Some res -> res;;

open Printf;;

printf "%d %d %d %d %d %d\n" (fib_memo 1) (fib_memo 2) (fib_memo 3) (fib_memo 4) (fib_memo 5) (fib_memo 6);;

printf "Fib_memo 100: %d\n" (fib_memo 100);;

printf "Fib_memo 1000: %d\n" (fib_memo 1000);;

printf "Fib_memo 5000: %d\n" (fib_memo 5000);;

(*czas wykonania programu: 0.2 s*)