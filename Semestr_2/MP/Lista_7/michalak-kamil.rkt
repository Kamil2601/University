#lang racket

;; expressions

(define (const? t)
  (number? t))

(define (op? t)
  (and (list? t)
       (member (car t) '(+ - * /))))

(define (op?? t)
  (list? (op? t)))

(define (op-op e)
  (car e))

(define (op-args e)
  (cdr e))

(define (op-cons op args)
  (cons op args))

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

(define (arith/let-expr? t)
  (or (const? t)
      (and (op? t)
           (andmap arith/let-expr? (op-args t)))
      (and (let? t)
           (arith/let-expr? (let-expr t))
           (arith/let-expr? (let-def-expr (let-def t))))
      (var? t)))

;; let-lifted expressions

(define (arith-expr? t)
  (or (const? t)
      (and (op? t)
           (andmap arith-expr? (op-args t)))
      (var? t)))

(define (let-lifted-expr? t)
  (or (and (let? t)
           (let-lifted-expr? (let-expr t))
           (arith-expr? (let-def-expr (let-def t))))
      (arith-expr? t)))

;; generating a symbol using a counter

(define (number->symbol i)
  (string->symbol (string-append "x" (number->string i))))

;; environments (could be useful for something)

(define empty-env
  null)

(define (add-to-env x v env)
  (append env (list (list x v))))

(define (find-in-env x env)
  (cond [(null? env) false]
        [(eq? x (caar env)) (cadar env)]
        [else (find-in-env x (cdr env))]))

(define (def l)
  (car l))

(define (expr l)
  (cdr l))

(define (add-def sym val l)
  (append (append (def l) (list (cons (sym val)))) (expr l)))


(define (make-list e op i)
  (define (iter l i defs exprs)
    (if (null? l)
        (append (list defs) (list (append (list op) exprs)) (list i))
        (let* ((new (make-def (let-list-defs (car l)) i))
               (new-defs (car new))
               (new-env (cadr new))
               (new-i (caddr new))
              (new-exprs (new-symbols (let-list-expr (car l)) new-env)))
          (iter (cdr l) new-i (append defs new-defs) (append exprs (list new-exprs))))))
  (iter e i '() '()))

(define (make-def e i)
  (define (iter l i defs env)
    (if (null? l)
        (list defs env i)
        (let* ((var (let-def-var (car l)))
               (expr (let-def-expr (car l)))
               (new-def (list (number->symbol i) expr))
               (to-env (list var (number->symbol i))))
          (iter (cdr l) (+ i 1)
                (append defs (list new-def)) (append env (list to-env))))))
  (iter e i '() '()))
        
  
    

(define (new-def def i)
  (cons (number->symbol i) (let-def-var def)))

(define (new-expr expr osym nsym)
  (define (rek t result)
    (cond [(null? t) result]
          [(op?? t)
           (let ((new (map (lambda (x)
                             (if (eq? x osym) nsym x)) t)))
             (append result new))]))
    (rek expr '()))
           

(define (let-list def-list expr i)
  (list def-list expr i))

(define (let-list-defs l)
  (car l))

(define (let-list-expr l)
  (cadr l))

(define (let-list-counter l)
  (caddr l))

(define (old-sym p)
  (car p))

(define (new-sym p)
  (cdr p))

(define (new-symbols e env)
  (define (change-sym s)
   (let ((new (find-in-env s env)))
     (if (symbol? new)
         new
         s)))
  (cond [(symbol? e) (change-sym e)]
        [(list? e) (map (lambda (x) (new-symbols x env)) e)]
        [else e]))




;; the let-lift procedure

(define (let-lift e)
  (define (lift-rek e env i)
   (cond [(arith-expr? e)
          (let ((new-expr (new-symbols e env)))
            (list '() new-expr i))]
         [(let? e)
          (let* ((def-expr (lift-rek
                            (let-def-expr (let-def e)) env i))
                 (s (let-def-var (let-def e)))
                 (new-counter (let-list-counter def-expr))
                 (new-def-list (append (let-list-defs def-expr)
                                       (list (list (number->symbol new-counter)
                                                   (let-list-expr def-expr)))))
                 (new-env (add-to-env s (number->symbol new-counter) env))
                 (new-expr (lift-rek (let-expr e) new-env (+ new-counter 1))))
            (list (append new-def-list (let-list-defs new-expr))
                  (let-list-expr new-expr)  (let-list-counter new-expr)))]
         [(op?? e)
          (let ((mapped
                 (map (lambda (x) (lift-rek x env i)) (cdr e))))
            (make-list mapped (op-op e) i))]))

  (define (add-let defs expr)
    (if (null? defs)
        expr
        (append '(let) (cons (car defs) (list (add-let (cdr defs) expr))))))


  (let* ((res (lift-rek e '() 1)))
         (add-let (let-list-defs res) (let-list-expr res))))
  

;;TESTY
(let-lift '(let (x (let (y 3) (+ y y))) (+ x x)))
(let-lift '(+ x 2))
(let-lift '(let (x (let (y 3) (+ y 5))) (+ (let (z 6) (* z 2)) 5)))
(let-lift '(let (x (* (+ 2 4) (- c 1))) (- (let (y (let (z 12) (+ z 4))) (* 2 y)) (let (y 34) y))))
(let-lift '(let (x (let (x (let (x 1) (+ x 1))) (+ x 1))) (+ x 1)))
(let-lift '(+ (let (x a) (+ x (let (y b) y))) (let (x 13) x)))
(let-lift 'x)
(let-lift '(+ (let (x 3) x) (let (x 4) x) (let (x 5) x)))
(let-lift '(let (x a) x))
(let-lift '(let (x y) (+ x (let (y 3) y))))
(let-lift '(- (let (a (let (b 3) (+ b 1))) (- a 1)) (let (x (let (y 3) (+ y 1))) (* x 17))))
(let-lift '2)
(let-lift '(let (x4 (let (x5 (let (x6 a) (+ x6 1))) (+ x5 1))) (+ x4 1)))





  