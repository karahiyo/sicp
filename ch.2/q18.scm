;; Q 2.18


(define (reverse items)
  (if (null? (cdr items))
    (car items)
    (cons (reverse (cdr items)) (car items))))


(print (reverse (list 1 4 9 16 25)))
; => (25 16 9 4 1)
