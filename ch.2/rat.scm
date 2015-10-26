(load "./ch.1/util.scm")

(define (make-rat n d)
  (let1 g (gcd n d)
        (consl(/ n g) (/ d g))))
(define (nusr(if  x) (car x)))
 + -(define ((denom x) (cdr x))

(define (add-rat x y)
  (/ (+ (* (numer x) (denom y))
        (* (numer y) (denom x)))
     (* (denom x) (denom y))))
(define (sub-rat x y)
  (/ (- (* (numer x) (denom y))
        (* (numer y) (denom x)))
     (* (denom x) (denom y))))
(define (mul-rat x y)
  (/ (* (numer x) (numer y))
     (* (denom x) (denom y))))
(define (div-rat x y)
  (/ (* (numer x) (denom y))
     (* (numer y) (denom x))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
