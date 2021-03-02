#lang racket

(define (reverse xs)
  (if (null? xs)
      xs
      (append (reverse (cdr xs)) (list (car xs)))))


(reverse '(1 2 3 4 5))

(define (insert xs n)
  (define (iter begin end)
    (cond [(null? end) (append begin (list n))]
          [(> (car end) n) (append begin (list n) end)]
          [else (iter (append begin (list (car end))) (cdr end))]))
  (iter '() xs))

(define (insert-sort xs)
  (define (iter sorted l)
    (if (null? l)
        sorted
        (iter (insert sorted (car l)) (cdr l))))
  (iter '() xs))

(insert '(1 2 4 5) 6)

(insert-sort '(1 5 2 12 24 17 1 0 3 5))

(define (ins-n x l n)
  (define (iter i begin end)
    (if (= i n)
        (append begin (list x) end)
        (iter (+ i 1) (append begin (list (car end))) (cdr end))))
  (iter 0 '() l))

(define (make-insert x l)
  (define (iter n res)
    (if (< n 0)
        res
        (iter (- n 1) (cons (ins-n x l n) res))))
  (iter (length l) '()))

(define (inserts x l)
    (define (iter l res)
      (if (null? l)
          res
          (iter (cdr l) (append (make-insert x (car l)) res))))
  (iter l '()))

(define (permi l)
  (if (null? l)
      '(())
      (let ((cdr-perm (permi (cdr l))))
        (inserts (car l) cdr-perm))))