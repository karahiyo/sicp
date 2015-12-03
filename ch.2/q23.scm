;; Q 2.23

(define (for-each proc items)
  (if (null? items)
    `()
    (begin
      (proc (car items))
      (for-each proc (cdr items)))))

(for-each (lambda (x) (print x))
          (list 57 321 88))
; 57
; 321
; 88
