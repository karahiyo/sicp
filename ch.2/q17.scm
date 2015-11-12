;; Q 2.17

(define (last-pair items)
  (if (null? (cdr items))
    (car items)
    (last-pair (cdr items))))

(print (last-pair (list 23 72 149 34)))
; => 34
