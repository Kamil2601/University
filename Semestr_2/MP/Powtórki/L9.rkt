#lang racket


;; pomocnicza funkcja dla list tagowanych o określonej długości

(define (tagged-tuple? tag len p)
  (and (list? p)
       (= (length p) len)
       (eq? (car p) tag)))

(define (tagged-list? tag p)
  (and (pair? p)
       (eq? (car p) tag)
       (list? (cdr p))))

;;
;; WHILE
;;

; memory

(define empty-mem
  null)

(define (set-mem x v m)
  (cond [(null? m)
         (list (cons x v))]
        [(eq? x (caar m))
         (cons (cons x v) (cdr m))]
        [else
         (cons (car m) (set-mem x v (cdr m)))]))

(define (get-mem x m)
  (cond [(null? m) 0]
        [(eq? x (caar m)) (cdar m)]
        [else (get-mem x (cdr m))]))

; arith and bools

(define (const? t)
  (number? t))

(define (op? t)
  (and (list? t)
       (member (car t) '(+ - * / = > >= < <= mod))))

(define (op-op e)
  (car e))

(define (op-args e)
  (cdr e))

(define (op->proc op)
  (cond [(eq? op '+) +]
        [(eq? op '*) *]
        [(eq? op '-) -]
        [(eq? op '/) /]
        [(eq? op '=) =]
        [(eq? op '>) >]
        [(eq? op '>=) >=]
        [(eq? op '<)  <]
        [(eq? op '<=) <=]
        [(eq? op 'mod) modulo]))

(define (var? t)
  (symbol? t))

(define (eval-arith e m)
  (cond [(var? e) (get-mem e m)]
        [(op? e)
         (apply
          (op->proc (op-op e))
          (map (lambda (x) (eval-arith x m))
               (op-args e)))]
        [(const? e) e]))

;;

(define (assign? t)
  (and (list? t)
       (= (length t) 3)
       (eq? (second t) ':=)))

(define (assign-var e)
  (first e))

(define (assign-expr e)
  (third e))

(define (if? t)
  (tagged-tuple? 'if 4 t))

(define (if-cond e)
  (second e))

(define (if-then e)
  (third e))

(define (if-else e)
  (fourth e))

(define (while? t)
  (tagged-tuple? 'while 3 t))

(define (while-cond t)
  (second t))

(define (while-expr t)
  (third t))

(define (block? t)
  (list? t))

(define (inc? t)
  (and (list? t)
       (= (length t) 2)
       (symbol? (first t))
       (eq? (second t) '++)))

(define (inc-var t)
  (car t))

(define (dec? t)
  (and (list? t)
       (= (length t) 2)
       (symbol? (first t))
       (eq? (second t) '--)))

(define (dec-var t)
  (car t))

(define (for? t)
  (and (tagged-tuple? 'for 5 t)
       (assign? (second t))
       (or (assign? (fourth t))
           (inc? (fourth t))
           (dec? (fourth t)))))

(define (for-start t)
  (cadr t))

(define (for-cond t)
  (caddr t))

(define (for-assign t)
  (cadddr t))

(define (for-expr t)
  (fifth t))

(define (eval-for t m)
  (define (iter t m)
    (if (eval-arith (for-cond t) m)
        (iter t (eval (for-assign t) (eval (for-expr t) m)))
        m))
  (iter t (eval (for-start t) m)))

;;

(define (eval e m)
  (cond
        [(assign? e)
         (set-mem
          (assign-var e)
          (eval-arith (assign-expr e) m)
          m)]
        [(if? e)
         (if (eval-arith (if-cond e) m)
             (eval (if-then e) m)
             (eval (if-else e) m))]
        [(while? e)
         (if (eval-arith (while-cond e) m)
             (eval e (eval (while-expr e) m))
             m)]
        [(for? e)
         (eval-for e m)]
        [(inc? e)
         (set-mem
          (inc-var e)
          (+ (eval-arith (inc-var e) m) 1)
          m)]
        [(dec? e)
         (set-mem
          (dec-var e)
          (- (eval-arith (dec-var e) m) 1)
          m)]
        [(block? e)
         (if (null? e)
             m
             (eval (cdr e) (eval (car e) m)))]))
        
        

(define (run e)
  (eval e empty-mem))

;;

(define fact10
  '( (i := 10)
     (r := 1)
     (while (> i 0)
       ( (r := (* i r))
         (i := (- i 1)) ))))

(define (computeFact10)
  (run fact10))

(define fib
  '( (i := 5)
     (a := 0)
     (b := 1)
     (c := 1)
     (while (> i 0)
            { (c := (+ a b))
              (a := b)
              (b := c)
              (i := (- i 1))})))

(define prime-sum
  '( (suma := 0)
     (i := 2)
     (n := 5)
     (a := 1)
     (pierwsza := 1)
     (while (> n 0)
            {(j := 2)
             (pierwsza := 1)
             (while (< j i)
                    {
                    ;(if (= (mod i j) 0)
                        ;(pierwsza := 0)
                        ;(a := 1))
                    
                     (pom := i)
                     (while (>= pom j)
                            (pom := (- pom j)))
                     (if (= pom 0)
                         {
                          (pierwsza := 0)
                          (j := i)
                          }
                    (j := (+ j 1)))})
             (if (= pierwsza 1)
                 {
                  (suma := (+ suma i))
                  (n := (- n 1))
                  (i := (+ i 1))
                  }
                  (i := (+ i 1))
                  )})))
(run prime-sum)
(define (find-vars prog)
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l) (append res (list (car (car l)))))))
  (let ((m (run prog)))
    (iter m '())))

(define xd  '{
              (a := 3)
              (for (i := 1) (< i 10) (i ++)
                (a ++))} )
        