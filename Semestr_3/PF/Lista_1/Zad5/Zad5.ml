let ctrue = fun x y -> x;;
let cfalse = fun x y -> y;;
let cand = fun f g -> if (f true false) && (g true false) then ctrue else cfalse;;
let cor = fun f g -> if (f true false) || (g true false) then ctrue else cfalse;;
let cbool_of_bool = fun b -> if b = true then ctrue else cfalse;;
let bool_of_cbool = fun cb -> (cb true false);;

open Printf;;
printf("%b\n") (bool_of_cbool (cor ctrue ctrue));;
printf("%b\n") (bool_of_cbool (cor ctrue cfalse));;
printf("%b\n") (bool_of_cbool (cor cfalse cfalse));;
printf("%b\n") (bool_of_cbool (cand cfalse cfalse));;
printf("%b\n") (bool_of_cbool (cand ctrue cfalse));;
printf("%b\n") (bool_of_cbool (cor ctrue ctrue));;