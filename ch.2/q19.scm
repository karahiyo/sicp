;; Q 2.19

(load "./ch.1/s1.2.2/count-change.scm")

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values))
                 coin-values)))))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

(print (cc 100 us-coins))
; => 292
(print (cc 10 us-coins))
; => 4
(print (cc 10 uk-coins))
; => 50

(define us-coins-random (list 10 1 50 25 5))
(print (cc 100 us-coins-random))
; => 292
(print (cc 10 us-coins-random))
; => 4

(define uk-coins-random (list 10 1 0.5 100 50 20 2 5))
(print (cc 10 uk-coins-random))
; => 50
