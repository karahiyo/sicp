;; Q 2.27

(define (reverse items)
  (if (null? items)
    `()
    (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (if (pair? items)
    (cons (deep-reverse (car (reverse items)))
          (deep-reverse (cdr (reverse items))))
    items))

(define x (list (list 1 2) (list 3 4)))

(print x)
; => ((1 2) (3 4))

(print (reverse x))
; => ((3 4) (1 2))

(print (deep-reverse x))
; => ((4 3) (2 1))

