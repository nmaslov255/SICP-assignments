; grow as Ө(n)
(define (element-of-set? x set) 
    (cond ((null? set) #f)
          ((equal? x (car set)) #t)
           (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) 
    (if (element-of-set? x set)
        set
        (cons x set)))

; grow as Ө(n^2)
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2) 
            (cons (car set1)
                  (intersection-set (cdr set1) set2))) 
            (else (intersection-set (cdr set1) set2))))

;; by assignment 2.59
(define (union-set set1 set2)
    (if (null? (cdr set1)) 
            set2
            (union-set (cdr set1) 
                       (adjoin-set (car set1) set2))))

;; testing
(display (union-set (list 1 2 3) (list 2 3 4 5)))