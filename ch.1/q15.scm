;; exercise 1.15: sin (x) calculation
;;    a.  How many times is the procedure p applied when (sine 12.15)
;;        is evaluated?
;;    b.  What is the order of growth in space and number of steps (as
;;        a function of a) used by the process generated by the sine
;;        procedure when (sine a) is evaluated?
(use slib)
(require `trace)

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))


;; (a). (sine 12.15)
(trace p)
(sine 12.15)
;; CALL sine 12.15
;;   CALL sine 4.05
;;     CALL sine 1.3499999999999999
;;       CALL sine 0.44999999999999996
;;         CALL sine 0.15
;;           CALL p 0.049999999999999996
;;             CALL cube 0.049999999999999996
;;             RETN cube 1.2499999999999998e-4
;;           RETN p 0.1495
;;         RETN sine 0.1495
;;         CALL p 0.1495
;;           CALL cube 0.1495
;;           RETN cube 0.003341362375
;;         RETN p 0.4351345505
;;       RETN sine 0.4351345505
;;       CALL p 0.4351345505
;;         CALL cube 0.4351345505
;;         RETN cube 0.08238927958303073
;;       RETN p 0.9758465331678772
;;     RETN sine 0.9758465331678772
;;     CALL p 0.9758465331678772
;;       CALL cube 0.9758465331678772
;;       RETN cube 0.9292756784936136
;;     RETN p -0.7895631144708228
;;   RETN sine -0.7895631144708228
;;   CALL p -0.7895631144708228
;;     CALL cube -0.7895631144708228
;;     RETN cube -0.4922214714997821
;;   RETN p -0.39980345741334
;; RETN sine -0.39980345741334

;; n = 5

;; (b).
;;      step: O(log(n))
;;      space: O(1)
