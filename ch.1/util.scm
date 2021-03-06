(use srfi-19)
(use srfi-27)

(define (square x)
  (* x x))

(define (devides? a b)
  (= (remainder b a) 0))
(define (power x n)
    (if (= n 1)
        x
        (* x (power x (- n 1)))))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square n)
  (* n n))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (inc n)
  (+ n 1))
(define (cube n)
  (* n n n))

(define (average a b)
  (/ (+ a b) 2))

(define (average-of-3 a b c)
  (/ (+ a b c) 3))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square fast-expt b (/ n 2)))
        (else (* b (fast-expt b (- n 1))))))
(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

