(define (print result) 
            (display ">>> ") 
            (display result)
            (newline)
)

(define (newline-print result)
    (newline) (display " ") (display result))

(define (printl list)
    (display "{")
        (for-each (lambda (l) (newline-print l)) 
                  list)
        (newline)
    (display "}"))

(define (echo list)
    (display ">>> ")
    (for-each (lambda (s) (display s)) list) (newline))