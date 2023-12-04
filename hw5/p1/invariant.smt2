(define-fun invariant ((x Int) (y Int) (z Int) (i Int)) Bool
	(and	
;		(= i 0)		; this is removed in round 2
;		(< i 10)	; this is removed in round 3
		(<= i 10)
;		(> i 10)	; this is removed in round 1
		(not (= x y))	; this is removed in round 2 only in part (a)
		(not (= y z))	; additional predicate for part (b)
		(not (= z x))	; additional predicate for part (b)
	)
)

(declare-const x0 Int)
(declare-const y0 Int)
(declare-const z0 Int)
(declare-const i0 Int)

(assert	(not	(and
			(invariant 1 2 3 0)

			(=>	(and (< i0 10) (invariant x0 y0 z0 i0))
				(invariant y0 z0 x0 (+ i0 1))
			)
		)
	)
)

(check-sat)
(get-model)
