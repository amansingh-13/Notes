(define-fun f ((x Real)) Real
	(* (* x x) x)
)

(define-fun lower_f ((l Real) (u Real)) Real (* (* l l) l))
(define-fun upper_f ((l Real) (u Real)) Real (* (* u u) u))

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
