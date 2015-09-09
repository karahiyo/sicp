; Q 1.34

(load "./ch.1/s1.3.4.scm")

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)
    ))

(print (newtons-method (cubic 1 2 3) 1))
; => -1.2756822036498454

