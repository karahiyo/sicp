;; q 1.14

(use slib)
(require `trace)

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
                 ))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(print (count-change 11))
(trace count-change cc first-denomination)
(count-change 11)

CALL count-change 11
  CALL cc 11 5
    CALL cc 11 4
      CALL cc 11 3
        CALL cc 11 2
          CALL cc 11 1
          RETN cc 1
          CALL first-denomination 2
          RETN first-denomination 5
          CALL cc 6 2
            CALL first-denomination 1
            RETN first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 2
            RETN first-denomination 5
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 2
            RETN first-denomination 5
          RETN cc 2
        RETN cc 3
        CALL first-denomination 3
        RETN first-denomination 10
        CALL cc 1 3
          CALL cc 1 2
            CALL first-denomination 1
            RETN first-denomination 1
            CALL first-denomination 2
            RETN first-denomination 5
          RETN cc 1
          CALL first-denomination 3
          RETN first-denomination 10
          CALL cc -9 3
          RETN cc 0
        RETN cc 1
      RETN cc 4
      CALL first-denomination 4
      RETN first-denomination 25
      CALL cc -14 4
      RETN cc 0
    RETN cc 4
    CALL first-denomination 5
    RETN first-denomination 50
    CALL cc -39 5
    RETN cc 0
  RETN cc 4
RETN count-change 4

;; order about amout is,
;;   step:  O(n)
;;   space: O(n^5)
