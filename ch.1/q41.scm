; Q 1.41

(load "./ch.1/util.scm")

(define (double proc)
  (lambda (x) (proc (#?=proc #?=x))))

(print ((double inc) 1))

(print (((double (double double)) inc) 5))
; => 21

(((d (d d)) inc) 5)
(((lambda (x) ((d d) ((d d) x))) inc) 5)
(((lambda (x) ((lambda (x') (d (d x'))) ((d d) x))) inc) 5)
(((lambda (x) ((lambda (x') (d (d x'))) ((lambda (x'') (d (d x''))) x))) inc) 5)
(((lambda (x) ((lambda (x') (d (d x'))) ((lambda (x'') (d (d x''))) x))) inc) 5)
; ((d (lambda (x) (double (double x)))) inc)
; ((lambda (x') ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x'))) inc)

