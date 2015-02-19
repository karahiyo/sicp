(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square fast-expt b (/ n 2)))
        (else (* b (fast-expt b (- n 1))))))

(print (fast-expt 2 10))
