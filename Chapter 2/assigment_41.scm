(load "../library/display.scm")
(load "../library/signals.scm")
(load "../library/math.scm")
(load "../library/main.scm")

(define (3d-matrix size)
    (flatmap (lambda (2d) 
                (map (lambda (z) (push 2d z)) 
                     (range 1 size))) 
             (prange size)))

(define (lim-matrix matrix limit)
    (filter 
        (lambda (x) (if (<= (accumulate + 0 x) limit) #t #f)) 
        matrix))

;; testing
(printl (lim-matrix (3d-matrix 2) 4)) ; (1 1 1)
                                      ; (1 1 2)
                                      ; (1 2 1)
                                      ; (2 1 1)