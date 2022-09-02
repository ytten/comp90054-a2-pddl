;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p1-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell- cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 - cells
    red green blue - colour
    m1 - matches
    k1 k2 k3 - keys
  )
  (:init 

    ;Initial Hero Location
    (at cell-1)
    ;She starts with a free arm
    (not (holding m1))
    (not (holding k1))
    (not (holding k2))
    (not (holding k3))
    (empty-handed)
    ;Initial location of the keys
    (item-at k1 cell-2)
    (item-at k2 cell-8)
    (item-at k3 cell-10)
    ;Initial location of the matches
    (item-at m1 cell-4)
    (not (match-on-fire m1))
    ;Initial location of Monsters
    (contain-monster cell-3)
    ;Initial location of open gates
    (contain-open-gate cell-5 red)
    (contain-open-gate cell-6 green)
    (contain-open-gate cell-7 blue)
    (contain-open-gate cell-9 green)
    ;Key uses
    (key-one-use k3)
    (key-two-use k2)
    (key-infinite-uses k1)
    ;Key Colours
    (key-type k3 blue)
    (key-type k2 green)
    (key-type k1 red)
    ;Graph Connectivity
    (connected cell-1 cell-2)
    (connected cell-2 cell-3)
    (connected cell-2 cell-5)
    (connected cell-3 cell-4)
    (connected cell-3 cell-6)
    (connected cell-5 cell-6)
    (connected cell-5 cell-8)
    (connected cell-4 cell-7)
    (connected cell-6 cell-7)
    (connected cell-6 cell-9)
    (connected cell-7 cell-10)
    (connected cell-9 cell-10)
    (connected cell-2 cell-1)
    (connected cell-3 cell-2)
    (connected cell-5 cell-2)
    (connected cell-4 cell-3)
    (connected cell-6 cell-3)
    (connected cell-6 cell-5)
    (connected cell-8 cell-5)
    (connected cell-8 cell-9)
    (connected cell-9 cell-8)
    (connected cell-7 cell-4)
    (connected cell-7 cell-6)
    (connected cell-9 cell-6)
    (connected cell-10 cell-7)
    (connected cell-10 cell-9)
    (connected cell-3 cell-11)
    (connected cell-11 cell-3)
  )
  (:goal (and
                ;Hero's Goal Location
                (at cell-11)
                (not (contain-open-gate cell-5 red))
                (not (contain-open-gate cell-6 green))
                (not (contain-open-gate cell-7 blue))
                (not (contain-open-gate cell-9 green))
                ;All gates are closed

  ))
  
)