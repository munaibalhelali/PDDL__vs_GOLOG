(define (problem task1) (:domain at_work_domain)
(:objects 

n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - location
s1 s2 s3 s4 s5 s6 - station
red_bot - robot 
c1 c2 - cube
hole1 - sq_hole
)

(:init
    (is_next_to n0 n10)
    (is_next_to n0 n5)
    
    (is_next_to n1 n4)

    (is_next_to n1 n2)
    (is_next_to n2 n3)
    (is_next_to n3 n4)
    (is_next_to n4 n5)

    (is_next_to n5 n6)
    (is_next_to n5 n0)
    (is_next_to n5 n10)

    (is_next_to n6 n7)
    (is_next_to n7 n8)
    (is_next_to n8 n9)
    (is_next_to n9 n10)
    
    (plane_at s1 n1)
    (plane_at s2 n2)
    (plane_at s3 n3)
    (plane_at s4 n7)
    (plane_at s5 n8)
    (plane_at s6 n9)

    (robot_at red_bot n0)
    (empty_gripper red_bot)

    (on c1 s6)
    (on c2 s4)

    (hole_in hole1 s3)

)

(:goal (and
    (on c1 s5)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
