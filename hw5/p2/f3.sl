( set-logic ALL )

( define-fun f ( ( x Real ) ) Real
	(- x (ite (> x 0) x (- x)))
)

( synth-fun lower_f ( ( l Real ) ( u Real ) ) Real
	((Start Real) (StartBool Bool))
	(
		(Start Real ( (f l) (f u) l u
			(+ Start Start ) 
			(- Start Start ) 
			(* Start Start ) 
			(ite StartBool Start Start))
		)
    		(StartBool Bool (
			(or StartBool StartBool)
			(and StartBool StartBool)
			(not StartBool)
			(<= Start Start)
			(>= Start Start)
			(>= l 0.0)
			(>= u 0.0))
		)
	)
)

( synth-fun upper_f ( ( l Real ) ( u Real ) ) Real
	((Start Real) (StartBool Bool))
	(
		(Start Real ( (f l) (f u) l u
			(+ Start Start ) 
			(- Start Start ) 
			(* Start Start ) 
			(ite StartBool Start Start))
		)
    		(StartBool Bool (
			(or StartBool StartBool)
			(and StartBool StartBool)
			(not StartBool)
			(<= Start Start)
			(>= Start Start)
			(>= l 0.0)
			(>= u 0.0))
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
