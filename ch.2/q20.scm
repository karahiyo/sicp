;; Q 2.20

(define (same-parity . x)
  (filter-with-parity x
                      (if (even? (car x))
                        even? odd?)
                      `()))
(define (filter-with-parity l p r)
  (if (null? l)
    r
    (let1 n (if (p (car l))
              (car l)
              `())
          (filter-with-parity (cdr l) p (list r n)))))

(print (same-parity 1 2 3 4 5 6 7))
; (((((((() . 1)) . 3)) . 5)) . 7)

(print (same-parity 2 3 4 5 6 7))
; ((((((() . 2)) . 4)) . 6))

