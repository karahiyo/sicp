;; Q 2.7

(load "./ch.2/q7.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(print (upper-bound (make-interval 3 5))) ; => 5
(print (lower-bound (make-interval 3 5))) ; => 3
(print (sub-interval (make-interval 3 5) (make-interval 1 9))) ; => (-6 . 4)

