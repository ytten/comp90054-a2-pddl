;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p2-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell- cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 cell-14 cell-15 - cells
    red green blue - colour
    m1 m2 - matches
    k1 k2 - keys

  )
  (:init
  
    ;Initial Hero Location
    (at cell-1)
    (safe-to-leave)
    ;She starts with a free arm
    (not(holding k1))
    (not(holding k2))
    (not(holding m1))
    (not(holding m2))
    (empty-handed)
    ;Initial location of the keys
    (item-at k1 cell-1)
    (item-at k2 cell-11)
    ;Initial location of the matches
    (item-at m1 cell-6)
    (item-at m2 cell-13)
    ;Initial location of Monsters
    (contain-monster cell-14)
    ;Initial lcocation of open gates
    (contain-open-gate cell-2 red)
    (contain-open-gate cell-3 red)
    (contain-open-gate cell-4 red)
    (contain-open-gate cell-5 red)
    (contain-open-gate cell-7 red)
    (contain-open-gate cell-8 red)
    (contain-open-gate cell-9 red)
    (contain-open-gate cell-10 red)
    (contain-open-gate cell-12 green)
    ;Key uses
    (key-infinite-uses k1)
    (key-two-use k2)
    ;Key Colours
    (key-type k1 red)
    (key-type k2 green)
    ;Graph Connectivity
    (connected cell-1 cell-3)
    (connected cell-3 cell-1)
    (connected cell-3 cell-2)
    (connected cell-2 cell-3)
    (connected cell-3 cell-4)
    (connected cell-4 cell-3)
    (connected cell-3 cell-6)
    (connected cell-6 cell-3)
    (connected cell-2 cell-6)
    (connected cell-6 cell-2)
    (connected cell-4 cell-6)
    (connected cell-6 cell-4)
    (connected cell-2 cell-5)
    (connected cell-5 cell-2)
    (connected cell-4 cell-7)
    (connected cell-7 cell-4)
    (connected cell-5 cell-6)
    (connected cell-6 cell-5)
    (connected cell-6 cell-7)
    (connected cell-7 cell-6)
    (connected cell-5 cell-8)
    (connected cell-8 cell-5)
    (connected cell-6 cell-8)
    (connected cell-8 cell-6)
    (connected cell-6 cell-10)
    (connected cell-10 cell-6)
    (connected cell-6 cell-9)
    (connected cell-9 cell-6)
    (connected cell-8 cell-9)
    (connected cell-9 cell-8)
    (connected cell-9 cell-10)
    (connected cell-10 cell-9)
    (connected cell-9 cell-11)
    (connected cell-11 cell-9)
    (connected cell-12 cell-11)
    (connected cell-11 cell-12)
    (connected cell-12 cell-13)
    (connected cell-13 cell-12)
    (connected cell-13 cell-14)
    (connected cell-14 cell-13)
    (connected cell-14 cell-15)
    (connected cell-15 cell-14)




    
  )
  (:goal (and
                ;Hero's Goal Location
                (at cell-15)
                ;All gates are closed
                (not(contain-open-gate cell-2 red))
                (not(contain-open-gate cell-3 red))
                (not(contain-open-gate cell-4 red))
                (not(contain-open-gate cell-5 red))
                (not(contain-open-gate cell-7 red))
                (not(contain-open-gate cell-8 red))
                (not(contain-open-gate cell-9 red))
                (not(contain-open-gate cell-10 red))
                (not(contain-open-gate cell-12 green))
  ))
  
)
