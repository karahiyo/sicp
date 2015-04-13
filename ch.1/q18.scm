;; Q 1.18

(use slib)
(require `trace)

(define (fast-expt b n)
  (expt-iter 1 b n))

(define (expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (* a (expt-iter a (* b b) (/ n 2))))
        (else (* b (expt-iter a b (- n 1))))))

  (print (fast-expt 2 10))


(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))
        ))


