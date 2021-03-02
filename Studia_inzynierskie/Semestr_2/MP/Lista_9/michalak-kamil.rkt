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

; arith and bool expressions: syntax and semantics

(define (const? t)
  (number? t))

(define (true? t)
  (eq? t 'true))

(define (false? t)
  (eq? t 'false))

(define (op? t)
  (and (list? t)
       (member (car t) '(+ - * / = > >= < <= not and or mod rand))))

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
        [(eq? op 'not) not]
        [(eq? op 'and) (lambda x (andmap identity x))]
        [(eq? op 'or) (lambda x (ormap identity x))]
        [(eq? op 'mod) modulo]))

(define (var? t)
  (symbol? t))

(define (rand? t)
  (and (list? t)
       (= (length t) 2)
       (eq? (car t) 'rand)))

(define (rand-max t)
  (cadr t))

(define (eval-res t)
  (car t))

(define (eval-seed t)
  (cdr t))

;;Procedura obliczająca kod spełniający predykat "op?"
(define (eval-op e m)
  ;;iteracja po wszystkich argumentach
  (define (iter args res m)
    (if (null? args)
        ;;zwrócenie pary (lista wartości argumentów . ziarno)
        (cons res (get-mem 'seed m))
        (let* ((new-res (eval-arith (car args) m))
               (new-m (set-mem 'seed (eval-seed new-res) m)))
          (iter (cdr args) (append res (list (eval-res new-res))) new-m))))
  (let ((result (iter (op-args e) '() m)))
    (cons (apply (op->proc (op-op e))
                 (eval-res result))
          (eval-seed result))))


;;Procedura eval-arith zwraca teraz parę (wynik . ziarno)
(define (eval-arith e m)
  (let ((seed (get-mem 'seed m)))
    (cond [(true? e) (cons true seed)]
          [(false? e) (cons false seed)]
          [(var? e) (cons (get-mem e m) seed)]
          [(rand? e) (let* ((new-rand ((rand (eval-res (eval-arith (rand-max e) m))) seed))
                            (new-seed (cdr new-rand))
                            (res (car new-rand)))
                       (cons res new-seed))]
          [(op? e) (eval-op e m)]
          [(const? e) (cons e seed)])))

;; syntax of commands

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

;; state

(define (res v s)
  (cons v s))

(define (res-val r)
  (car r))

(define (res-state r)
  (cdr r))

;; psedo-random generator

(define initial-seed
  123456789)

(define (rand max)
  (lambda (i)
    (let ([v (modulo (+ (* 1103515245 i) 12345) (expt 2 32))])
      (res (modulo v max) v))))

;; WHILE interpreter

;;nowy interpreter, wykorzystujący nową procedure eval-arith
(define (eval e m)
  (cond [(assign? e)
         (let* ((result (eval-arith (assign-expr e) m))
                ;;zmiana ziarna w pamięci
                (new-mem (set-mem 'seed (eval-seed result) m))
                ;;zmiana wartości zmiennej w pamięci
                (new-mem2 (set-mem (assign-var e) (eval-res result) new-mem)))
           new-mem2)]
        [(if? e)
         ;;jeśli w warunku został użyty rand to zmiana ziarna
         (let* ((cond-result (eval-arith (if-cond e) m))
                (new-mem (set-mem 'seed (eval-seed cond-result) m)))
           (if (eval-res cond-result)
               (eval (if-then e) new-mem)
               (eval (if-else e) new-mem)))]
        [(while? e)
         ;;jak wyżej
         (let* ((cond-result (eval-arith (if-cond e) m))
                (new-mem (set-mem 'seed (eval-seed cond-result) m)))
           (if (eval-res cond-result)
               (eval e (eval (while-expr e) new-mem))
               new-mem))]
        [(block? e)
         (if (null? e)
             m
             (eval (cdr e) (eval (car e) m)))]))
  

(define (run e)
  (let ((start-mem (set-mem 'seed initial-seed empty-mem)))
    (eval e start-mem)))

;;

(define fermat-test
  '{(composite := false)
    (if (> n 2)
    (while (> k 0)
           {
            (a := (+ 2 (rand (- n 4))))
            (pot := 1)
            (i := 0)
            (while (< i (- n 1))
                   {
                    (pot := (* pot a))
                    (i := (+ i 1))
                    })
            (pot := (mod pot n))
            (if (not (= pot 1))
                {
                 (composite := true)
                 (k := 0)
                 }
                 (k := (- k 1)))})
    (composite := false))})
            


(define (probably-prime? n k) ; check if a number n is prime using
                              ; k iterations of Fermat's primality
                              ; test
  (let ([memory (set-mem 'seed initial-seed
                (set-mem 'k k
                (set-mem 'n n empty-mem)))])
    (not (get-mem
           'composite
           (eval fermat-test memory)))))

(define test-mem1 (list (cons 'n 2) (cons 'k 5) (cons 'seed initial-seed)))
(define test-mem7 (list (cons 'n 3) (cons 'k 5) (cons 'seed initial-seed)))
(define test-mem2 (list (cons 'n 9) (cons 'k 20) (cons 'seed initial-seed)))
(define test-mem3 (list (cons 'n 6) (cons 'k 7) (cons 'seed initial-seed)))
(define test-mem4 (list (cons 'n 17) (cons 'k 30) (cons 'seed initial-seed)))
(define test-mem5 (list (cons 'n 10) (cons 'k 100) (cons 'seed initial-seed)))
(define test-mem6 (list (cons 'n 199) (cons 'k 10) (cons 'seed initial-seed)))

;;Testy testu Fermata w 2 wersjach
(eval fermat-test test-mem1)
(eval fermat-test test-mem7)
(eval fermat-test test-mem2)
(eval fermat-test test-mem3)
(eval fermat-test test-mem4)
(eval fermat-test test-mem5)
(eval fermat-test test-mem6)

(probably-prime? 2 10)
(probably-prime? 3 5)
(probably-prime? 9 20)
(probably-prime? 6 17)
(probably-prime? 17 30)
(probably-prime? 10 100)
(probably-prime? 199 100)


;;Osobne testy nowego interpretera
(run '(x := (rand 100)))
(run '(x := (+ (rand 10) (rand 10) (rand 10))))
(run '((a := (rand 100))
       (b := (rand 100))
       (c := (rand 100))
       (d := (rand 100))))
(run '((x := 5)
       (while (> x 3)
              (x := (rand 10)))))
(run '((x := (+ 1 2 3 4 5 (rand 12)))))
(run '((x := (and true true))))
(run '((x := (rand 10))
       (y := (> x 5))))


