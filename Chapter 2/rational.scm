(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))

(define (equal-rat? x y)
    (= (* (numer x) (denom y))
       (* (numer y) (denom x))))

(define (make-rat numer denom)
    ;; by assigment 2.1
    (cond ((and (< 0 denom) (< 0 numer)) 
                (abs denom) (abs numer))
          ((and (< 0 denom) (> 0 numer))
                (abs denom) (- numer)))
          
    (let ((comdiv (gcd numer denom) )) ; comdiv - common divisor
        (cons (/ numer comdiv) (/ denom comdiv))))
    

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define numer car)
(define denom cdr)