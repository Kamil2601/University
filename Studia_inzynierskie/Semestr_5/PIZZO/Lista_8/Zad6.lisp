(declare-const p Bool)
(declare-const q Bool)

(push)
(assert (and
          (not (= p q))
          (not (= (not p) (not q)))
          (not (= p (not q))))
)
(check-sat)
(get-model)
(pop)
