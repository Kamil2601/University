#lang racket
;; arithmetic expressions

(define (const? t)
  (number? t))

(define (binop? t)
       (member t '(+ - * /)))

(define (op->proc op)
  (cond [(eq? op '+) +]
        [(eq? op '-) -]
        [(eq? op '*) *]
        [(eq? op '/) /]))

(define (binop-op e)
  (car e))

(define (binop-left e)
  (cadr e))

(define (binop-right e)
  (caddr e))

(define (binop-cons op l r)
  (list op l r))

(define (arith-expr? t)
  (or (const? t)
      (and (binop? t)
           (arith-expr? (binop-left  t))
           (arith-expr? (binop-right t)))))

(define (arith->rpn expr)
  (if (const? expr)
      (list expr)
      (append (arith->rpn (binop-left expr)) (arith->rpn (binop-right expr)) (list (binop-op expr)))))

(define (stack? s)
  (list? s))

(define (empty? s)
  (null? s))

(define (push s x)
  (cons x s))

(define (pop s)
  (if (empty? s)
      (error "empty stack")
      (list (car s) (cdr s))))

(define s '(1 2 3))



(define (eval-rpn e)
  (define (eval e s)
    (cond [(null? e) (car s)]
          [(const? (car e)) (eval (cdr e) (push s (car e)))]
          [(binop? (car e)) (let* ((pop1 (pop s))
                                   (c1 (car pop1))
                                   (pop2 (pop (cadr pop1)))
                                   (c2 (car pop2))
                                   (s1 (cadr pop2))
                                   (s2 (push s1 ((op->proc (car e)) c2 c1))))
                              (eval (cdr e) s2))]))
  (eval e '()))
                             
(eval-rpn (arith->rpn '(+ (- 2 3) (* 4 7))))

(eval-rpn '(9 3 /))