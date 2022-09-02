(define (domain UpdsideDown)

    (:requirements
        :disjunctive-preconditions
        :typing
        :negative-preconditions
        :conditional-effects
    )

    (:types
        matches keys -items
        cells
        colour
    )

    (:predicates
        ;Indicates the number of uses left in a key
        (safe-to-leave)
        (empty-handed)
        (key-infinite-uses ?k - keys)
        (key-two-use ?k - keys)
        (key-one-use ?k - keys)
        (key-used-up ?k - keys)
        ;Add other predicates needed to model this domain
        (holding ?i - items)
        (at ?c - cells)
        (connected ?c1 ?c2 -cells)
        (contain-monster ?c - cells)
        (key-type ?k - keys ?c - colour)
        (invigilated ?c - cells)
        (item-at ?i - items ?c - cells)
        (match-on-fire ?m - matches)
        (contain-open-gate ?c - cells ?cr - colour)
    )

    ;Hero can move if the
    ;    - hero is at current location
    ;    - cells are connected, 
    ;    - there is no monster in current loc and destination, and 
    ;    - destination is not invigilated
    ;Effects move the hero, and the original cell becomes invigilated.
    (:action move
        :parameters (?from ?to - cells)
        :precondition (and
                (at ?from)
                (connected ?from ?to)
                (not (contain-monster ?from))
                (not (contain-monster ?to))
                (not (invigilated ?to))
            )
        :effect (and
                (invigilated ?from)
                (not (at ?from))
                (at ?to)
            )
    )
    
    ;When this action is executed, the hero leaves a location with a monster in it
    (:action move-out-of-monster
        :parameters (?from ?to - cells)
        :precondition (and
                    (at ?from)
                    (connected ?from ?to)
                    (contain-monster ?from)
                    (safe-to-leave)
                    (not (invigilated ?to))
                )
        :effect (and
                (invigilated ?from)
                (not (at ?from))
                (at ?to)
            )
    )

    ;When this action is executed, the hero leaves a location without a monster and gets into a location with a monster
    (:action move-into-monster
        :parameters (?from ?to - cells ?m - matches)
        :precondition (and
                    (at ?from)
                    (connected ?from ?to)
                    (not (contain-monster ?from))
                    (contain-monster ?to)
                    (not (invigilated ?to))
                    (holding ?m)
                )
        :effect (and 
                (not (at ?from))
                (not (match-on-fire ?m))
                (at ?to)
                (invigilated ?from)
                (not (safe-to-leave))
            )
    )
    
    ;Hero's picks a key if he's in the same location
    (:action pick-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and
                    (empty-handed)
                    (item-at ?k ?loc)
                    (at ?loc)
                )
        :effect (and
                (not (item-at ?k ?loc))
                (holding ?k)
                (not (empty-handed))
            )
    )

    ;Hero's picks a match if he's in the same location
    (:action pick-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and
                    (empty-handed)
                    (item-at ?m ?loc)
                    (at ?loc)
                )
        :effect (and
                    (not (item-at ?m ?loc))
                    (not (empty-handed))
                    (holding ?m)
            )
    )
    
   ;Hero's drops his key. 
    (:action drop-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and
                        (holding ?k)
                        (not (empty-handed))
                        (at ?loc)
                )
        :effect (and
                    (item-at ?k ?loc)
                    (not(holding ?k))
                    (empty-handed)
                )
    )

    ;Hero's drops his match. 
    (:action drop-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
                        (holding ?m)
                        (not(empty-handed))
                        (at ?loc)
                    )
        :effect (and
                    (item-at ?m ?loc)
                    (not(holding ?m))
                    (empty-handed)
                )
    )
    
    ;Hero's disarm the trap with his hand
    (:action close-gate
        :parameters (?from ?to - cells ?k - keys ?c - colour)
        :precondition (and 
                        (connected ?from ?to)
                        (contain-open-gate ?to ?c)
                        (holding ?k)
                        (key-type ?k ?c)
                        (at ?from)
                  )
        :effect (and
                    ;When a key has two uses, then it becomes a single use
                    (when (key-infinite-uses ?k) (key-infinite-uses ?k))
                    (when (key-two-use ?k) (key-one-use ?k))
                    ;When a key has a single use, it becomes used-up
                    (when (key-one-use ?k) (key-used-up ?k))
                    (when (key-used-up ?k) (not (holding ?k)))
                    (not (contain-open-gate ?to ?c))
            )
    )

    ;Hero strikes her match
    (:action strike-match
        :parameters (?m - matches)
        :precondition (and 
                    (not (safe-to-leave))
                    (holding ?m)
                    (not (match-on-fire ?m))
        )
        :effect (and 
                (match-on-fire ?m)
                (safe-to-leave)
        )
    )
)
