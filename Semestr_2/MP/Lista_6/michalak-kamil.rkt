#lang racket

(define (const? t)
  (number? t))

(define (binop? t)
  (and (list? t)
       (= (length t) 3)
       (member (car t) '(+ - * /))))

(define (binop-op e)
  (car e))

(define (binop-left e)
  (cadr e))

(define (binop-right e)
  (caddr e))

(define (binop-cons op l r)
  (list op l r))

(define (op->proc op)
  (cond [(eq? op '+) +]
        [(eq? op '*) *]
        [(eq? op '-) -]
        [(eq? op '/) /]))

(define (let-def? t)
  (and (list? t)
       (= (length t) 2)
       (symbol? (car t))))

(define (let-def-var e)
  (car e))

(define (let-def-expr e)
  (cadr e))

(define (let-def-cons x e)
  (list x e))

(define (let? t)
  (and (list? t)
       (= (length t) 3)
       (eq? (car t) 'let)
       (let-def? (cadr t))))

(define (let-def e)
  (cadr e))

(define (let-expr e)
  (caddr e))

(define (let-cons def e)
  (list 'let def e))

(define (var? t)
  (symbol? t))

(define (var-var e)
  e)

(define (var-cons x)
  x)

(define (hole? t)
  (eq? t 'hole))

(define (arith/let/holes? t)
  (or (hole? t)
      (const? t)
      (and (binop? t)
           (arith/let/holes? (binop-left  t))
           (arith/let/holes? (binop-right t)))
      (and (let? t)
           (arith/let/holes? (let-expr t))
           (arith/let/holes? (let-def-expr (let-def t))))
      (var? t)))

(define (num-of-holes t)
  (cond [(hole? t) 1]
        [(const? t) 0]
        [(binop? t)
         (+ (num-of-holes (binop-left  t))
            (num-of-holes (binop-right t)))]
        [(let? t)
         (+ (num-of-holes (let-expr t))
            (num-of-holes (let-def-expr (let-def t))))]
        [(var? t) 0]))

(define (arith/let/hole-expr? t)
  (and (arith/let/holes? t)
       (= (num-of-holes t) 1)))

(define (add vars v)
  (define (iter l)
    (cond [(null? l) (append vars (list v))]
          [(eq? (car l) v) vars]
          [else (iter (cdr l))]))
  (iter vars))

(define (hole-context e)
  (define (iter e result)
    (cond [(hole? e) result]
          [(binop? e)
          (let ([l (num-of-holes (binop-left e))]
                [r (num-of-holes (binop-right e))])
            (if (= l 0)
                (iter (binop-right e) result)
                (iter (binop-left e) result)))]
          [(let? e)
          (if (= (num-of-holes (let-def-expr (let-def e))) 1)
              (iter (let-def-expr (let-def e)) result)
              (iter (let-expr e) (add result (let-def-var (let-def e)))))]
          [else result]))
  (iter e '()))

 
(define (test)
  (define (compare l1 l2)
    (define (find v l)
      (define (iter l)
        (if (null? l)
            false
            (if (eq? v (car l))
                true
                (iter (cdr l)))))
      (iter l))
    (define (iter l1 l2)
      (if (null? l1)
          true
          (if (not (find (car l1) l2))
              false
          (iter (cdr l1) l2))))
    (if (not (= (length l1) (length l2)))
             false
             (iter l1 l2)))
  (let ((l1 (hole-context '(let (x 3) hole)))
        (l1c '(x))
        (l2 (hole-context '(+ x hole)))
        (l2c '())
        (l3 (hole-context '(let (x hole) (+ x a))))
        (l3c '())
        (l4 (hole-context '(+ (let (x 4) (let (y 7) (+ x y))) (let (a 3) (let (b 1) (+ a hole))))))
        (l4c '(a b))
        (l5 (hole-context '(* (+ (let (x (let (y 3) (+ (let (z 42) (* hole z)) 7))) (* x x)) 3) 1)))
        (l5c '(y z)))
    (list (compare l1 l1c) (compare l2 l2c) (compare l3 l3c) (compare l4 l4c) (compare l5 l5c))


  ))
