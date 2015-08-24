;; Q.29

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum term a next b)
  (if ( > a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (cube x) (* x x x))

(print (integral cube 0 1 0.1)) ; => 0.24874999999999994
(print (integral cube 0 1 0.001)) ; => 0.249999875000001

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (next a) (+ a h))
  (* (/ h 3.0)
     (simpson-sum f a next b 0 n))
  )

(define (simpson-sum term a next b k n)
  (define (nextk k) (+ k 1))
  (cond ((> a b) 0)
        ((or (= k 0) (= k n))
         (+ (term a)
            (simpson-sum term (next a) next b (nextk k) n)))
        ((even? k)
         (+ (* 2 (term a))
            (simpson-sum term (next a) next b (nextk k) n)))
        (else
          (+ (* 4 (term a))
             (simpson-sum term (next a) next b (nextk k) n)))
        ))

(print (simpson-integral cube 0 1 100)) ; => 0.25
(print (simpson-integral cube 0 1 1000)) ; => 0.25

; Simpsonの公式を用いた積分の方が、よいよい精度で近似できている。

