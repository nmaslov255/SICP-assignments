(define (deep-reverse tree) 
    (reverse (map 
        (lambda (sub) 
            (if (pair? sub)
                (deep-reverse sub)
                sub
            )
        ) tree 
    ))
)

;; testing
(define x (list (list 1 2) (list 3 4)) ) 

(newline) (display x)                ; ((1 2) (3 4))
(newline) (display (reverse x))      ; ((3 4) (1 2))
(newline) (display (deep-reverse x)) ; ((4 3) (2 1))