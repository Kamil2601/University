open Printf;;

let rec fix f x  = f (fix f) x;;
let fact = fix ( fun f -> fun n -> if n = 0 then 1 else n * (f(n-1)));;

(*wersja bez 'let rec' z pętlą*)
let fact2 n = 
  let res = ref 1 in 
    for i=1 to n do 
      res := !res * i;
    done;
    !res;;

(*wersja bez 'let rec' bez pętli*)
let fact3 n =
  let acc = ref (fun x -> x) in
  let fact_aux n =
      if n = 0
          then 1
          else n * (!acc (n-1))
  in acc := fact_aux;
  !acc n


let fix2 f =
  let f' = ref (fun _ -> assert false) in
  let fix_aux f n = f (!f' f) n
  in f' := fix_aux;
  !f' f;;


let fact4 = fix2 ( fun f -> fun n -> if n = 0 then 1 else n * (f(n-1)));;

printf " fact: %d %d %d %d %d %d\n" (fact 1) (fact 2) (fact 3) (fact 4) (fact 5) (fact 6);;
printf "fact2: %d %d %d %d %d %d\n" (fact2 1) (fact2 2) (fact2 3) (fact2 4) (fact2 5) (fact2 6);;
printf "fact3: %d %d %d %d %d %d\n" (fact3 1) (fact3 2) (fact3 3) (fact3 4) (fact3 5) (fact3 6);;
printf "fact4: %d %d %d %d %d %d\n" (fact4 1) (fact4 2) (fact4 3) (fact4 4) (fact4 5) (fact4 6)