(load "../library/huffman-tree.scm")
(load "../library/display.scm")
(load "../library/main.scm")


(define (encode-symbol s tree)
    (let ((left-s  (symbols (left-branch tree)))
          (right-s (symbols (right-branch tree))))
            (cond ((exist-in? s left-s) 
                        (if (= 1 (length left-s))
                                 (cons 0 '())
                                 (cons 0 (encode-symbol s (left-branch tree) )) ))
                   ((exist-in? s right-s) 
                        (if (= 1 (length right-s))
                                 (cons 1 '())
                                 (cons 1 (encode-symbol s (right-branch tree) )) ))
                    (else (error "Not known symbol"))) ))


(define (encode message tree) 
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))


(define tree (make-code-tree (make-leaf 'A 8)
                             (make-code-tree
                                (make-code-tree (make-leaf 'B 3)
                                                (make-code-tree (make-leaf 'C 1)
                                                                (make-leaf 'D 1)))
                                (make-code-tree (make-code-tree (make-leaf 'E 1)
                                                                (make-leaf 'F 1))
                                                (make-code-tree (make-leaf 'G 1)
                                                                (make-leaf 'H 1)))))) 

;; testing
(echo (decode (encode '(d e f) tree) tree)) ; def
(echo (decode (encode '(h f a) tree) tree)) ; hfa
