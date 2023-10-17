(declare-const c0 Real)
(declare-const c1 Real)
(declare-const c2 Real)
(declare-const c3 Real)
(declare-const d0 Real)
(declare-const d1 Real)
(declare-const d2 Real)
(declare-const d3 Real)

(define-fun contains ((x Real) (y Real)) Bool
	(exists ((e1 Real) (e2 Real) (e3 Real))
		(and	
			(<= e1 1) (>= e1 -1)
			(<= e2 1) (>= e2 -1)
			(<= e3 1) (>= e3 -1)
			(= (+ c0 (* c1 e1) (* c2 e2) (* c3 e3)) x)
			(= (+ d0 (* d1 e1) (* d2 e2) (* d3 e3)) y)
		)	
	)
)

;:pattern ((+ c0 (* c1 e1) (* c2 e2) (* c3 e3)) (+ d0 (* d1 e1) (* d2 e2) (* d3 e3)))

(define-fun abs ((x Real)) Real
	(ite (> x 0) x (- x))
)


(assert 
	(and	
		(contains 6 2)
		(contains 2 0)
		(contains 4 0)
		(contains 0 -2)
		(contains 0 2)
		(contains 4 0)
		(contains -2 0)
		(contains 2 -2)
	)
)

; the below lines help z3 in finding a good zonotope

(assert (= d0 0))
(assert (= d1 1))
(assert (= d2 1))
(assert (= d3 0))

(assert (= c1 0))

(check-sat)
(get-model)

