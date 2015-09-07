;; Session 1.3.3

(load "./ch.1/util.scm")

; 区間二分法による探索を行う
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
        (cond ((positive? test-value)
               (search f neg-point midpoint))
              ((negative? test-value)
               (search f midpoint pos-point))
              (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
            (error "Values are not of opposite sign" a b)))))

(print (half-interval-method sin 2.0 4.0))
; => 3.14111328125

(print (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0))
; => 1.89306640625

;; 吸引的不動点を探索する
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(print (fixed-point cos 1.0))
; => 0.7390822985224023

(print (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))
; => 1.2587315962971173


