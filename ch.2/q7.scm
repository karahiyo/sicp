;; Q 2.7

(define (make-interval a b)
  (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (upper-bound x)
  (cdr x))
(define (lower-bound x)
  (car x))

(print (upper-bound (make-interval 3 5))) ; => 5
(print (lower-bound (make-interval 3 5))) ; => 3
(print (add-interval (make-interval 3 5) (make-interval 1 9))) ; => (4 . 14)
(print (mul-interval (make-interval 3 5) (make-interval 1 9))) ; => (3 . 45)
(print (div-interval (make-interval 3 5) (make-interval 1 9))) ; => (0.3333333333333 . 5.0)

