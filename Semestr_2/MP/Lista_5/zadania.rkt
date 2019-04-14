#lang racket
(define (var? t)
  (symbol? t))

(define (neg? t)
  (and (list? t)
       (= 2 (length t))
       (eq? 'neg (car t))))

(define (conj? t)
  (and (list? t)
       (= 3 (length t))
       (eq? 'conj (car t))))

(define (disj? t)
  (and (list? t)
       (= 3 (length t))
       (eq? 'disj (car t))))

(define (neg p)
  (list 'neg p))

(define (conj p q)
  (list 'conj p q))

(define (disj p q)
  (list 'disj p q))

(define (neg-subf f)
  (cdr f))

(define (disj-left f)
  (second f))

(define (disj-right f)
  (third f))

(define (conj-left f)
  (second f))

(define (conj-right f)
  (third f))

;;(define (free-var f)
;;  (define l (list))
 ;; (define (add x)
   ;; (if
  ;;(define (find g)
    ;;(if (var? g)
      ;;  (add g)
        ;;(cond ((neq? g) (find (neg-subf q)))
          ;;    ((conj? q) (c g))
            ;;  ((disj? g) (d g))
              ;;(else (error "xd"))))))


(define (prop? f)
  (or (var? f)
      (and (neg? f)
           (prop? (neg-subf f)))
      (and (disj? f)
           (prop? (disj-left f))
           (prop? (disj-right f)))
      (and (conj? f)
           (prop? (disj-left f))
           (prop? (disj-right f)))))

(define (a x)
  (define xd (list ))
  (define (f n xd)
    (cons xd n))
  (f x xd)
  xd)

