(define (domain blocksworld) 
  (:requirements :strips) 		; STRIPS required
  (:predicates (on ?x ?y) 		; block ?x is on block ?y
	       (ontable ?x)		; block ?x on the table
	       (clear ?x)		; no block is on block ?x
	       (handempty)		; robot’s arm is empty
	       (holding ?x)		; robot’s arm is holding ?x
	       )
  (:action pick-up			; action „pick up from the table”
	     :parameters (?block)
	     :precondition (and (clear ?block) (ontable ?block) (handempty))
	     :effect
	     (and (not (ontable ?block))
		  (not (clear ?block))
		  (not (handempty))
		  (holding ?block)))
  (:action stack            ; action stack block X on top of block Y
        :parameters (?block1 ?block2)
	    :precondition (and (holding ?block1) (clear ?block2))
	    :effect
	     (and (not (holding ?block1))
		  (not (clear ?block2))
		  (on ?block1 ?block2)
		  (clear ?block1)
		  (handempty)))
  (:action put-table			;  action „put on the table”
	     :parameters (?block)
	     :precondition (holding ?block)
	     :effect
	      (and (ontable ?block)
		  (clear ?block)
		  (handempty)
		  (not (holding ?block))))    
  (:action take-off			    ;action „take block A off block B” 
	     :parameters (?block1 ?block2)
	     :precondition (and (on ?block1 ?block2) (clear ?block1) (handempty))
	     :effect
	      (and (holding ?block1)
	      (not (on ?block1 ?block2))
		  (clear ?block2)
		  (not (handempty))
		  (not (clear ?block1)))) 		  

)