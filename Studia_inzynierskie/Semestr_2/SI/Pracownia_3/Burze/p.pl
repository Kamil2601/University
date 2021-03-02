:- use_module(library(clpfd)).
solve([A,B,C]) :-
    A in 0..1, B in 0..1, C in 0..1,
    A #= 1,
    #\  B #= 1 #\/ A #= 1 #\/ C #= 1,
    labeling([ff], [A,B,C]).
:- solve(X), write(X), nl.
