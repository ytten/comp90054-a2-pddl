;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p3-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 - cells
    red green blue - colour
    m1 - matches
    k1 k2 k3 - keys

  )
  (:init
  
    ;Initial Hero Location
    (at cell-1)
    (safe-to-leave)
    ;She starts with a free arm
    (not(holding k1))
    (not(holding k2))
    (not(holding k3))
    (not(holding m1))
    (empty-handed)
    ;Initial location of the keys
    (item-at k1 cell-9)
    (item-at k2 cell-5)
    (item-at k3 cell-12)
    
    ;Initial location of the matches
    (item-at m1 cell-5)
    ;Initial location of Monsters
    (contain-monster cell-11)
    ;Initial lcocation of open gates
    (contain-open-gate cell-2 red)
    (contain-open-gate cell-3 red)
    (contain-open-gate cell-10 red)
    (contain-open-gate cell-7 red)
    (contain-open-gate cell-4 green)
    (contain-open-gate cell-6 green)
    (contain-open-gate cell-12 blue)

    ;Key uses
    (key-infinite-uses k1)
    (key-two-use k2)
    (key-one-use k3)
    ;Key Colours
    (key-type k1 red)
    (key-type k2 green)
    (key-type k3 blue)
    ;Graph Connectivity
    (connected cell-1 cell-2)
    (connected cell-2 cell-1)
    (connected cell-1 cell-8)
    (connected cell-8 cell-1)
    (connected cell-2 cell-3)
    (connected cell-3 cell-2)
    (connected cell-3 cell-8)
    (connected cell-8 cell-3)
    (connected cell-2 cell-9)
    (connected cell-9 cell-2)
    (connected cell-8 cell-9)
    (connected cell-9 cell-8)
    (connected cell-3 cell-4)
    (connected cell-4 cell-3)
    (connected cell-9 cell-10)
    (connected cell-10 cell-9)
    (connected cell-3 cell-10)
    (connected cell-10 cell-3)
    (connected cell-9 cell-4)
    (connected cell-4 cell-9)
    (connected cell-4 cell-11)
    (connected cell-11 cell-4)
    (connected cell-10 cell-5)
    (connected cell-5 cell-10)
    (connected cell-4 cell-5)
    (connected cell-5 cell-4)
    (connected cell-10 cell-11)
    (connected cell-11 cell-10)
    (connected cell-5 cell-12)
    (connected cell-12 cell-5)
    (connected cell-11 cell-6)
    (connected cell-6 cell-11)
    (connected cell-5 cell-6)
    (connected cell-6 cell-5)
    (connected cell-11 cell-12)
    (connected cell-12 cell-11)
    (connected cell-6 cell-13)
    (connected cell-13 cell-6)
    (connected cell-6 cell-7)
    (connected cell-7 cell-6)
    (connected cell-12 cell-7)
    (connected cell-7 cell-12)
    (connected cell-12 cell-13)
    (connected cell-13 cell-12)
  )
  (:goal (and
                ;Hero's Goal Location
                (at cell-13)
                ;All gates are closed
                (not(contain-open-gate cell-2 red))                
                (not(contain-open-gate cell-3 red))                
                (not(contain-open-gate cell-10 red))                
                (not(contain-open-gate cell-8 red))
                (not(contain-open-gate cell-7 red))                
                (not(contain-open-gate cell-4 green))                
                (not(contain-open-gate cell-6 green))
                (not(contain-open-gate cell-12 blue))                
  ))
  
)
