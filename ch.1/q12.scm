;; q.12

(define (pascal n)
  (pascal-iter n 0))

(define (pascal-iter row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal-iter (- row 1) (- col 1))
                 (pascal-iter (- row 1) col)))))

(print (pascal-iter 0 0))
;; 1

(print (pascal-iter 4 2))
;; => 6

(print (pascal-iter 10 5))
;; => 252

;; (pascal-iter 4 2) = ...
;;   = (pascal-iter 3 1) + (pascal-iter 3 2)
;;   = (pascal-iter 2 0) + (pascal-iter 2 1) + (pascal-iter 3 1) + (pascal-iter 3 2)
;;   = ...
;;
;;     1
;;    1 1
;;   1 2 1
;;  1 3 3 1
;; 1 4 6 4 1
;;
