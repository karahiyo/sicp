;; Q.30

;; 線形再起なsum
; (define (sum term a next b)
;   (if (> a b)
;     0
;     (+ (term a)
;        (sum term (nex a) next b))))

(load "./ch.1/util.scm")

;; 反復実行なsum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

(print (sum + 0 inc 10)) ;; => 45

(define (sum-cubes a b)
  (define (next x) (+ x 1))
  (sum cube a next b))

(print (sum-cubes 1 10)) ;; => 3025
