;; q.11

(define (func n)
  (cond ((< n 3) n)
        (else (+ (func (- n 1)) (* 2 (func (- n 2))) (* 3 (func (- n 3)))))))

(print (func 10))
;; => 1892

(define (func n)
  (func-iter 2 1 0 n))

(define (func-iter a b c count)
  (if (= count 0)
    c
    (func-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(print (func 10))
;; => 1892
