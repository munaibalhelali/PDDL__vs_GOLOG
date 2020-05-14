(define (problem test_move_base) (:domain at_home_domain)
(:objects 
N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 N10 N11 N12 N13 N14 N15 N16 N17 N18 - location
red_bot - robot
ali - human
T1 - table 
D1 - drawer
fork1 - fork 
)

(:init
    (is_next_to N0 N1)
    (is_next_to N1 N3)
    (is_next_to N3 N4)
    (is_next_to N4 N5)
    (is_next_to N4 N6)
    (is_next_to N6 N7)
    (is_next_to N7 N8)
    (is_next_to N8 N9)
    (is_next_to N9 N10)
    (is_next_to N6 N12)
    (is_next_to N12 N11)
    (is_next_to N12 N13)
    (is_next_to N13 N14)
    (is_next_to N13 N18)
    (is_next_to N14 N15)
    (is_next_to N15 N16)
    (is_next_to N16 N17)


    (robot_at red_bot N0)

    (human_at ali N3)

    (plane_at T1 N5)

    (object_at D1 N14)

    (in fork1 D1)

    (not(holding red_bot fork1))
    (empty_gripper red_bot)

)

(:goal (and
    ;(holding red_bot fork1)
    (human_holding ali fork1)

    ;(on fork1 T1)
    ;(in fork1 D1)

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
