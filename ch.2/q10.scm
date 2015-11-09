;; Q 2.10

(load "./ch.2/q7.scm")

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(print (div-interval (make-interval 1 2) (make-interval -1 -2)))
(print (div-interval (make-interval 1 2) (make-interval -1 2)))
; => (0.5 . 1.0)

(define (div-interval x y)
  (if (< (* (lower-bound y) (upper-bound y)) 0)
    (error "error")
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))

; (print (div-interval (make-interval 1 2) (make-interval -1 -2)))
; (print (div-interval (make-interval 1 2) (make-interval -1 2))) ; error

