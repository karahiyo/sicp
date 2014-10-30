;; s1.2.2
(use slib)
(require `trace)

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(print (fib 5))
(trace fib)
(fib 5)

;; 5
;; CALL fib 5
;;   CALL fib 4
;;     CALL fib 3
;;       CALL fib 2
;;         CALL fib 1
;;         RETN fib 1
;;         CALL fib 0
;;         RETN fib 0
;;       RETN fib 1
;;       CALL fib 1
;;       RETN fib 1
;;     RETN fib 2
;;     CALL fib 2
;;       CALL fib 1
;;       RETN fib 1
;;       CALL fib 0
;;       RETN fib 0
;;     RETN fib 1
;;   RETN fib 3
;;   CALL fib 3
;;     CALL fib 2
;;       CALL fib 1
;;       RETN fib 1
;;       CALL fib 0
;;       RETN fib 0
;;     RETN fib 1
;;     CALL fib 1
;;     RETN fib 1
;;   RETN fib 2
;; RETN fib 5
