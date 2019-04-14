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

;; reprezentacja danych wejściowych (z ćwiczeń)
(define (var? x)
  (symbol? x))

(define (var x)
  x)

(define (var-name x)
  x)

;; przydatne predykaty na zmiennych
(define (var<? x y)
  (symbol<? x y))

(define (var=? x y)
  (eq? x y))

(define (literal? x)
  (and (tagged-tuple? 'literal 3 x)
       (boolean? (cadr x))
       (var? (caddr x))))

(define (literal pol x)
  (list 'literal pol x))

(define (literal-pol x)
  (cadr x))

(define (literal-var x)
  (caddr x))

(define (clause? x)
  (and (tagged-list? 'clause x)
       (andmap literal? (cdr x))))

(define (clause . lits)
  (cons 'clause lits))

(define (clause-lits c)
  (cdr c))

(define (cnf? x)
  (and (tagged-list? 'cnf x)
       (andmap clause? (cdr x))))

(define (cnf . cs)
    (cons 'cnf cs))

(define (cnf-clauses x)
  (cdr x))

;; oblicza wartość formuły w CNF z częściowym wartościowaniem. jeśli zmienna nie jest
;; zwartościowana, literał jest uznawany za fałszywy.
(define (valuate-partial val form)
  (define (val-lit l)
    (let ((r (assoc (literal-var l) val)))
      (cond
       [(not r)  false]
       [(cadr r) (literal-pol l)]
       [else     (not (literal-pol l))])))
  (define (val-clause c)
    (ormap val-lit (clause-lits c)))
  (andmap val-clause (cnf-clauses form)))

;; reprezentacja dowodów sprzeczności

(define (axiom? p)
  (tagged-tuple? 'axiom 2 p))

(define (proof-axiom c)
  (list 'axiom c))

(define (axiom-clause p)
  (cadr p))

(define (res? p)
  (tagged-tuple? 'resolve 4 p))

(define (proof-res x pp pn)
  (list 'resolve x pp pn))

(define (res-var p)
  (cadr p))

(define (res-proof-pos p)
  (caddr p))

(define (res-proof-neg p)
  (cadddr p))

;; sprawdza strukturę, ale nie poprawność dowodu
(define (proof? p)
  (or (and (axiom? p)
           (clause? (axiom-clause p)))
      (and (res? p)
           (var? (res-var p))
           (proof? (res-proof-pos p))
           (proof? (res-proof-neg p)))))

;; procedura sprawdzająca poprawność dowodu
(define (check-proof pf form)
  (define (run-axiom c)
    (displayln (list 'checking 'axiom c))
    (and (member c (cnf-clauses form))
         (clause-lits c)))
  (define (run-res x cpos cneg)
    (displayln (list 'checking 'resolution 'of x 'for cpos 'and cneg))
    (and (findf (lambda (l) (and (literal-pol l)
                                 (eq? x (literal-var l))))
                cpos)
         (findf (lambda (l) (and (not (literal-pol l))
                                 (eq? x (literal-var l))))
                cneg)
         (append (remove* (list (literal true x))  cpos)
                 (remove* (list (literal false x)) cneg))))
  (define (run-proof pf)
    (cond
     [(axiom? pf) (run-axiom (axiom-clause pf))]
     [(res? pf)   (run-res (res-var pf)
                           (run-proof (res-proof-pos pf))
                           (run-proof (res-proof-neg pf)))]
     [else        false]))
  (null? (run-proof pf)))


;; reprezentacja wewnętrzna

;; sprawdza posortowanie w porządku ściśle rosnącym, bez duplikatów
(define (sorted? vs)
  (or (null? vs)
      (null? (cdr vs))
      (and (var<? (car vs) (cadr vs))
           (sorted? (cdr vs)))))

(define (sorted-varlist? x)
  (and (list? x)
       (andmap (var? x))
       (sorted? x)))

;; klauzulę reprezentujemy jako parę list — osobno wystąpienia pozytywne i negatywne. Dodatkowo
;; pamiętamy wyprowadzenie tej klauzuli (dowód) i jej rozmiar.
(define (res-clause? x)
  (and (tagged-tuple? 'res-int 5 x)
       (sorted-varlist? (second x))
       (sorted-varlist? (third x))
       (= (fourth x) (+ (length (second x)) (length (third x))))
       (proof? (fifth x))))

(define (res-clause pos neg proof)
  (list 'res-int pos neg (+ (length pos) (length neg)) proof))

(define (res-clause-pos c)
  (second c))

(define (res-clause-neg c)
  (third c))

(define (res-clause-size c)
  (fourth c))

(define (res-clause-proof c)
  (fifth c))

;; przedstawia klauzulę jako parę list zmiennych występujących odpowiednio pozytywnie i negatywnie
(define (print-res-clause c)
  (list (res-clause-pos c) (res-clause-neg c)))

;; sprawdzanie klauzuli sprzecznej
(define (clause-false? c)
  (and (null? (res-clause-pos c))
       (null? (res-clause-neg c))))

;; pomocnicze procedury: scalanie i usuwanie duplikatów z list posortowanych
(define (merge-vars xs ys)
  (cond [(null? xs) ys]
        [(null? ys) xs]
        [(var<? (car xs) (car ys))
         (cons (car xs) (merge-vars (cdr xs) ys))]
        [(var<? (car ys) (car xs))
         (cons (car ys) (merge-vars xs (cdr ys)))]
        [else (cons (car xs) (merge-vars (cdr xs) (cdr ys)))]))

(define (remove-duplicates-vars xs)
  (cond [(null? xs) xs]
        [(null? (cdr xs)) xs]
        [(var=? (car xs) (cadr xs)) (remove-duplicates-vars (cdr xs))]
        [else (cons (car xs) (remove-duplicates-vars (cdr xs)))]))

(define (rev-append xs ys)
  (if (null? xs) ys
      (rev-append (cdr xs) (cons (car xs) ys))))

;; TODO: miejsce na uzupełnienie własnych funkcji pomocniczych

(define (find v l)
  (if (null? l)
      false
      (if (var=? v (car l))
          true
          (find v (cdr l)))))

(define (clause-trivial? c)
  (let ((pos (res-clause-pos c))
        (neg (res-clause-neg c)))
    (define (search pos neg)
      (if (null? pos)
          false
          (if (find (car pos) neg)
              true
              (search (cdr pos) neg))))
    (search pos neg)))


(define (resolve c1 c2)
 (define (search l1 l2)
    (if (null? l1)
        null
        (if (find (car l1) l2)
            (car l1)
            (search (cdr l1) l2))))
  (define (make-resolve v pos neg proof)
    (define (make-list l)
      (define (iter l result)
        (if (null? l)
            result
            (if (and (not (find (car l) result))
                     (not (var=? (car l) v)))
                (iter (cdr l) (append result (list (car l))))
                (iter (cdr l) result))))
      (iter l (list)))
    (let ((pos-r (make-list pos))
          (neg-r (make-list neg)))
     (res-clause pos-r neg-r proof)))
 (let* ([p1 (res-clause-pos c1)]
        [p2 (res-clause-pos c2)]
        [n1 (res-clause-neg c1)]
        [n2 (res-clause-neg c2)]
        [v (search p1 n2)]
        [proof1 (res-clause-proof c1)]
        [proof2 (res-clause-proof c2)]
        [p (merge-vars p1 p2)]
        [n (merge-vars n1 n2)])
   (if (not (null? v))
       (make-resolve v p n
                     (list 'resolve v proof1 proof2))
       (let ([v (search p2 n1)])
         (if (not (null? v))
             (make-resolve v p n
                     (list 'resolve v proof2 proof1))
             false)))))

(define (unsat-pos? c l)
  (let ((v (car (res-clause-pos c))))
    (if (null? l)
        false
        (if (and (not (null? (res-clause-neg (car l))))
                 (var=? v (car (res-clause-neg (car l))))
                 (= (res-clause-size (car l)) 1))
            true
            (unsat-pos? c (cdr l))))))

(define (unsat-neg? c l)
  (let ((v (car (res-clause-neg c))))
    (if (null? l)
        false
        (if (and (not (null? (res-clause-pos (car l))))
                 (var=? v (car (res-clause-pos (car l))))
                 (= (res-clause-size (car l)) 1))
            true
            (unsat-neg? c (cdr l))))))

(define (delete-pos v l)
  (define (iter l result)
    (if (null? l)
        result
        (if (find v (res-clause-pos (car l)))
            (iter (cdr l) result)
            (let ((new-c (res-clause (res-clause-pos (car l))
                                     (delete-var v (res-clause-neg (car l)))
                                     (res-clause-proof (car l)))))
              (iter (cdr l) (insert new-c result))))))
  (iter l '()))

(define (delete-neg v l)
  (define (iter l result)
    (if (null? l)
        result
        (if (find v (res-clause-neg (car l)))
            (iter (cdr l) result)
            (let ((new-c (res-clause (res-clause-neg (car l))
                                     (delete-var v (res-clause-pos (car l)))
                                     (res-clause-proof (car l)))))
              (iter (cdr l) (insert new-c result))))))
  (iter l '()))
 

(define (resolve-single-prove s-clause checked pending)
  ;; TODO: zaimplementuj!
  ;; Poniższa implementacja działa w ten sam sposób co dla większych klauzul — łatwo ją poprawić!
  ;;Nowa implementacja
  (if (null? (res-clause-neg s-clause))
      (if (or (unsat-pos? s-clause checked)
              (unsat-pos? s-clause pending))
          (list 'unsat (res-clause-proof s-clause))
          (let* ((v (car (res-clause-pos s-clause)))
                 (new-checked (delete-pos v checked))
                 (new-pending (delete-pos v pending)))
            (resolve-prove (insert s-clause new-checked) new-pending)))
      (if (or (unsat-neg? s-clause checked)
              (unsat-neg? s-clause pending))
          (list 'unsat (res-clause-proof s-clause))
          (let* ((v (car (res-clause-neg s-clause)))
                 (new-checked (delete-neg v checked))
                 (new-pending (delete-neg v pending)))
            (resolve-prove (insert s-clause new-checked) new-pending))))

  ;;Stara implementacja            
  (let* ((resolvents   (filter-map (lambda (c) (resolve c s-clause))
                                     checked))
         (sorted-rs    (sort resolvents < #:key res-clause-size)))
    (subsume-add-prove (cons s-clause checked) pending sorted-rs)))

;; wstawianie klauzuli w posortowaną względem rozmiaru listę klauzul
(define (insert nc ncs)
  (cond
   [(null? ncs)                     (list nc)]
   [(< (res-clause-size nc)
       (res-clause-size (car ncs))) (cons nc ncs)]
   [else                            (cons (car ncs) (insert nc (cdr ncs)))]))

;; sortowanie klauzul względem rozmiaru (funkcja biblioteczna sort)
(define (sort-clauses cs)
  (sort cs < #:key res-clause-size))

(define (sort2-clauses cs)
  (sort cs > #:key res-clause-size))

;; główna procedura szukająca dowodu sprzeczności
;; zakładamy że w checked i pending nigdy nie ma klauzuli sprzecznej
(define (resolve-prove checked pending)
  (cond
   ;; jeśli lista pending jest pusta, to checked jest zamknięta na rezolucję czyli spełnialna
   [(null? pending) (generate-valuation (sort-clauses checked))]
   ;; jeśli klauzula ma jeden literał, to możemy traktować łatwo i efektywnie ją przetworzyć
   [(= 1 (res-clause-size (car pending)))
    (resolve-single-prove (car pending) checked (cdr pending))]
   ;; w przeciwnym wypadku wykonujemy rezolucję z wszystkimi klauzulami już sprawdzonymi, a
   ;; następnie dodajemy otrzymane klauzule do zbioru i kontynuujemy obliczenia
   [else
    (let* ((next-clause  (car pending))
           (rest-pending (cdr pending))
           (resolvents   (filter-map (lambda (c) (resolve c next-clause))
                                     checked))
           (sorted-rs    (sort-clauses resolvents)))
      (subsume-add-prove (cons next-clause checked) rest-pending sorted-rs))]))

;; procedura upraszczająca stan obliczeń biorąc pod uwagę świeżo wygenerowane klauzule i
;; kontynuująca obliczenia. Do uzupełnienia.
(define (subsume-add-prove checked pending new)
  (cond
   [(null? new)                 (resolve-prove checked pending)]
   ;; jeśli klauzula do przetworzenia jest sprzeczna to jej wyprowadzenie jest dowodem sprzeczności
   ;; początkowej formuły
   [(clause-false? (car new))   (list 'unsat (res-clause-proof (car new)))]
   ;; jeśli klauzula jest trywialna to nie ma potrzeby jej przetwarzać
   [(clause-trivial? (car new)) (subsume-add-prove checked pending (cdr new))]
   [else
    ;; TODO: zaimplementuj!
    ;; Poniższa implementacja nie sprawdza czy nowa klauzula nie jest lepsza (bądź gorsza) od już
    ;; rozpatrzonych; popraw to!
    ;;Nowa implementacja
    (if (or (easier (car new) checked)
            (easier (car new) pending))
            (subsume-add-prove checked pending (cdr new))
            (let ((new-checked (delete-easier (car new) checked))
                  (new-pending (delete-easier (car new) pending)))
              (subsume-add-prove new-checked (insert (car new) new-pending) (cdr new))))
    ]))

(define (delete-easier c l)
  (define (iter l result)
    (if (null? l)
        result
        (if (easier2 (car l) c)
            (iter (cdr l) result)
            (iter (cdr l) (append result (list (car l)))))))
  (iter l '()))

(define (include-list l1 l2)
    (cond [(null? l1) true]
          [(null? l2) false]
          [else
           (if (var=? (car l1) (car l2))
               (include-list (cdr l1) (cdr l2))
               (if (var<? (car l2) (car l1))
                   (include-list l1 (cdr l2))
                   false))]))

(define (easier c l)
  (if (null? l)
      false
      (if (and (include-list (res-clause-pos (car l)) (res-clause-pos c))
               (include-list (res-clause-neg (car l)) (res-clause-neg c)))
          true
          (easier c (cdr l)))))

(define (easier2 c1 c2)
      (if (and (include-list (res-clause-pos c2) (res-clause-pos c1))
               (include-list (res-clause-neg c2) (res-clause-neg c1)))
          true
          false))

(define (delete-var v l)
  (define (iter l result)
    (if (null? l)
        result
        (if (var=? v (car l))
            (iter (cdr l) result)
            (iter (cdr l) (append result (list (car l)))))))
  (iter l '()))


(define (generate-valuation resolved)
  (define (delete-easier l)
    (define (iter l result)
      (if (null? l)
          result
          (if (easier (car l) (cdr l))
              (iter (cdr l) result)
              (iter (cdr l) (append result (list (car l)))))))
    (iter l '()))
(define (simplify-pos v clauses)
  (define (iter l result)
   (if (null? l)
       result
       (let ((c (car l)))
         (if (find v (res-clause-pos c))
             (iter (cdr l) result)
             (if (find v (res-clause-neg c))
                 (let ((new-neg (delete-var v (res-clause-neg c))))
                   (iter (cdr l) (append result (list (res-clause (res-clause-pos c)
                                                    new-neg (res-clause-proof c))))))
                 (iter (cdr l) (append result (list (car l)))))))))
  (iter clauses '()))

(define (simplify-neg v clauses)
  (define (iter l result)
   (if (null? l)
       result
       (let ((c (car l)))
         (if (find v (res-clause-neg c))
             (iter (cdr l) result)
             (if (find v (res-clause-pos c))
                 (let ((new-pos (delete-var v (res-clause-pos c))))
                   (iter (cdr l) (append result (list (res-clause new-pos
                                                    (res-clause-neg c)
                                                    (res-clause-proof c))))))
                 (iter (cdr l) (append result (list (car l)))))))))
  (iter clauses '()))
                 
(define (main-iter vars clauses)
  (if (null? clauses)
      (list 'sat vars)
      (let ([clauses (delete-easier (sort2-clauses clauses))])
        (let ([clauses (sort-clauses clauses)])
          (let ([c (car clauses)])
                (if (null? (res-clause-neg c))
                    (let ([v (car (res-clause-pos c))])
                      (let ([new-clauses (simplify-pos v clauses)]
                            [new-vars (append vars (list (list v true)))])
                        (main-iter new-vars new-clauses)))
                    (let ([v (car (res-clause-neg c))])
                      (let ([new-clauses (simplify-neg v clauses)]
                            [new-vars (append vars (list (list v false)))])
                        (main-iter new-vars new-clauses)))))))))
  (main-iter '() resolved))
        

;; procedura przetwarzające wejściowy CNF na wewnętrzną reprezentację klauzul
(define (form->clauses f)
  (define (conv-clause c)
    (define (aux ls pos neg)
      (cond
       [(null? ls)
        (res-clause (remove-duplicates-vars (sort pos var<?))
                    (remove-duplicates-vars (sort neg var<?))
                    (proof-axiom c))]
       [(literal-pol (car ls))
        (aux (cdr ls)
             (cons (literal-var (car ls)) pos)
             neg)]
       [else
        (aux (cdr ls)
             pos
             (cons (literal-var (car ls)) neg))]))
    (aux (clause-lits c) null null))
  (map conv-clause (cnf-clauses f)))

(define (prove form)
  (let* ((clauses (form->clauses form)))
    (subsume-add-prove '() '() clauses)))

;; procedura testująca: próbuje dowieść sprzeczność formuły i sprawdza czy wygenerowany
;; dowód/waluacja są poprawne. Uwaga: żeby działała dla formuł spełnialnych trzeba umieć wygenerować
;; poprawną waluację.
(define (prove-and-check form)
  (let* ((res (prove form))
         (sat (car res))
         (pf-val (cadr res)))
    (if (eq? sat 'sat)
        (valuate-partial pf-val form)
        (check-proof pf-val form))))

;;; TODO: poniżej wpisz swoje testy

(define a (res-clause '(a) '(k) 'axiom))
(define b (res-clause '(b) '(a h) 'axiom))
(define c (resolve a b))
(define d (res-clause '(b h) '(q w r) 'axiom))
a
b
c
d
(resolve a d)


(define c1 (res-clause (list 'p 'q) (list 'r) 'axiom))
(define c2 (res-clause '() (list 'p 'r) 'axiom))
(define c3 (res-clause (list 'q 's) '() 'axiom))
(define c4 (res-clause (list 't) '() 'axiom))
(define clauses (list c1 c2 c3 c4))
(generate-valuation clauses)


(define c21 (res-clause (list 'a 'b 'c) '() 'axiom))
(define c22 (res-clause '() (list 'a 'b 'c) 'axiom))
(define clauses2 (list c21 c22))
(generate-valuation clauses2)

(define a1 (res-clause '(a b) '(c) 'axiom))
(define a2 (res-clause '(c d) '(b) 'axiom))
(define a3 (res-clause '(a) '() 'axiom))
(define al (list a1 a2 a3))
(resolve-prove '() al)

(define b1 (res-clause '(a) '() 'axiom))
(define b2 (res-clause '() '(b) 'axiom))
(define b3 (res-clause '(c) '() 'axiom))
(define b4 (res-clause '() '(d) 'axiom))
(define bl (list b1 b2 b3 b4))
(resolve-prove '() bl)

(define d1 (res-clause '(a) '(c) 'axiom))
(define d2 (res-clause '() '(a) 'axiom))
(define d3 (res-clause '(c) '() 'axiom))
(define dl (list d1 d2 d3))
(resolve-prove '() dl)
