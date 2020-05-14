;Header and description

(define (domain at_work_domain)

;remove requirements that are not needed
(:requirements :strips  :typing )

(:types 
    object
    concept
    robot
    plane
    cube - object
    location
    hole - concept
    sq_hole - hole
    rnd_hole - hole 
    station - plane
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (robot_at ?bot - robot ?loc - location)
    (hole_in ?hol - hole ?st - plane)
    (plane_at ?st - plane ?at - location)

    (on ?obj - object ?st - station)
    (in ?obj - object ?hol - hole)

    (holding ?bot - robot ?obj - object)
    (empty_gripper ?bot - robot)

    (is_next_to ?loc1 - location ?loc2 - location)
)


;(:functions ;todo: define numeric functions here
;)

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

(:action hole_pick_up
    :parameters (?bot - robot ?obj - object ?from - hole ?in - plane ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (hole_in ?from ?in)
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
    :parameters (?bot - robot ?obj - object ?in - hole ?st - plane ?at - location)
    :precondition (and
                    (robot_at ?bot ?at)
                    (plane_at ?st ?at)
                    (hole_in ?in ?st)
                    (holding ?bot ?obj)
    )
    :effect (and (in ?obj ?in)
                (empty_gripper ?bot)
                (not(holding ?bot ?obj))
    )
)
)