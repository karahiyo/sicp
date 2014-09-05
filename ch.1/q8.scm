;; q1.8
;;
;; (x/y^2 + 2*y)/3

(define (square x)
        (* x x))
(define (improve guess x)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (good-enough? guess next_guess)
        (< (abs (- guess next_guess)) 0.001))
(define (cube-iter guess x)
        (let1 next_guess (improve guess x)
        (if (good-enough? guess next_guess)
            next_guess
            (cube-iter next_guess x))))
(define (cube-root x)
        (cube-iter 1.0 x))

;; ----

(print (cube-root (* 9 9 9)))
(print (cube-root (* 2 2 2)))
(print (cube-root 0))
(print (cube-root (* -2 -2 -2)))
(print (cube-root (* -9 -9 -9)))
