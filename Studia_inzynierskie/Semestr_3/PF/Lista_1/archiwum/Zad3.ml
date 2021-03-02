let compose f g = fun x -> f (g x);;
let id x = x;;
let function_1 x = 2*x;;
let function_2 x = x+1;;
print_int ((compose function_1 function_2) 3);;
print_string "\n";;
let rec repeat n f = if n=0 then id else  (compose (repeat (n-1) f) f);;
print_int ((repeat 10 function_1) 2);;
print_string "\n";;
compose
let rec multiply a b = repeat (a-1) (fun x -> (+) b x) b;;
print_int (multiply 3 10);;
print_string "\n";;
let (@@) a b = a * b;;
let rec power a b = repeat (b-1) (fun x -> (@@) a x) a;;
print_int (power 2 10);;
print_string "\n";;