(define (for-each func list)
    (func (car list))

    (if (null? (cdr list))
        #t
        (for-each func (cdr list))
    )
)

;; testing
(for-each 
    (lambda (x) (newline) (display x)) 
    (list 57 321 88)
)