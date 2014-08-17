(define (q3 a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
		((and (<= b c) (<= b a)) (sum-of-square c a))
		((and (<= c a) (<= c b)) (sum-of-square a b))))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (square x)
	(* x x))

(print (q3 1 2 3))
(print (q3 3 3 3))
