(load "../library/main.scm")
(load "../library/display.scm")
(load "../library/binary-tree.scm")

(define (lookup tree id)
    (if (or (null? tree) (null? id))
        '()
        (cond ((< id (car (entry tree))) (lookup (left-branch tree) id))
              ((> id (car (entry tree))) (lookup (right-branch tree) id))
              ((= id (car (entry tree))) (cadr (car tree)) ))))

;; testing
(define users (make-tree (list 4 'Vasya)
                    (make-tree (list 2 'Petya) 
                        (make-tree (list 1 'Dima) '() '())
                        (make-tree (list 3 'Sacha) '() '())) 
                    (make-tree (list 6 'Kolya) 
                        (make-tree (list 5 'Sveta) '() '()) 
                        (make-tree (list 7 'Masha) '() '())) ))

;; testing
(print (lookup users 1)) ; Dima
(print (lookup users 2)) ; Petya
(print (lookup users 3)) ; Sasha
(print (lookup users 4)) ; Vasya
(print (lookup users 5)) ; Sveta
(print (lookup users 6)) ; Kolya
(print (lookup users 7)) ; Masha