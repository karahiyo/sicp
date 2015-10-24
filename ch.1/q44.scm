;; Q 1.44

(load "./ch.1/q43.scm")

(define dx 0.001)

(define (smooth f)
  (lambda (x)
    (average-of-3 (f (- x dx)) (f x) (f (+ x dx)))))

(print ((smooth square) 2))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(print ((n-fold-smooth square 2) 2))
