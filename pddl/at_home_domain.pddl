;Header and description

(define (domain at_home_domain)

;remove requirements that are not needed
(:requirements :strips  :typing  :equality)

(:types 
    object
    concept
    human
    robot - object
    location 
    plane - concept
    container - object
    cutlery - object

    drawer - container
    table - plane 
    fork - cutlery
   
    

)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (human_at ?person - human ?at - location)
    (robot_at ?bot - robot ?loc - location)
    (object_at ?obj - cutlery ?at - location)
    (plane_at ?pla - plane ?wp - location)
    (is_open ?cont - container)
    (is_next_to ?loc1 - location ?loc2 - location)
    (on ?obj - object ?pla - plane)
    (in ?obj - object ?cont - container)
    (holding ?bot - robot ?obj - object)
    (human_holding ?person - human ?obj - object)
    (empty_gripper ?bot - robot)
)


; (:functions ;todo: define numeric functions here
; )

;define actions here
(:action move_base
    :parameters (?bot - robot ?from ?to - location)
    :precondition (and 
        (robot_at ?bot ?from) 
        (or(is_next_to ?from ?to) (is_next_to ?to ?from) )
    )
    :effect (and 
        (not(robot_at ?bot ?from))
            (robot_at ?bot ?to) 
    )
)

(:action plane_pick_up
    :parameters (?bot - robot ?obj - object ?from - plane ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (plane_at ?from ?at)
                    (on ?obj ?from)
                    (empty_gripper ?bot)
    )
    :effect (and (not(on ?obj ?from))
                (not(empty_gripper ?bot))
                (holding ?bot ?obj)
    )
)
(:action container_pick_up
    :parameters (?bot - robot ?obj - object ?from - container ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (object_at ?from ?at)
                    (in ?obj ?from)
                    (empty_gripper ?bot)
    )
    :effect (and (not(in ?obj ?from))
                (not(empty_gripper ?bot))
                (holding ?bot ?obj)
    )
)
(:action place_on
    :parameters (?bot - robot ?obj - object ?on - plane ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (plane_at ?on ?at)
                    (holding ?bot ?obj)
    )
    :effect (and (on ?obj ?on)
                (empty_gripper ?bot)
                (not(holding ?bot ?obj))
    )
)
(:action place_in
    :parameters (?bot - robot ?obj - object ?in - container ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (object_at ?in ?at)
                    (holding ?bot ?obj)
    )
    :effect (and (in ?obj ?in)
                (empty_gripper ?bot)
                (not(holding ?bot ?obj))
    )
)
(:action hand_over
    :parameters (?person - human ?bot - robot ?obj - object ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (human_at ?person ?at)
                    (holding ?bot ?obj)
                    (not(empty_gripper ?bot))
    )
    :effect (and (human_holding ?person ?obj)
                (empty_gripper ?bot)
                (not(holding ?bot ?obj)) )
)


)