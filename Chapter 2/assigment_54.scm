(load "../library/display.scm")

(define (equal? a b)
    (if (and (pair? a) (pair? b))
        (if (and (equal? (car a) (car b))
             (equal? (cdr a) (cdr b))) #t #f)
        (eq? a b)))


;; testing
(print (equal? '(this is a list) '(this is a list)))
(print (equal? '(this is a list) '(this (is a) list)))
