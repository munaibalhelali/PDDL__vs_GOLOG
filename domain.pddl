;Header and description

(define (domain at_home_domain)

;remove requirements that are not needed
(:requirements :strips  :typing  :equality)

(:types 
    human
    robot - object
    object
    door - object
    location
    furniture - object
    container - object
    drawer - container
    plane - object
    vplane - plane
    hplane - plane
    cutlery

)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (human_name ?h - human )
    (robot_name ?bot - robot)
    (node_name ?n - location)
    (robot_at ?r - robot ?loc - location)
    (is_open ?cont - container)
    (is_goal ?curr - location)
    (is_next_to ?loc1 - location ?loc2 - location)
    (is_hplaner ?obj - vplaner)
    (is_start ?s - location)
    (is_target ?t - location)
    (plane_at ?plane - plane ?wp - location)
    (explored ?plane - plane)
    (on ?obj - object ?plane -plane)
    (holding ?bot - robot ?obj - object)
    (empty_gripper ?bot -robot)
)


; (:functions ;todo: define numeric functions here
; )

;define actions here
(:action move_base
    :parameters (?bot - robot ?from ?to - location)
    :precondition (and 
        (robot_at ?bot ?from) 
        (is_next_to ?from ?to)
    )
    :effect (and 
        (not(robot_at ?bot ?from))
            (robot_at ?bot ?to) 
    )
)

)