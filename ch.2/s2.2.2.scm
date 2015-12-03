;; Session 2.2.2 Hierarchical Data and Closure property

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(print (count-leaves (cons (list 1 2) (list 3 4))))
