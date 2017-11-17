(load "main.scm")
(load "display.scm")

; decomposition lisp expressive (+ 1 2 3) as 1 + 2 + 3
; by assigment 2.58
(define (explode elm sep)
    (define len (+ (length elm) (-- (length elm))))

    (map (lambda (n) (if (odd? n) 
            (list-ref elm (-- (count-odd n))) 
             sep)) 
         (range 1 len)))

(define (decexp exp)
    (map (lambda (sub) (if (list? sub) (decexp sub) sub)) 
         (explode (cdr exp) (car exp))))

;; testing
(define testexp1 '(* 2 4 6))
(define testexp2 '(+ (* 2 4) (* 3 6)))
(define testexp3 '(+ (* 2 (/ 4 2)) 6))

(print (explode (cdr testexp1) (car testexp1))) ; (2 * 4 * 6)
(print (explode (cdr testexp2) (car testexp2))) ; ((* 2 4) + (* 3 6))
(print (explode (cdr testexp3) (car testexp3))) ; ((* 2 (/ 4 2)) + 6)

(print (decexp testexp1)) ; (2 * 4 * 6)
(print (decexp testexp2)) ; ((2 * 4) + (3 * 6))
(print (decexp testexp3)) ; ((2 * (4 / 2)) + 6)