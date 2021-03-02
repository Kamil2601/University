#lang racket

(define (btree? t)
   (or (eq? t 'leaf)
       (and (list? t)
             (= 4 (length t))
             (eq? (car t) 'node)
             (btree? (caddr t))
             (btree? (cadddr t)))))

(define (mirror t)
  (if (eq? t 'leaf)
      t
      (list 'node (cadr t) (mirror (cadddr t)) (mirror (caddr t)))))

(mirror '(node a (node b (node c leaf leaf) leaf) (node d leaf leaf)))

(define trzy '(node a (node b (node c leaf leaf) leaf) (node d leaf leaf)))
trzy
(caddr trzy)

(define (flatten tree)
  (define (flattend tree ans)
    (display tree)
    (display "\n")
    (if (eq? tree 'leaf)
        ans
        (flattend (caddr tree) (cons (cadr tree) (flattend (cadddr tree) ans)))))
  (flattend tree null))

(flatten trzy)