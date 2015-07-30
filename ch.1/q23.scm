;; q.23

(use srfi-19)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (prime? n)
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


;; q.22 で見つけた素数

;; 1009, 1013, 1019
;; 10007, 10009, 10037
;; 100003, 100019, 100043
;; 1000003, 1000033, 1000037

(timed-prime-test 1009)
;; => 1009 *** #<time-duration 0.000007000>
(timed-prime-test 1013)
;; => 1013 *** #<time-duration 0.000004000>
(timed-prime-test 1019)
;; => 1019 *** #<time-duration 0.000003000>
(timed-prime-test 10007)
;; => 10007 *** #<time-duration 0.000009000>
(timed-prime-test 10009)
;; => 10009 *** #<time-duration 0.000009000>
(timed-prime-test 10037)
;; => 10037 *** #<time-duration 0.000009000>
(timed-prime-test 100003)
;; => 100003 *** #<time-duration 0.000027000>
(timed-prime-test 100019)
;; => 100019 *** #<time-duration 0.000027000>
(timed-prime-test 100043)
;; => 100043 *** #<time-duration 0.000043000>
(timed-prime-test 1000003)
;; => 1000003 *** #<time-duration 0.000088000>
(timed-prime-test 1000033)
;; => 1000033 *** #<time-duration 0.000102000>
(timed-prime-test 1000037)
;; => 1000037 *** #<time-duration 0.000096000>

;; 期待した2倍までは実行速度ははやくならなかった

