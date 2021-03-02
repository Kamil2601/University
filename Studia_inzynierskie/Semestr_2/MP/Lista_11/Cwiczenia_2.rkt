#lang typed/racket

(: prefixes (All (A) (-> (Listof A) (Listof A))))
(define (prefixes l)
  (: iter (All (A) (-> (Listof A) (Listof A) (Listof A))))
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l) (append l res))))
  (iter l '()))
