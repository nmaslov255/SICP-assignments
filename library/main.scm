(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (remove item sequence)
    (filter (lambda (x) (not (= x item)))
            sequence))

(define (prange size)
    (flatmap (lambda (j) 
                (map (lambda (i) (list j i))
                     (range 1 size)))
             (range 1 size)))

(define (range start end) 
    (if (> start end)
        '()
        (cons start (range (+ start 1) end))))

(define (push l n)
    (append l (list n)))
