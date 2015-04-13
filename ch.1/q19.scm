;; Q.1.19

;; Fibonacci数を対数的ステップ数で計算するアルゴリズム
;; p' = p^2 + q^2
;; q' = q^2 + 2pq

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q));; p'を計算
                   (+ (* 2 ( * p q)) (* q q));; q'を計算'
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1) ))))

(do ((n 1 (inc! n)))
  ((> n 10) n)
  (print (fib n)))

