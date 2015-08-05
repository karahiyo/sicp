;; q.24

(load "./ch.1/util.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
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

(timed-prime-test 1009)
;; => 1009 *** #<time-duration 0.000006000>
(timed-prime-test 1013)
;; => 1013 *** #<time-duration 0.000008000>
(timed-prime-test 1019)
;; => 1019 *** #<time-duration 0.000009000>
(timed-prime-test 10007)
;; => 10007 *** #<time-duration 0.000010000>
(timed-prime-test 10009)
;; => 10009 *** #<time-duration 0.000009000>
(timed-prime-test 10037)
;; => 10037 *** #<time-duration 0.000010000>
(timed-prime-test 100003)
;; => 100003 *** #<time-duration 0.000011000>
(timed-prime-test 100019)
;; => 100019 *** #<time-duration 0.000013000>
(timed-prime-test 100043)
;; => 100043 *** #<time-duration 0.000012000>
(timed-prime-test 1000003)
;; => 1000003 *** #<time-duration 0.000013000>
(timed-prime-test 1000033)
;; => 1000033 *** #<time-duration 0.000013000>
(timed-prime-test 1000037)
;; => 1000037 *** #<time-duration 0.000014000>

; 1,000,000近くの素数の実行時間が、1000近くの素数の実行時間の倍くらいなっている。O(log n)のオーダーに従っているので期待どおり。
