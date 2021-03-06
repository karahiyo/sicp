;; Q 2,21

(load "./ch.1/util.scm")

(define (square-list items)
  (if (null? items)
    `()
    (cons (square (car items))
          (square-list (cdr items)))))

(print (square-list (list 1 2 3 4)))

(define (square-list items)
  (map square items))
(print (square-list (list 1 2 3 4)))
