;; Q 2.3

(load "./ch.1/util.scm")
(load "./ch.2/q2.scm")


(define (make-rectangle a b c d)
  (let ((sx (make-segment a b))
        (sy (make-segment c d)))
    (cons sx sy)))
(define (rectangle-x r)
  (car r))
(define (rectangle-y r)
  (cdr r))

(define (perimeter r)
  (* 2 (+ (slength (rectangle-x r))
          (slength (rectangle-y r)))))

(define (area r)
  (* (slength (rectangle-x r)) (slength (rectangle-y r))))

(define (slength s)
  (let ((sp (start-segment s))
        (ep (end-segment s)))
    (sqrt (+ (square (- (x-point sp) (x-point ep)))
             (square (- (y-point sp) (y-point ep)))))))

(print (slength (make-segment (make-point 0 0) (make-point 3 3))))
(define rect1 (make-rectangle (make-point 0 0) (make-point 0 1)
                              (make-point 0 0) (make-point 1 0)))

(print (perimeter rect1))
(print (area rect1))

;---------------------------------------------------------------

(define (make-rectangle sx sy)
  (cons sx sy))

(define rect1 (make-rectangle (make-segment (make-point 0 0) (make-point 0 1))
                              (make-segment (make-point 0 0) (make-point 1 0))))
(print (perimeter rect1))
(print (area rect1))


