let palindrome xs =
  let rec aux l1 l2 = 
    match l1, l2 with
    [], _ -> failwith "error"
    | _, [] -> (l1, true)
    | z::zs, [x] -> (zs, true)
    | z::zs, v::vs ->
        let rest, pal = aux zs (List.tl vs) in
        List.tl rest, (z = List.hd rest) && pal in
        match xs with
        | [] -> true
        | _ -> snd (aux xs xs);;


open Printf;;
printf "%b\n" (palindrome [1;2;3;1]);;
printf "%b\n" (palindrome []);;
printf "%b\n" (palindrome [1;2;3;2;1]);;
printf "%b\n" (palindrome [1;2;3;4;2;1]);;