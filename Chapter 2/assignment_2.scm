;; First barrier of abstraction
(define (print-point p) 
    (newline)
    (display "(") 
        (display (x-point p)) (display ",") (display (y-point p)) 
    (display ")"))

;; Second barrier of abstraction
(define (midpoint segment)
    (define (average a b) (/ (+ a b) 2))

    (cons (average (x-point (start-segment segment))
                   (x-point (end-segment segment)) ) 
          (average (y-point (start-segment segment))
                   (y-point (end-segment segment)) ) 
    )
)

;; Third barrier of abstraction
(define make-segment cons)
    (define start-segment car)
    (define end-segment cdr)

(define make-point cons)
    (define x-point car)
    (define y-point cdr)

;; Main
(define first-segment 
    (make-segment (make-point 2 3) 
                  (make-point 7 6)
    )
)

(define second-segment 
    (make-segment (make-point 1 3) 
                  (make-point 7 1)
    )
)

;; Testing
(print-point (midpoint first-segment))  ; (9/2,9/2)
(print-point (midpoint second-segment)) ; (4,2)

