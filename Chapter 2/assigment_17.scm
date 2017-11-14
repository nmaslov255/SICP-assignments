(define (last_pair L) 
    (list-ref L 
        (- (length L) 1)
    )
)

;; Testing
(newline)
    (display 
        (last_pair (list 23 72 149 34)) ; 34
    )
(newline)