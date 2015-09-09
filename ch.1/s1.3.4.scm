; Session 1.3.4

(load "./ch.1/util.scm")
(load "./ch.1/s1.3.3.scm")

(define (average-dump f)
  (lambda (x) (average x (f x))))

(print ((average-dump square) 10)) ; => 55

(define (sqrt x)
  (fixed-point (average-dump (lambda (y) (/ x y)))
               1.0))

(print (sqrt 2))
; => 1.4142135623746899

(define (cube-root x)
  (fixed-point (average-dump (lambda (y) (/ x (square y))))
               1.0))

(print (cube-root 2))
; => 1.259923236422975

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cube x) (* x x x))

(print ((deriv cube) 5))
; => 75.00014999664018

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

;; ---------------------
;;  抽象と第一級手続き
;; ---------------------

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-dump
                            1.0))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))





