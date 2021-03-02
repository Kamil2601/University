fun x -> x + 0;; (* funkcja int -> int *)
let rec f x = f x;; (* wyrażenie 'a -> 'b *)
fun f g x -> f (g x);;
