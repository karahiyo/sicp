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
(define (search-for-primes start-n count :optional (increment +))
  (cond ((= count 0) (display "\n--- finish ---"))
        ((= (mod start-n 2) 0) (search-for-primes (increment start-n 1) count increment))
        (else (begin
                (if (timed-prime-test start-n)
                    (search-for-primes (increment start-n 2) (- count 1) increment)
                    (search-for-primes (increment start-n 2) count increment))))))

(search-for-primes 1000 3)
;; 1001
;; 1003
;; 1005
;; 1007
;; 1009 *** #<time-duration 0.000005000>
;; 1011
;; 1013 *** #<time-duration 0.000003000>
;; 1015
;; 1017
;; 1019 *** #<time-duration 0.000003000>
;; --- finish ---

(search-for-primes 1000 3 -)
;; 999
;; 997 *** #<time-duration 0.000003000>
;; 995
;; 993
;; 991 *** #<time-duration 0.000003000>
;; 989
;; 987
;; 985
;; 983 *** #<time-duration 0.000003000>
;; --- finish ---

(search-for-primes 10000 3 +)
;; 10001
;; 10003
;; 10005
;; 10007 *** #<time-duration 0.000010000>
;; 10009 *** #<time-duration 0.000010000>
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
;; 10037 *** #<time-duration 0.000015000>
;; --- finish ---

(search-for-primes 10000 3 -)
;; 9999
;; 9997
;; 9995
;; 9993
;; 9991
;; 9989
;; 9987
;; 9985
;; 9983
;; 9981
;; 9979
;; 9977
;; 9975
;; 9973 *** #<time-duration 0.000015000>
;; 9971
;; 9969
;; 9967 *** #<time-duration 0.000014000>
;; 9965
;; 9963
;; 9961
;; 9959
;; 9957
;; 9955
;; 9953
;; 9951
;; 9949 *** #<time-duration 0.000014000>
;; --- finish ---


(search-for-primes 100000 3 +)
;; 100001
;; 100003 *** #<time-duration 0.000050000>
;; 100005
;; 100007
;; 100009
;; 100011
;; 100013
;; 100015
;; 100017
;; 100019 *** #<time-duration 0.000032000>
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
;; 100043 *** #<time-duration 0.000043000>
;; --- finish ---

(search-for-primes 100000 3 -)
;; 99999
;; 99997
;; 99995
;; 99993
;; 99991 *** #<time-duration 0.000053000>
;; 99989 *** #<time-duration 0.000046000>
;; 99987
;; 99985
;; 99983
;; 99981
;; 99979
;; 99977
;; 99975
;; 99973
;; 99971 *** #<time-duration 0.000046000>
;; --- finish ---


(search-for-primes 1000000 3 +)
;; 1000001
;; 1000003 *** #<time-duration 0.000143000>
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
;; 1000033 *** #<time-duration 0.000142000>
;; 1000035
;; 1000037 *** #<time-duration 0.000185000>
;; --- finish ---

(search-for-primes 1000000 3 -)
;; 999999
;; 999997
;; 999995
;; 999993
;; 999991
;; 999989
;; 999987
;; 999985
;; 999983 *** #<time-duration 0.000128000>
;; 999981
;; 999979 *** #<time-duration 0.000114000>
;; 999977
;; 999975
;; 999973
;; 999971
;; 999969
;; 999967
;; 999965
;; 999963
;; 999961 *** #<time-duration 0.000097000>
;; --- finish ---

;; gosh> (log 10 2)
;; 3.3219280948873626

;; 1000    =>  avg 0.000003
;; 10000   =>  avg 0.000013 <- 約4.33倍. だいたい妥当
;; 100000  =>  avg 0.000045 <- 約3.46倍. だいたい妥当
;; 1000000 =>  avg 0.000134 <- 約2.97倍. だいたい妥当

