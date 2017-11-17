(define (square-list items) 
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (square (car things))
                         answer
                  )
            )
        )
    )
    (iter items '())
)

;; testing
(display (square-list (list 2 4 6))) 
;; will return (36 16 4) becouse it's equal
(iter (2 4 6) '() )                         ; call #1
(iter (4 6) (cons (4 '()) ))                ; call #2
(iter (6) (cons 16 (cons 4 '()) ))          ; call #3
(iter () (cons 32 (cons 16 (cons 4 '()) ))) ; call #4