(define (square num) 
    (* num num)
)

(define (first-square-list items) 
    (if (null? items)
        '()
        (cons (square (car items)) 
              (first-square-list (cdr items))
        )
    )
)

(define (second-square-list items) 
    (map square items)
)

;; testing
(display (first-square-list (list 1 2 3 4))) ; (1 4 9 16)
(display (second-square-list (list 6 9 12))) ; (36 81 144)