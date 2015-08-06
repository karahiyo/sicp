;; Q.27

(load "./ch.1/util.scm")

(define (search-for-primes n)
  (prime-test 1 n))

(define (prime-test a n)
  (cond ((>= a n) '())
        ((< a n) (if (= (mod a n) (expmod a n n))
                   (prime-test (+ a 1) n)
                   (begin
                     (prime-test (+ a 1) n)
                     (display "*** not conguence !!"))))))

;; Carmichael数
;; 561, 1105, 1729, 2465, 2821, 6601

(search-for-primes 561) ;; =>
(search-for-primes 1105) ;; =>
(search-for-primes 1729) ;; =>
(search-for-primes 2465) ;; =>
(search-for-primes 2821) ;; =>
(search-for-primes 6601) ;; =>

;; 騙せてる。
