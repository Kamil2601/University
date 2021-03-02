#lang racket

(define (inc n)
  (+ n 1))

;;; ordered elements
(define (make-elem pri val)
  (cons pri val))

(define (elem-priority x)
  (car x))

(define (elem-val x)
  (cdr x))

;;; leftist heaps (after Okasaki)

;; data representation
(define leaf 'leaf)

(define (leaf? h) (eq? 'leaf h))

(define (hnode? h)
  (and (list? h)
       (= 5 (length h))
       (eq? (car h) 'hnode)
       (natural? (caddr h))))

(define (make-node elem heap-a heap-b)
  (define ra (rank heap-a))
  (define rb (rank heap-b))
  (if (> rb ra)
      (list 'node elem (+ rb 1) heap-b heap-a)
      (list 'node elem (+ ra 1) heap-a heap-b)))


(define (node-elem h)
  (second h))

(define (node-left h)
  (fourth h))

(define (node-right h)
  (fifth h))

(define (hord? p h)
  (or (leaf? h)
      (<= p (elem-priority (node-elem h)))))

(define (heap? h)
  (or (leaf? h)
      (and (hnode? h)
           (heap? (node-left h))
           (heap? (node-right h))
           (<= (rank (node-right h))
               (rank (node-left h)))
           (= (rank h) (inc (rank (node-right h))))
           (hord? (elem-priority (node-elem h))
                  (node-left h))
           (hord? (elem-priority (node-elem h))
                  (node-right h)))))

(define (rank h)
  (if (leaf? h)
      0
      (third h)))

;; operations

(define empty-heap leaf)

(define (heap-empty? h)
  (leaf? h))

(define (heap-insert elt heap)
  (heap-merge heap (make-node elt leaf leaf)))

(define (heap-min heap)
  (node-elem heap))

(define (heap-pop heap)
  (heap-merge (node-left heap) (node-right heap)))

(define (heap-merge h1 h2)             
  (cond
   [(leaf? h1) h2]
   [(leaf? h2) h1]
   [else
    (let ((min1 (heap-min h1))
      (min2 (heap-min h2)))
      (let (
            (pr1 (elem-priority min1))
            (pr2 (elem-priority min2)))
        (if (> pr1 pr2)
            (let ((hl (node-left h2))
                  (hr (node-right h2)))
              (let ((merged (heap-merge hr h1)))
                (make-node min2 merged hl)))
            (let ((hl (node-left h1))
                  (hr (node-right h1)))
              (let ((merged (heap-merge hr h2)))
                (make-node min1 merged hl))))))]))


;;; heapsort. sorts a list of numbers.
(define (heapsort xs)
  (define (popAll h)
    (if (heap-empty? h)
        null
        (cons (elem-val (heap-min h)) (popAll (heap-pop h)))))
  (let ((h (foldl (lambda (x h)
                    (heap-insert (make-elem x x) h))
            empty-heap xs)))
    (popAll h)))

;;; check that a list is sorted (useful for longish lists)
(define (sorted? xs)
  (cond [(null? xs)              true]
        [(null? (cdr xs))        true]
        [(<= (car xs) (cadr xs)) (sorted? (cdr xs))]
        [else                    false]))

;;; generate a list of random numbers of a given length
(define (randlist len max)
  (define (aux len lst)
    (if (= len 0)
        lst
        (aux (- len 1) (cons (random max) lst))))
  (aux len null))

;;Tests
(display "Testy\n")
(define l1 (list 10 4 12 7 1 8 6 3 2 9))
(display "lista 10-elementowa\n")
l1
(display "sortowanie\n")
(heapsort l1)
(define l2 (randlist 10 100))
(display "lista losowa 10 elementów z zakresu 0..99\n")
l2
(display "sortowanie\n")
(heapsort l2)
(define l3 (list 10 9 8 7 6 5 4 3 2 1))
(display "lista odwrocona\n")
l3
(display "sortowanie\n")
(heapsort l3)
(define l4 '())
(display "lista pusta\n")
l4
(display "sortowanie\n")
(heapsort l4)
(define l5 (list 1 2 3 4 5 6 7 8 9 10))
(display "lista posortowana\n")
l5
(display "sortowanie\n")
(heapsort l5)
(define l6 '(1 2 1 2 1 2 1 2 1 2 1 1 2 1 2 1 2 1 1 2))
(display "lista zawierajaca wiele takich samych elementow\n")
l6
(display "sortowanie\n")
(heapsort l6)
(define l7 (randlist 100 1000))
(display "lista losowa 100 elementów z zakresu 0..999\n")
l7
(display "sortowanie\n")
(heapsort l7)
