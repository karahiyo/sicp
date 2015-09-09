; Q 1.41

(load "./ch.1/util.scm")

(define (double proc)
  (lambda (x) (proc (proc #?=x))))

(print ((double inc) 1))

(print (((double (double double)) inc) 5))
; => 21

