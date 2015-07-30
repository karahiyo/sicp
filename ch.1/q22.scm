;; q.22

(use srfi-19)

(define (prime? n)
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
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (time-difference (current-time) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; 指定範囲の連続する奇整数について素数性を調べる手続き
(define (search-for-primes start-n count)
  (cond ((= count 0) (display "\n--- finish ---"))
        ((= (mod start-n 2) 0) (search-for-primes (+ start-n 1) count))
        (else (begin
                (if (timed-prime-test start-n)
                    (search-for-primes (+ start-n 2) (- count 1))
                    (search-for-primes (+ start-n 2) count))))))

(search-for-primes 1000 3)
;; 1001
;; 1003
;; 1005
;; 1007
;; 1009 *** #<time-duration 0.000005000>
;; 1011
;; 1013 *** #<time-duration 0.000005000>
;; 1015
;; 1017
;; 1019 *** #<time-duration 0.000004000>
;; --- finish ---

(search-for-primes 10000 3)
;; 10001
;; 10003
;; 10005
;; 10007 *** #<time-duration 0.000011000>
;; 10009 *** #<time-duration 0.000011000>
;; 10011
;; 10013
;; 10015
;; 10017
;; 10019
;; 10021
;; 10023
;; 10025
;; 10027
;; 10029
;; 10031
;; 10033
;; 10035
;; 10037 *** #<time-duration 0.000012000>
;; --- finish ---

(search-for-primes 100000 3)
;; 100001
;; 100003 *** #<time-duration 0.000035000>
;; 100005
;; 100007
;; 100009
;; 100011
;; 100013
;; 100015
;; 100017
;; 100019 *** #<time-duration 0.000046000>
;; 100021
;; 100023
;; 100025
;; 100027
;; 100029
;; 100031
;; 100033
;; 100035
;; 100037
;; 100039
;; 100041
;; 100043 *** #<time-duration 0.000041000>
;; --- finish ---

(search-for-primes 1000000 3)
;; 1000001
;; 1000003 *** #<time-duration 0.000105000>
;; 1000005
;; 1000007
;; 1000009
;; 1000011
;; 1000013
;; 1000015
;; 1000017
;; 1000019
;; 1000021
;; 1000023
;; 1000025
;; 1000027
;; 1000029
;; 1000031
;; 1000033 *** #<time-duration 0.000105000>
;; 1000035
;; 1000037 *** #<time-duration 0.000105000>
;; --- finish ---


;; gosh> (log 10 2)
;; 3.3219280948873626

;; 1000    =>  avg 0.000004
;; 10000   =>  avg 0.000011 <- 約2.75倍. だいたい妥当
;; 100000  =>  avg 0.000040 <- 約3.63倍. だいたい妥当
;; 1000000 =>  avg 0.000105 <- 約2.62倍. だいたい妥当

