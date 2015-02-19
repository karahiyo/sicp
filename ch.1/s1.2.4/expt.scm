(define (ept b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

(print (expt 2 10))
