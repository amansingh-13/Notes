(define-fun f ((x Real)) Real
	(ite (> (* x x) (* (* x x) x)) (* x x) (* (* x x) x))
)

(define-fun lower_f ((l Real) (u Real)) Real (let ((_let_1 (f u))) (let ((_let_2 (f l))) (ite (<= (* l u) 0.0) 0.0 (ite (<= _let_2 _let_1) _let_2 _let_1)))))
(define-fun upper_f ((l Real) (u Real)) Real (let ((_let_1 (f l))) (let ((_let_2 (f u))) (ite (<= _let_1 _let_2) _let_2 _let_1))))

(declare-const l Real)
(declare-const u Real)
(declare-const l_Tf Real)
(declare-const u_Tf Real)

(assert (= l_Tf (lower_f l u)))
(assert (= u_Tf (upper_f l u)))
(assert (<= l u))

(assert ( not
		( exists ( ( cl Real ) ( cu Real ) )
			( and
				( >= cl l )
				( <= cl u )
				( = l_Tf ( f cl ) )
				( >= cu l )
				( <= cu u )
				( = u_Tf ( f cu ) )
			)
		)
	)
)

(check-sat)
(get-model)
