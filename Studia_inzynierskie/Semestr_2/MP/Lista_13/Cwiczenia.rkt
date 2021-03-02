#lang racket



(define (make-cycle l)
  (define (iter l1 l2)
    (if (null? (mcdr l2))
        (begin
          (set-mcdr! l2 l1)
          l)
        (iter l1 (mcdr l2))))
  (if (null? l)
      l
      (iter l l)))

(define (has-cycle l)
  (define (cycle-from l1 l2)
    (cond [(null? l2) false]
          [(eq? (mcdr l2) l1) true]
          [else (cycle-from l1 (mcdr l2))]))
  (define (find-cycle l)
    (define (iter l1 l2)
      (if (null? l1)
          false
          (if (cycle-from l1 l2)
              true
              (iter (mcdr l1) (mcdr l2)))))
    (iter l l))
  (if (null? l)
      false
      (find-cycle l)))

(define (has-cycle2 l)
  (define (iter l1 l2)
     (cond [(eq? l1 l2) true]
           [(or (null? l1)
                (null? l2)
                (null? (mcdr l2))) false]
           [else (iter (mcdr l1) (mcdr (mcdr l2)))]))
  (if (null? l)
      false
      (iter l (mcdr l))))
#|
(define l (mcons 1 (mcons 2 (mcons 3 (mcons 4 null)))))
(has-cycle l)
(make-cycle l)
(has-cycle l)
(define l2 (mcons 1 (make-cycle (mcons 2 (mcons 3 null)))))
l2
(has-cycle2 (mcons 0 (make-cycle (mcons 1 null))))|#

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (wrong-password amount)
    "wrong password")
  (define (dispatch m p)
    (cond ((eq? m 'withdraw)
           (if (eq? p password)
               withdraw
               wrong-password))
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)


(define (make-monitored f)
  (define n 0)
  (define proc
    (lambda args (begin
                   (set! n (+ n 1))
                   (apply f args))))
  (define (options command)
    (cond [(eq? command 'how-many) n]
          [(eq? command 'reset) (set! n 0)]))
  (cons proc options))

(define p (make-monitored +))

(define (bucket-sort l)
  (define (find-max l)
    (define (iter max l)
      (if (null? l)
          max
          (let ([el (car (car l))])
            (if (> el max)
                (iter el (cdr l))
                (iter max (cdr l))))))
    (if (null? l)
        0
        (iter (car (car l)) l)
        ))
  (define (sort l vec)
    (if (null? l)
        vec
        (let ((pos (car (car l))))
          (vector-set! vec pos (append (vector-ref vec pos) (list (car l))))
          (sort (cdr l) vec))))
  (define (vec->list vec size)
    (define (add res l)
      (if (null? l)
          res
          (add (append res (list (car l))) (cdr l))))
    (define (iter i res)
      (if (>= i size)
          res
          (iter (+ i 1) (add res (vector-ref vec i)))))
    (iter 0 '()))
  (define vec-size (+ 1 (find-max l)))
  (define vec (make-vector vec-size))
  (vector-fill! vec '())
  (if (null? l)
      l
      (begin
        (vec->list (sort l vec) vec-size))))
           
(define vec (make-vector 3))
(vector-fill! vec '())
(vector-ref vec 2)
(vector-set! vec 2 (append (vector-ref vec 2) (list 1)))
(vector-ref vec 2)

