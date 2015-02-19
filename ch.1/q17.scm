;; q.1.17

;; (define (* a b)
;;   (if (= b 0)
;;     0
;;     (+ a (* a (- b 1)))))


(use slib)
(require `trace)

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))
        ))

(trace *)
(print (* 7 39))
