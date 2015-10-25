;; Q 2.1

(load "./ch.1/util.scm")
(load "./ch.2/rat.scm")

(define (make-rat n d)
  (let1 pn (if (> (/ n d) 0) + -)
        (cons (pn (abs n)) (abs d))))

(print-rat (make-rat 1 2))
(print-rat (make-rat -1 2))
(print-rat (make-rat -1 -2))
