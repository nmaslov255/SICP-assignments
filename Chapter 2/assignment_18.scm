(define (new_reverse L)
    (define (iter L count)
        (if (< count 0)
            '()
            (cons 
                (list-ref L count) 
                (iter L (- count 1))
            )
        )
    )

    (iter L (- (length L) 1))
)

;; testing
(display (new_reverse (list 1 2 3))) ; (3 2 1)