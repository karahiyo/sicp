;; Q 2.42

(load "./ch.1/util.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

(print ((compose square inc) 6))
