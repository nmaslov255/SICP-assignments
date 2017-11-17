;; accumulate sublists in to list
(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (remove item sequence)
    (filter (lambda (x) (not (= x item)))
            sequence))

;; generate pair list
(define (prange size)
    (flatmap (lambda (j) 
                (map (lambda (i) (list j i))
                     (range 1 size)))
             (range 1 size)))

;; generate list
(define (range start end) 
    (if (> start end)
        '()
        (cons start (range (+ start 1) end))))

;; add symbol/number in to end of list
;; end return list
(define (push l n)
    (append l (list n)))

;; if symbol x is exist return #t else #f
(define (memq item x)
    (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(define (++ num) (+ num 1))
(define (-- num) (- num 1))

(define (count-even n) ;; from 1 to n
    (if (odd? n) (/ (-- n) 2) (n / 2) ))

(define (count-odd n) (- n (count-even n)))
