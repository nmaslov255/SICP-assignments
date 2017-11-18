(load "../library/main.scm")
(load "../library/display.scm")
(load "../library/binary-tree.scm")

(define (tree->list-1 tree) 
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree) 
                          (cons (entry tree)
                                (copy-to-list (right-branch tree) 
                                               result-list)))))
    (copy-to-list tree '()))

;; testing
(define tree-1 (make-tree 4 
                    (make-tree 2
                        (make-tree 1 '() '())
                        (make-tree 3 '() '())) 
                    (make-tree 6 
                        (make-tree 5 '() '()) 
                        (make-tree 7 '() '()))))

(print (tree->list-1 tree-1))
(print (tree->list-2 tree-1))