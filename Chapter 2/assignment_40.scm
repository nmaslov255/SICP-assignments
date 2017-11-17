(load "../library/display.scm")
(load "../library/signals.scm")
(load "../library/math.scm")
(load "../library/main.scm")

(define (unique-pairs n)
    (flatmap (lambda (j) 
                (map (lambda (i) (list j i))
                     (range 1 (- j 1))))
             (range 1 n)))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) 
          (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
    (map make-pair-sum 
        (filter prime-sum? (unique-pairs n))))

(printl (prime-sum-pairs 6))