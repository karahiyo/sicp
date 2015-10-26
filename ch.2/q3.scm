;; Q 2.3

(load "./ch.1/util.scm")
(load "./ch.2/q2.scm")


(define (make-rectangle a b c d)
  (let ((sx (make-segment a b))
        (sy (make-segment c d)))
    (cons sx sy)))
(define (rectangle-top-l r)
  (car (car r)))
(define (rectangle-top-r r)
  (cdr (car r)))
(define (rectangle-bottom-l r)
  (car (cdr r)))
(define (rectangle-bottom-r r)
  (cdr (cdr r)))
(define (rectangle-heigth r)
  (let1 s (make-segment (rectangle-top-l r) (rectangle-bottom-l r))
        (slength s)))
(define (rectangle-width r)
  (let1 s (make-segment (rectangle-bottom-l r) (rectangle-bottom-r r))
        (slength s)))

(define (perimeter r)
  (* 2 (+ (rectangle-heigth r)
          (rectangle-width r))))

(define (area r)
  (* (rectangle-heigth r) (rectangle-width r)))

(define (slength s)
  (let ((sp (start-segment s))
        (ep (end-segment s)))
    (sqrt (+ (square (- (x-point sp) (x-point ep)))
             (square (- (y-point sp) (y-point ep)))))))

(print (slength (make-segment (make-point 0 0) (make-point 3 3))))
(define rect1 (make-rectangle (make-point 0 1) (make-point 1 1)
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


