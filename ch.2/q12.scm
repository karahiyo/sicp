; Q 2.12

(load "./ch.2/q10.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let1 np (/ p 100)
        (make-interval (* c (- 1.0 np)) (* c (+ 1.0 np)))))

(define (percent i)
  (* 100
    (/ (- (upper-bound i) (center i)) (center i))))

(print (center (make-center-percent 3 9)))
(print (percent (make-center-percent 3 9)))

(print (center (make-center-percent -4 8)))
(print (percent (make-center-percent -4 8)))
