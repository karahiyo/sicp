;; Q 1.43

(load "./ch.1/util.scm")
(load "./ch.1/q42.scm")

(define (repeated f n)
  (if (> n 1)
    (repeated (compose f f) (- n 1))
    f))

(print ((repeated square 2) 5))

