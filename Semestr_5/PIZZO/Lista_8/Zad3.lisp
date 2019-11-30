;; Kazdy produkt 0 lub 1 raz

(declare-const ziemniaki Int)
(declare-const surowka Int)
(declare-const zupa Int)
(declare-const kasza Int)
(declare-const makaron Int)
(declare-const schabowy Int)

(push)

(assert (or (= ziemniaki 430) (= ziemniaki 0)))
(assert (or (= surowka 550) (= surowka 0)))
(assert (or (= zupa 670) (= zupa 0)))
(assert (or (= kasza 710) (= kasza 0)))
(assert (or (= makaron 820) (= makaron 0)))
(assert (or (= schabowy 1060) (= schabowy 0)))

(assert (= (+ ziemniaki surowka zupa kasza makaron schabowy) 3010))

(check-sat)
(get-model)

(push)

;; -----------------------------------------------------------------

;; Wiele razy jeden produkt

;; (declare-const ziemniaki Int)
;; (declare-const surowka Int)
;; (declare-const zupa Int)
;; (declare-const kasza Int)
;; (declare-const makaron Int)
;; (declare-const schabowy Int)


(push)
(assert (>= ziemniaki 0))
(assert (>= surowka 0))
(assert (>= zupa 0))
(assert (>= kasza 0))
(assert (>= makaron 0))
(assert (>= schabowy 0))

(assert (= (+
    (* 430 ziemniaki)
    (* 550 surowka)
    (* 670 zupa)
    (* 710 kasza)
    (* 820 makaron)
    (* 1060 schabowy))
  3010 ))

(check-sat)
(get-model)

(pop)