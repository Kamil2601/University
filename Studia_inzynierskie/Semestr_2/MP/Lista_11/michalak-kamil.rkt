#lang racket

;; sygnatura: grafy
(define-signature graph^
  ((contracted
    [graph        (-> list? (listof edge?) graph?)]
    [graph?       (-> any/c boolean?)]
    [graph-nodes  (-> graph? list?)]
    [graph-edges  (-> graph? (listof edge?))]
    [edge         (-> any/c any/c edge?)]
    [edge?        (-> any/c boolean?)]
    [edge-start   (-> edge? any/c)]
    [edge-end     (-> edge? any/c)]
    [has-node?    (-> graph? any/c boolean?)]
    [outnodes     (-> graph? any/c list?)]
    [remove-node  (-> graph? any/c graph?)]
    )))

;; prosta implementacja grafów
(define-unit simple-graph@
  (import)
  (export graph^)

  (define (graph? g)
    (and (list? g)
         (eq? (length g) 3)
         (eq? (car g) 'graph)))

  (define (edge? e)
    (and (list? e)
         (eq? (length e) 3)
         (eq? (car e) 'edge)))

  (define (graph-nodes g) (cadr g))

  (define (graph-edges g) (caddr g))

  (define (graph n e) (list 'graph n e))

  (define (edge n1 n2) (list 'edge n1 n2))

  (define (edge-start e) (cadr e))

  (define (edge-end e) (caddr e))

  (define (has-node? g n) (not (not (member n (graph-nodes g)))))
  
  (define (outnodes g n)
    (filter-map
     (lambda (e)
       (and (eq? (edge-start e) n)
            (edge-end e)))
     (graph-edges g)))

  (define (remove-node g n)
    (graph
     (remove n (graph-nodes g))
     (filter
      (lambda (e)
        (not (eq? (edge-start e) n)))
      (graph-edges g)))))

;; sygnatura dla struktury danych
(define-signature bag^
  ((contracted
    [bag?       (-> any/c boolean?)]
    [bag-empty? (-> bag? boolean?)]
    [empty-bag  (and/c bag? bag-empty?)]
    [bag-insert (-> bag? any/c (and/c bag? (not/c bag-empty?)))]
    [bag-peek   (-> (and/c bag? (not/c bag-empty?)) any/c)]
    [bag-remove (-> (and/c bag? (not/c bag-empty?)) bag?)])))

;; struktura danych - stos

(define-unit bag-stack@
  (import)
  (export bag^)

  (define (bag? x)
    (list? x))

  (define (bag-empty? b)
    (and (bag? b)
         (null? b)))

  (define empty-bag '())

  (define (bag-insert b x)
     (cons x b))

  (define (bag-peek b)
    (car b))

  (define (bag-remove b)
     (cdr b))
)

;; struktura danych - kolejka FIFO
;; do zaimplementowania przez studentów
(define-unit bag-fifo@
  (import)
  (export bag^)

  (define (in q)
    (car q))

  (define (out q)
    (cadr q))

  (define (q-cons q)
    (list '() (reverse (in q))))

  (define (bag? x)
    (and (list? x)
         (= (length x) 2)
         (list? (in x))
         (list? (out x))))
  
  (define (bag-empty? q)
    (and (bag? q)
         (null? (in q))
         (null? (out q))))

  (define empty-bag '(() ()))

 
  (define (bag-insert q x)
    (list (cons x (in q)) (out q)))

  (define (bag-peek q)
    (if (null? (out q))
        (bag-peek (q-cons q))
        (car (out q))))

  (define (bag-remove q)
    (if (null? (out q))
        (bag-remove (q-cons q))
        (list (in q) (cdr q))))
  
;; TODO: zaimplementuj kolejkę
)

;; sygnatura dla przeszukiwania grafu
(define-signature graph-search^
  (search))

;; implementacja przeszukiwania grafu
;; uzależniona od implementacji grafu i struktury danych
(define-unit/contract graph-search@
  (import bag^ graph^)
  (export (graph-search^
           [search (-> graph? any/c (listof any/c))]))
  (define (search g n)
    (define (it g b l)
      (cond
        [(bag-empty? b) (reverse l)]
        [(has-node? g (bag-peek b))
         (it (remove-node g (bag-peek b))
             (foldl
              (lambda (n1 b1) (bag-insert b1 n1))
              (bag-remove b)
              (outnodes g (bag-peek b)))
             (cons (bag-peek b) l))]
        [else (it g (bag-remove b) l)]))
    (it g (bag-insert empty-bag n) '()))
  )

;; otwarcie komponentu grafu
(define-values/invoke-unit/infer simple-graph@)

;; graf testowy
(define test-graph
  (graph
   (list 1 2 3 4)
   (list (edge 1 3)
         (edge 1 2)
         (edge 2 4))))
;; TODO: napisz inne testowe grafy!

(define test-graph2
  (graph
   (list 1 2 3 4 5 6)
   (list (edge 1 2)
         (edge 2 3)
         (edge 3 4)
         (edge 4 5)
         (edge 5 1))))

(define test-graph3
  (graph
   (list 1 2 3 4 5 6)
   (list )))

(define tree
  (graph
   (list 1 2 3 4 5 6 7)
   (list (edge 1 2)
         (edge 1 3)
         (edge 2 4)
         (edge 2 5)
         (edge 3 6)
         (edge 3 7))))

(define graph4
  (graph
   '(a b c d)
   (list (edge 'a 'c)
         (edge 'b 'd))))

;; otwarcie komponentu stosu
(define-values/invoke-unit/infer bag-stack@)
;; opcja 2: otwarcie komponentu kolejki
; (define-values/invoke-unit/infer bag-fifo@)

;; testy w Quickchecku
(require quickcheck)

;; test przykładowy: jeśli do pustej struktury dodamy element
;; i od razu go usuniemy, wynikowa struktura jest pusta
(quickcheck
 (property ([s arbitrary-symbol])
           (bag-empty? (bag-remove (bag-insert empty-bag s)))))
;; TODO: napisz inne własności do sprawdzenia!

;;jeśli do pustej struktury dodamy element x a następnie pobierzemy element
;;to otrzymamy x
(quickcheck
 (property ([s arbitrary-symbol])
          (eq? s (bag-peek (bag-insert empty-bag s)))))

;;własność dla kolejki
;;jeśli z niepustej kolejki pobierzemy element x to dodając najpierw
;;element y a następnie pobierając element ponownie otrzymamy x
#|(quickcheck
 (property ([x arbitrary-symbol]
            [y arbitrary-symbol])
           (eq? (bag-peek (bag-insert empty-bag x)) (bag-peek (bag-insert (bag-insert empty-bag x) y)))))|#

;;analogiczna własnośc stosu, ale najpierw umieszczamy na stosie y a potem x
#|(quickcheck
  (property ([x arbitrary-symbol]
            [y arbitrary-symbol])
           (eq? (bag-peek (bag-insert empty-bag x)) (bag-peek (bag-insert (bag-insert empty-bag y) x)))))|#


;; otwarcie komponentu przeszukiwania
(define-values/invoke-unit/infer graph-search@)

;; uruchomienie przeszukiwania na przykładowym grafie
(search test-graph 1)
;; TODO: uruchom przeszukiwanie na swoich przykładowych grafach!

(search test-graph2 1)
(search test-graph2 6)
(search test-graph2 3)
(search test-graph3 1)
(search tree 1)
(search tree 2)
(search tree 3)
(search tree 4)
(search tree 5)
(search tree 6)
(search tree 7)

(search graph4 'a)
(search graph4 'b)
(search graph4 'c)
(search graph4 'd)
