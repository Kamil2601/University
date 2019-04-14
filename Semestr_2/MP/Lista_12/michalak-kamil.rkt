#lang racket

(require racklog)

;; transpozycja tablicy zakodowanej jako lista list
(define (transpose xss)
  (cond [(null? xss) xss]
        ((null? (car xss)) (transpose (cdr xss)))
        [else (cons (map car xss)
                    (transpose (map cdr xss)))]))

;; procedura pomocnicza
;; tworzy listę n-elementową zawierającą wyniki n-krotnego
;; wywołania procedury f
(define (repeat-fn n f)
  (if (eq? 0 n) null
      (cons (f) (repeat-fn (- n 1) f))))

;; tworzy tablicę n na m elementów, zawierającą świeże
;; zmienne logiczne
(define (make-rect n m)
  (repeat-fn m (lambda () (repeat-fn n _))))



(define %null
  (%rel (x)
        [(x)
         (%= x '())]))

(define (make-block n)
  (if (= n 0)
      (list '-)
      (append (list '*) (make-block (- n 1)))))

(define (make-block2 n)
  (if (= n 0)
      null
      (append (list '*) (make-block2 (- n 1)))))
    

(define %empty
  (%rel (x a)
        [(null)]
        [(x)
          (%append '- a x)
          (%empty a)]))


;; predykat binarny
;; (%row-ok xs ys) oznacza, że xs opisuje wiersz (lub kolumnę) ys

(define %row-ok
  (%rel (xs ys a ns car_xs cdr_xs block  cadr_ys cddr_ys)
        [(null ys)
         (%empty ys)]
        [(xs ys) 
         (%append '(-) a ys)
         (%row-ok xs a)]
        [(xs ys)
         (%not (%null xs))
         (%is car_xs (car xs))
         (%is block (make-block car_xs))
         (%is cdr_xs (cdr xs))
         (%append block a ys)
         (%row-ok cdr_xs a)]
        [(xs ys)
         (%not (%null xs))
         (%is car_xs (car xs))
         (%is cdr_xs (cdr xs))
         (%null cdr_xs)
         (%is block (make-block2 car_xs))
         (%is cdr_xs (cdr xs))
         (%= ys block)]))

(define %rows-ok
  (%rel (rows xss a b c d)
        [(null null)]
        [((cons a c) (cons b d))
         (%row-ok a b)
         (%rows-ok c d)]))

       
    

;; funkcja rozwiązująca zagadkę
(define (solve rows cols)
  (define board (make-rect (length cols) (length rows)))
  (define tboard (transpose board))
  (define ret (%which (xss txss) 
                      (%= xss board)
                      (%= txss tboard)
                      (%rows-ok rows xss)
                      (%rows-ok cols txss)
                      ))
  (and ret (cdar ret)))


;; testy
(equal? (solve '((2) (1) (1)) '((1 1) (2)))
        '((* *)
          (- *)
          (* -)))

(equal? (solve '((2) (2 1) (1 1) (2)) '((2) (2 1) (1 1) (2)))
        '((- * * -)
          (* * - *)
          (* - - *)
          (- * * -)))

(solve '((3) (1 1) (1 1 1) (1 1) (3)) '((3) (1 1) (1 1 1) (1 1) (3)))

(solve '((2) (2)) '((2) (2)))

(solve '((2 2) () (3) () (5)) '((1 1) (1 1 1) (1 1) (1 1 1) (1 1)))








