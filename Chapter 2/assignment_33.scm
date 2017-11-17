(load "../library/display.scm")
(load "../library/signals.scm")

(define (map p sequence)
    (accumulate (lambda (el init) (cons (p el) init)) '() sequence))

(define (append seq1 seq2) 
    (accumulate cons seq2 seq1)
)

(define (length sequence) 
    (accumulate (lambda (el init) (+ 1 init)) 0 sequence)
)

;; testing
(print (map (lambda (el) (* el el)) (list 1 2 3 4))) ; (1 4 9 16) 
(print (append (list 1 2) (list 3 4))) ; (1 2 3 4)
(print (length (list 3 4 1 3 4))) ; (5)
