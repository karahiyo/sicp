(use slib)
(require `trace)

(define (factorial n)
  (if  (= n 1)
    1
    (* n ( factorial (- n 1)))))

(trace factorial)
(factorial 10)
