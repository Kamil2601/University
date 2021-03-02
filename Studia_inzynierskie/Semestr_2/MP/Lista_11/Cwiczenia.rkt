#lang racket

(define/contract (suffixes l)
  (let ([a (new-∀/c 'a)])
    (-> (listof a) (listof (listof a))))
  (define (iter l res)
    (if (null? l)
        (cons '() res)
        (iter (cdr l) (cons l res))))
  (iter l '()))

(define/contract (dist x y)
  (-> number? number? number?)
  (abs (- x y)))

(define/contract (average x y)
  (-> number? number? number?)
  (/ (+ x y) 2))

(define/contract (square x)
  (-> number? number?)
  (* x x))

(define (ok? x)
  (lambda (n) (<= (dist x (* n n)) 0.0001)))
 
(define/contract (sqrt x)
  (->i ([x positive?])
       [result (x) (and/c number? (ok? x))])
  ;; lokalne definicje
  ;; poprawienie przybliżenia pierwiastka z x
  (define (improve approx)
    (average (/ x approx) approx))
  ;; nazwy predykatów zwyczajowo kończymy znakiem zapytania
  (define (good-enough? approx)
    (< (dist x (square approx)) 0.0001))
  ;; główna procedura znajdująca rozwiązanie
  (define (iter approx)
    (cond
      [(good-enough? approx) approx]
      [else                  (iter (improve approx))]))
  
  (iter 1.0))

(define/contract (filter pred l)
  (let ([a (new-∀/c 'a)])
   (-> (-> a boolean?) (listof a) (listof a)))
  (define (iter l res)
    (cond [(null? l) res]
          [(pred (car l)) (iter (cdr l) (append res (list (car l))))]
          [else (iter (cdr l) res)]))
  (iter l '()))

(define (find x l)
  (if (null? l)
      false
      (if (eq? (car l) x)
          true
          (find x (cdr l)))))

(define (check x pred)
  (define (check1 l)
    (if (null? l)
        true
        (if (pred (car l))
            (check1 (cdr l))
            false)))
  (define (check2 arg res)
    (if (null? arg)
        true
        (if (and (pred (car arg))
                 (not (find (car arg) res)))
            false
            (check2 (cdr arg) res))))
  (lambda (n) (and (check1 n)
                   (check2 n x))))

(define/contract (filter2 pred l)
  (let ([a (new-∀/c 'a)])
   (->i ([pred (-> a boolean?)] [l (listof a)])
        [result (pred l) (and/c (listof a) (check l pred))]))
  (define (iter l res)
    (cond [(null? l) res]
          [(pred (car l)) (iter (cdr l) (append res (list (car l))))]
          [else (iter (cdr l) res)]))
  (iter l '()))

( define-signature monoid^
   (( contracted
      [elem? (-> any/c boolean?)]
      [neutral elem?]
      [oper (-> elem? elem? elem?) ])))

(require quickcheck)

(define-unit monoid-int@
  (import)
  (export monoid^)
  
  (define (elem? x)
    (integer? x))
  
  (define neutral 0)
  
  (define (oper x y)
    (+ x y))

  (quickcheck
   (property
    ([x arbitrary-integer])
    (and (equal? (oper x neutral) x)
         (equal? (oper neutral x) x))))

  (quickcheck
   (property
    ([x arbitrary-integer]
     [y arbitrary-integer]
     [z arbitrary-integer])
    (equal? (oper x (oper y z)) (oper (oper x y) z)))))

(define-unit monoid-list@
  (import)
  (export monoid^)

  (define elem? list?)

  (define neutral null)

  (define oper append)


  (quickcheck
   (property
    ([l (arbitrary-list arbitrary-integer)])
    (and (equal? (oper l neutral) l)
         (equal? (oper neutral l) l))))

  (quickcheck
   (property
    ([l1 (arbitrary-list arbitrary-integer)]
     [l2 (arbitrary-list arbitrary-integer)]
     [l3 (arbitrary-list arbitrary-integer)])
    (equal? (oper l1  (oper l2 l3)) (oper (oper l1 l2) l3)))))

(invoke-unit monoid-list@)
(invoke-unit monoid-int@)







