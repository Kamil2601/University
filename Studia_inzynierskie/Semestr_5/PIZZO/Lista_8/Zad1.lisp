(declare-const d Int)
(declare-const y Int)
(declare-const m Int)
(declare-const g Int)
(declare-const l Int)
(declare-const a Int)
(declare-const s Int)
(declare-const o Int)
 
(assert (and (>= d 1) (<= d 9)))
(assert (and (>= y 1) (<= y 9)))
(assert (and (>= m 1) (<= m 9)))
(assert (and (>= g 1) (<= g 9)))
(assert (and (>= l 1) (<= l 9)))
(assert (and (>= a 1) (<= a 9)))
(assert (and (>= s 1) (<= s 9)))
(assert (and (>= o 1) (<= o 9)))
(assert (= (+ (+ m (* 10 y) (* 100 d))
              (+ a (* 10 l) (* 100 g) (* 1000 m)))
           (+ g (* 10 o) (* 100 m) (* 1000 s))))
           
(check-sat)
(get-model)