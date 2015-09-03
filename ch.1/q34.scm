;; Q.1.34

(load "./ch.1/util.scm")

(define (f g)
  (g 2))

(print (f square)) ;; => 4

(print (f (lambda (z) (* z (+ z 1))))) ;; => 6

(print (f f))
;; => gosh: "error": invalid application: (2 2)

