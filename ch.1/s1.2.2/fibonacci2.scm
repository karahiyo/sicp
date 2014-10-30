;; s1.2.2
(use slib)
(require `trace)

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
    b
    (fib-iter (+ a b) a (- count 1))))

(print (fib 10))
(trace fib)
(trace fib-iter)
(fib 10)

;; 55
;; CALL fib 10
;;   CALL fib-iter 1 0 10
;;     CALL fib-iter 1 1 9
;;       CALL fib-iter 2 1 8
;;         CALL fib-iter 3 2 7
;;           CALL fib-iter 5 3 6
;;           RETN fib-iter 55
;;         RETN fib-iter 55
;;       RETN fib-iter 55
;;     RETN fib-iter 55
;;   RETN fib-iter 55
;; RETN fib 55
