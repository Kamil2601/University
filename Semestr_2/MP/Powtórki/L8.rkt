#lang racket

(define (lcons x f)
  (cons x f))

(define (lhead l)
  (car l))

(define (ltail l)
  ((cdr l)))

(define (nats-from m)
  (lcons
   m
   (lambda () (nats-from (+ m 1)))))

(define nats
  (nats-from 0))

(define (fib-from a b)
  (lcons
   b
   (lambda () (fib-from b (+ a b)))))

(define fib
  (fib-from 0 1))

(define (int-from x)
  (lcons
   x
   (lambda ()
     (int-from
      (cond [(= x 0) 1]
            [(> x 0) (* x (- 1))]
            [else (+ (* x (- 1)) 1)])))))
         

(define int
  (int-from 0))

(define (take n l)
  (if (or (null? l) (= n 0))
      null
      (cons (lhead l)
            (take (- n 1) (ltail l)))))

(define (filter p l)
  (cond [(null? l) null]
        [(p (lhead l))
         (lcons (lhead l)
                (lambda ()
                  (filter p (ltail l))))]
        [else (filter p (ltail l))]))

(define (prime? n)
  (define (div-by m)
    (cond [(= m n) true]
          [(= (modulo n m) 0) false]
          [else (div-by (+ m 1))]))
  (if (< n 2)
      false
      (div-by 2)))