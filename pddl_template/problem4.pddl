;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p4-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
           ;add objects and their types
      cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 - cells
      k1 k2 k3 - keys
      m1 - matches
      red green blue - colour 

  )
  (:init
  
    ;Initial Hero Location
    (at cell-1)
    (safe-to-leave)
    ;He starts with a free arm
    (not(holding k1))
    (not(holding k2))
    (not(holding k3))
    (not(holding m1))
    (empty-handed)
    
    ;Initial location of the keys
    (item-at k1 cell-2)
    (item-at k2 cell-3)
    (item-at k3 cell-4)

    (key-type k1 red)
    (key-type k2 green)
    (key-type k3 blue)
    
    (item-at m1 cell-8)
    ;Initial location of Monsters
    (contain-monster cell-9)
    
    (contain-open-gate cell-2 red)
    (contain-open-gate cell-3 red)
    (contain-open-gate cell-8 red)
    (contain-open-gate cell-6 green)
    (contain-open-gate cell-4 green)
    (contain-open-gate cell-7 blue)
    
    ;Graph Connectivity
    (connected cell-1 cell-2)
    (connected cell-2 cell-1)
    (connected cell-2 cell-3)
    (connected cell-3 cell-2)
    (connected cell-3 cell-4)
    (connected cell-4 cell-3)
    (connected cell-4 cell-5)
    (connected cell-5 cell-4)
    (connected cell-5 cell-6)
    (connected cell-6 cell-5)
    (connected cell-6 cell-7)
    (connected cell-7 cell-6)
    (connected cell-7 cell-8)
    (connected cell-8 cell-7)
    (connected cell-8 cell-9)
    (connected cell-9 cell-8)
    (connected cell-9 cell-10)
    (connected cell-10 cell-9)
    
  )
  (:goal (and
            (at cell-10)

            (or
              (and 
                (contain-open-gate cell-2 red)
                (contain-open-gate cell-3 red)
                (contain-open-gate cell-8 red)
              )

              (and 
                (contain-open-gate cell-2 red)
                (contain-open-gate cell-3 red)
                (not (contain-open-gate cell-8 red))
              )

              (and 
                (contain-open-gate cell-2 red)
                (not (contain-open-gate cell-3 red))
                (contain-open-gate cell-8 red)
              )

              (and 
                (not (contain-open-gate cell-2 red))
                (contain-open-gate cell-3 red)
                (contain-open-gate cell-8 red)
              )
              (and 
                (not (contain-open-gate cell-2 red))
                (not (contain-open-gate cell-3 red))
                (contain-open-gate cell-8 red)
              )
              (and 
                (not (contain-open-gate cell-2 red))
                (contain-open-gate cell-3 red)
                (not(contain-open-gate cell-8 red))
              )
              (and 
                (contain-open-gate cell-2 red)
                (not (contain-open-gate cell-3 red))
                (not (contain-open-gate cell-8 red))
              )
            )

            (or
              (and 
                (contain-open-gate cell-6 green)
                (not(contain-open-gate cell-4 green))
              )

              (and
                (not(contain-open-gate cell-6 green))
                (contain-open-gate cell-4 green)
              )

              (and
                (contain-open-gate cell-6 green)
                (contain-open-gate cell-4 green)
              )
            )

            (contain-open-gate cell-7 blue)

            
            (invigilated cell-1)
            (invigilated cell-2)
            (invigilated cell-3)
            (invigilated cell-4)
            (invigilated cell-5)
            (invigilated cell-6)
            (invigilated cell-7)
            (invigilated cell-8)
            (invigilated cell-9)
            ;Hero's Goal Location
            
  ))
  
)
