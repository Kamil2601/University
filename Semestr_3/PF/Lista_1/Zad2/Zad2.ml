let rec seq1 n = if n=0 then 0 else 2*seq1(n-1)+1;;
let rec seq_from i value n = if i=n then value else seq_from (i+1) (2*value+1) n;;
let seq2 n = seq_from 0 0 n;;
print_int (seq1 10);;
print_string "\n";;
print_int (seq2 10);;
print_string "\n";;
print_int (seq1 15);;
print_string "\n";;
print_int (seq2 15);;
print_string "\n";;
print_int (seq1 30);;
print_string "\n";;
print_int (seq2 30);;
print_string "\n";;
print_int (seq1 60);;
print_string "\n";;
print_int (seq2 60);;
print_string "\n";;