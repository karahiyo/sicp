(define (fast-expt b n)
  (expt-iter 1 b n))

(define (expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (* a (expt-iter a (* b b) (/ n 2))))
        (else (* b (expt-iter a b (- n 1))))))

  (print (fast-expt 2 10))
