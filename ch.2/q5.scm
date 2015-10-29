;; Q 2.5

(load "./ch.1/util.scm")

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (count-factor x 2 0))
(define (cdr x)
  (count-factor x 3 0))

(define (count-factor x divisor count)
  (if (= 0 (remainder x divisor))
    (count-factor (/ x divisor) divisor (+ count 1))
    count))

(print (car (cons 5 3)))
(print (cdr (cons 5 3)))

