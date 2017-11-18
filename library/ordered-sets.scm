; grow as Ө(n/2)
(define (element-of-set? x set) 
    (cond ((null? set) '())
          ((= x (car set)) #t)
          ((< x (car set)) #f)
          (else (element-of-set? x (cdr set)))))

; grow as Ө(n)
;  set1 = {     | 4 6 | 8 10 }
;  set2 = { 0 2 | 4 6 |      }
(define (intersection-set set1 set2) 
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
              (cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
                    ((< x1 x2) (intersection-set (cdr set1) set2))
                    ((< x2 x1) (intersection-set set1 (cdr set2)))))))

; assignment by 2.61
(define (adjoin-set x set)
    (cond ((null? x) set)
          ((null? set) (list x))
          ((= (car set) x) set)
          ((> (car set) x) (cons x set))
           (else (cons (car set) (adjoin-set x (cdr set)))) ))

; assigment by 2.62
(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
           (else (let ((x1 (car set1)) (x2 (car set2)))
                 (cond ((> x1 x2) (cons x2 (union-set set1 (cdr set2) )))
                       ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                       ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2)))))))))

;; testing
(display (adjoin-set 5 (list 2 4 6 8)))
(display (adjoin-set 5 (list 6 8 10)))
(display (adjoin-set 5 (list 2 3 4 5 6 7)))

(display (union-set (list 4 6 8 10) (list 0 2 4 6)))