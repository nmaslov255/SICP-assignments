(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; main
(car (cons x y))
;; rough substitution
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
(lambda (x y) x)
;; yes, will return x
