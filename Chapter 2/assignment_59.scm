(load "../library/sets.scm")

(define (union-set set1 set2)
    (if (null? (cdr set1)) 
            set2
            (union-set (cdr set1) 
                       (adjoin-set (car set1) set2))))

;; testing
(display (union-set (list 1 2 3) (list 2 3 4 5)))