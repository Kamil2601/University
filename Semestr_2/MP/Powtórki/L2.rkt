#lang racket
(define (compose f g)
  (lambda (x)
    (g (f x))))

(define (f1 x)
  (+ 2 x))

(define (f2 x)
  (* x x))



(define (identity x) x)

(define (repeated p n)
  (if (= n 0)
      identity
      (compose p (repeated p (- n 1)))))



