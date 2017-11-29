(define (make-from-real-imag x y)
    (make-from-real-imag-rectangular x y))

(define (make-from-mag-ang r a)
    (make-from-mag-ang-polar r a))

(define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
                         (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
                         (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                       (+ (angle z1) (angle z2)))

(define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                       (- (angle z1) (angle z2))))

(define (real-part z) 
    (cond ((rectangular? z) (real-part-rectangular (contents z))) 
          ((polar? z) (real-part-polar (contents z)))
          (else (error "Undefined type -- REAL-PART" z))))

(define (imag-part z) 
    (cond ((rectangular? z) (imag-part-rectangular (contents z))) 
          ((polar? z) (imag-part-polar (contents z)))
          (else (error "Undefined type -- IMAG-PART" z))))

(define (magnitude z) 
    (cond ((rectangular? z) (magnitude-rectangular (contents z)))
          ((polar? z) (magnitude-polar (contents z)))
           (else (error "Undefined type -- MAGNITUDE" z))))

(define (angle z)
    (cond ((rectangular? z) (angle-rectangular (contents z))) 
          ((polar? z) (angle-polar (contents z)))
           (else (error "Undefined type -- ANGLE" z))))

; first module
(define (real-part-rectangular z) (car z))
(define (imag-part-rectangular z) (cdr z))

(define (magnitude-rectangular z)
    (sqrt (+ (square (real-part-rectangular z)) 
             (square (imag-part-rectangular z)))))

(define (angle-rectangular z)
    (atan (imag-part-rectangular z) 
          (real-part-rectangular z)))

(define (make-from-mag-ang-rectangular r a)
    (cons (* r (cos a)) (* r (sin a))))

(define (make-from-real-imag-rectangular x y) (cons x y))

; second module
(define (real-part-polar z)
    (* (magnitude-polar z) (cos (angle-polar z))))

(define (imag-part-polar z)
    (* (magnitude-polar z) (sin (angle-polar z))))

(define (magnitude-polar z) (car z))
(define (angle-polar z) (cdr z))

(define (make-from-real-imag-polar x y)
    (cons (sqrt (+ (square x) (square y)))
          (atan y x)))

(define (make-from-mag-ang-polar r a) (cons r a))

; type data
(define (attach-tag type-tag contents)
    (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Incorrect -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Incorrect -- CONTENTS" datum)))

(define (rectangular? z)
    (eq? (type-tag z) 'rectangular))

(define (polar? z)
    (eq? (type-tag z) 'polar))


; data-direct programming
(define (install-rectangular-package)
    ;; inside procedure
    (define (real-part z) (car z))
    (define (imag-part z) (cdr z))
    (define (make-from-real-imag x y) (cons x y)) 

    (define (magnitude z)
        (sqrt (+ (square (real-part z)) 
                 (square (imag-part z)))))

    (define (angle z)
        (atan (imag-part z) (real-part z)))

    (define (make-from-mag-ang r a)
        (cons (* r (cos a)) (* r (sin a))))

    ;; interface for other system
    (define (tag x) (attach-tag 'rectangular x))

    (put 'real-part '(rectangular) real-part) 
    (put 'imag-part '(rectangular) imag-part) 
    (put 'magnitude '(rectangular) magnitude) 
    (put 'angle '(rectangular) angle)
    (put 'make-from-real-imag 'rectangular
        (lambda (x y) (tag (make-from-real-imag x y))))
    (put 'make-from-mag-ang 'rectangular
        (lambda (r a) (tag (make-from-mag-ang r a))))

'done)

(define (install-polar-package)
    ;; inside procedure
    (define (make-from-mag-ang r a) (cons r a)) 
    (define (magnitude z) (car z))
    (define (angle z) (cdr z))

    (define (real-part z)
        (* (magnitude z) (cos (angle z)))) 
    
    (define (imag-part z)
        (* (magnitude z) (sin (angle z)))) 

    (define (make-from-real-imag x y)
        (cons (sqrt (+ (square x) (square y))) (atan y x)))

    ;; interface for other system
    (define (tag x) (attach-tag 'polar x)) 

    (put 'real-part '(polar) real-part) 
    (put 'imag-part '(polar) imag-part) 
    (put 'magnitude '(polar) magnitude) 
    (put 'angle '(polar) angle)
    (put 'make-from-real-imag 'polar
        (lambda (x y) (tag (make-from-real-imag x y))))
    (put 'make-from-mag-ang 'polar
        (lambda (r a) (tag (make-from-mag-ang r a))))

'done)

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args)) 
                (error "Not exist method -- APPLY-GENERIC" 
                       (list op type-tags))))))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z)) 
(define (magnitude z) (apply-generic 'magnitude z)) 
(define (angle z) (apply-generic 'angle z))

(define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))

(define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))

;; dispatch message
(define (make-from-real-imag x y) 
    (define (dispatch op)
        (cond ((eq? op 'real-part) x) 
              ((eq? op 'imag-part) y)
              ((eq? op 'magnitude)
                    (sqrt (+ (square x) (square y))))
              ((eq? op 'angle) (atan y x)) 
              (else (error "Undefined op. -- MAKE-FROM-REAL-IMAG" op)))) 
    dispatch)

(define (apply-generic op arg) (arg op))