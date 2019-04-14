#lang racket

(require "calc.rkt")

(define (def-name p)
  (car p))

(define (def-prods p)
  (cdr p))

(define (rule-name r)
  (car r))

(define (rule-body r)
  (cdr r))

(define (lookup-def g nt)
  (cond [(null? g) (error "unknown non-terminal" g)]
        [(eq? (def-name (car g)) nt) (def-prods (car g))]
        [else (lookup-def (cdr g) nt)]))

(define parse-error 'PARSEERROR)

(define (parse-error? r) (eq? r 'PARSEERROR))

(define (res v r)
  (cons v r))

(define (res-val r)
  (car r))

(define (res-input r)
  (cdr r))

;;

(define (token? e)
  (and (list? e)
       (> (length e) 0)
       (eq? (car e) 'token)))

(define (token-args e)
  (cdr e))

(define (nt? e)
  (symbol? e))

;;

(define (parse g e i)
  (cond [(token? e) (match-token (token-args e) i)]
        [(nt? e) (parse-nt g (lookup-def g e) i)]))

(define (parse-nt g ps i)
  (if (null? ps)
      parse-error
      (let ([r (parse-many g (rule-body (car ps)) i)])
        (if (parse-error? r)
            (parse-nt g (cdr ps) i)
            (res (cons (rule-name (car ps)) (res-val r))
                 (res-input r))))))

(define (parse-many g es i)
  (if (null? es)
      (res null i)
      (let ([r (parse g (car es) i)])
        (if (parse-error? r)
            parse-error
            (let ([rs (parse-many g (cdr es) (res-input r))])
              (if (parse-error? rs)
                  parse-error
                  (res (cons (res-val r) (res-val rs))
                       (res-input rs))))))))

(define (match-token xs i)
  (if (and (not (null? i))
           (member (car i) xs))
      (res (car i) (cdr i))
      parse-error))

;;

(define num-grammar
  '([digit {DIG (token #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9)}]
    [numb {MANY digit numb}
          {SINGLE digit}]))

(define (node-name t)
  (car t))

(define (c->int c)
  (- (char->integer c) (char->integer #\0)))

(define (walk-tree-acc t acc)
  (cond [(eq? (node-name t) 'MANY)
         (walk-tree-acc
          (third t)
          (+ (* 10 acc) (c->int (second (second t)))))]
        [(eq? (node-name t) 'SINGLE)
         (+ (* 10 acc) (c->int (second (second t))))]))

(define (walk-tree t)
  (walk-tree-acc t 0))

;;Procedura modyfikująca otrzymaną listę (wynik iter) do wygodniejszej postaci
(define (iter2 l x res)
  (if (= (length l) 1)
      (append res (list (cons x (cdar l))) (list (caar l)))
      (iter2 (cdr l) (car (car l)) (append res (list (cons x (cdr (car l))))))))

;;Procedura tworząca racketowe wyrażenie na podstawie otrzymanej listy (wyniku iter2)
(define (merge l)
  (if (= (length l) 1)
      (car l)
      (list (cdar l) (merge (cdr l)) (caar l))))

(define (sub-tree t)
  ;;Procedura "zbierająca" lewe podprzewo każdego poddrzewa
  ;;i umieszaczająca je na liście razem z operatorami
  (define (iter t res)
     (cond [(eq? (node-name t) 'SUB-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '-) res))]
           [(eq? (node-name t) 'ADD-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '+) res))]
           [else
            (cons (arith-walk-tree t) res)])) 
  (let* ((a (iter t '()))
         (l (iter2 (cdr a) (car a) '())))
    (merge l)))

(define (div-tree t)
  ;;jak w sub-tree
  (define (iter t res)
     (cond [(eq? (node-name t) 'SUB-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '-) res))]
           [(eq? (node-name t) 'ADD-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '+) res))]
           [(eq? (node-name t) 'MULT-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '*) res))]
           [(eq? (node-name t) 'DIV-MANY)
              (iter  (fourth t) (cons (cons (arith-walk-tree (second t)) '/) res))]
           [else
            (cons (arith-walk-tree t) res)]))
  (let* ((a (iter t '()))
         (l (iter2 (cdr a) (car a) '())))
    (merge l)))

;;

(define arith-grammar
  (append num-grammar
     '([add-expr {SUB-MANY   mult-expr (token #\-) add-expr}
                 {ADD-MANY   mult-expr (token #\+) add-expr}
                 {ADD-SINGLE mult-expr}]
       [mult-expr {MULT-MANY base-expr (token #\*) mult-expr}
                  {DIV-MANY base-expr (token #\/) mult-expr}
                  {MULT-SINGLE base-expr}]
       [base-expr {BASE-NUM numb}
                  {PARENS (token #\() add-expr (token #\))}])))

(define (arith-walk-tree t)
  (cond [(eq? (node-name t) 'ADD-SINGLE)
         (arith-walk-tree (second t))]
        [(eq? (node-name t) 'MULT-SINGLE)
         (arith-walk-tree (second t))]
        [(eq? (node-name t) 'ADD-MANY)
         (binop-cons
          '+
          (arith-walk-tree (second t))
          (arith-walk-tree (fourth t)))]
        [(eq? (node-name t) 'MULT-MANY)
         (binop-cons
          '*
          (arith-walk-tree (second t))
          (arith-walk-tree (fourth t)))]
        [(eq? (node-name t) 'SUB-MANY)
         (sub-tree t)]
        [(eq? (node-name t) 'DIV-MANY)
         (div-tree t)]
        [(eq? (node-name t) 'BASE-NUM)
         (walk-tree (second t))]
        [(eq? (node-name t) 'PARENS)
         (arith-walk-tree (third t))]))

(define (calc s)
 (eval
  (arith-walk-tree
   (car
    (parse
       arith-grammar
       'add-expr
       (string->list s))))))

(define (tree s)
  (car
    (parse
       arith-grammar
       'add-expr
       (string->list s))))

(define (racket-arith s)
  (arith-walk-tree (tree s)))


;;Testy
(racket-arith "1-2-3-4-5-6-7")
(calc "1-2-3-4-5-6-7") 
(racket-arith "2*7-3-4*8+(3-12)*(4+2)-12/3")
(calc "2*7-3-4*8+(3-12)*(4+2)-12/3")
(racket-arith "1/(1+2)/(1+2+3)/(1+2+3+4)")
(calc "1/(1+2)/(1+2+3)/(1+2+3+4)")
(racket-arith "1+2+3-4/7*3/2/2/2/2")
(calc "1+2+3-4/7*3/2/2/2/2")
(racket-arith "3*(1+2-4*(6-7-2)+(10-4-2)/(2+1-3*5/2))-12")
(calc "(3*(1+2-4*(6-7-2)+(10-4-2)/(2+1-3*5/2))-12)")
(racket-arith "1/2/2/2/2/2/2/2/2/2/2")
(calc "1/2/2/2/2/2/2/2/2/2/2")
(racket-arith "1+2-3*4/5+6-7*8/9")
(calc "1+2-3*4/5+6-7*8/9")
(racket-arith "1-(2-(3-4))")
(calc "1-(2-(3-4))")
(racket-arith "1/(2/(3/4))")
(calc "1/(2/(3/4))")

