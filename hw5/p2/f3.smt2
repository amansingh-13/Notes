(define-fun f ((x Real)) Real
	(- x (ite (> x 0) x (- x)))
)

(define-fun lower_f ((l Real) (u Real)) Real (f l))
(define-fun upper_f ((l Real) (u Real)) Real (f u))


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
