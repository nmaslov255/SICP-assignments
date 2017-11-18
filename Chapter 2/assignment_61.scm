(load "../library/ordered-sets.scm")

(define (adjoin-set x set)
    (cond ((null? x) set)
          ((null? set) (list x))
          ((= (car set) x) set)
          ((> (car set) x) (cons x set))
           (else (cons (car set) (adjoin-set x (cdr set)))) ))

;; testing
(display (adjoin-set 5 (list 2 4 6 8)))
(display (adjoin-set 5 (list 6 8 10)))
(display (adjoin-set 5 (list 2 3 4 5 6 7)))
