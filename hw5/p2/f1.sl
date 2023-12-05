( set-logic ALL )

( define-fun f ( ( x Real ) ) Real
	( ite ( > x 0 ) x ( - x ) )
)

( synth-fun lower_f ( ( l Real ) ( u Real ) ) Real
	((Start Real) (StartBool Bool))
	(
		(Start Real ( (f l) (f u) 
			(ite StartBool 0.0 Start)
			(ite StartBool Start Start))
		)
    		(StartBool Bool (
			(or StartBool StartBool)
			(and StartBool StartBool)
			(not StartBool)
			(<= (* l u) 0.0)
			(<= (f l) (f u))
			(<= Start Start))
		)
	)
)

( synth-fun upper_f ( ( l Real ) ( u Real ) ) Real
	((Start Real) (StartBool Bool))
	(
		(Start Real ( (f l) (f u) 
			(ite StartBool Start Start))
		)
    		(StartBool Bool (
			(or StartBool StartBool)
			(and StartBool StartBool)
			(not StartBool)
			(<= Start Start)
			(<= l 0.0)
			(<= u 0.0))
		)
	)
)

( declare-var x Real )
( declare-var l Real )
( declare-var u Real )
( declare-var fx Real )
( declare-var lf Real )
( declare-var uf Real )

( constraint 
	( =>
		( and ( <= l x ) ( <= x u ) )
		( and 
			( <= ( lower_f l u ) ( f x ) )
			( <= ( f x ) ( upper_f l u ) )
		)
	)
)

( check-synth )
