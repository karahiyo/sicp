;; Q 2.14

(load "./ch.2/q12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

(define r1 (make-center-percent 10 1))
(define r2 (make-center-percent 100 1))
(define small-width-r1 (make-center-percent 10 0.01))
(define small-width-r2 (make-center-percent 100 0.01))

(define (print-interval i)
  (print "[" (lower-bound i) ", " (upper-bound i) "]")
  (newline))

(define (print-percent-interval i)
  (print "[center: " (center i) ", percent: " (percent i) "]")
  (newline))


(print-interval (par1 r1 r2))
(print-percent-interval (par1 r1 r2))
(print-interval (par2 r1 r2))
(print-percent-interval (par2 r1 r2))
; [8.821782178217822, 9.367309458218548]
; [center: 9.094545818218185, percent: 2.999200239928017]
; [9.0, 9.181818181818182]
; [center: 9.09090909090909, percent: 1.000000000000009]


; A/A
(print "A/A")
(print-interval (div-interval r1 r1))
(print-percent-interval (div-interval r1 r1))
(print-interval (div-interval r2 r2))
(print-percent-interval (div-interval r2 r2))
; [0.9801980198019803, 1.02020202020202]
; [center: 1.0002000200020003, percent: 1.9998000199979855]
; [0.9801980198019802, 1.0202020202020203]
; [center: 1.0002000200020003, percent: 1.9998000199980077]

; A/B
(print "A/B")
(print-interval (div-interval r1 r2))
(print-percent-interval (div-interval r1 r2))
(print-interval (div-interval r2 r1))
(print-percent-interval (div-interval r2 r1))
; [0.09801980198019802, 0.10202020202020202]
; [center: 0.10002000200020003, percent: 1.9998000199979933]
; [9.801980198019802, 10.202020202020202]
; [center: 10.002000200020003, percent: 1.9998000199979942]

; A/A
(print "A/A")
(print-interval (div-interval small-width-r1 small-width-r1))
(print-percent-interval (div-interval small-width-r1 small-width-r1))
(print-interval (div-interval small-width-r2 small-width-r2))
(print-percent-interval (div-interval small-width-r2 small-width-r2))
; [0.9998000199980004, 1.000200020002]
; [center: 1.0000000200000003, percent: 0.019999999799971167]
; [0.9998000199980001, 1.0002000200020003]
; [center: 1.00000002, percent: 0.01999999980001558]

; A/B
(print "A/B")
(print-interval (div-interval small-width-r1 small-width-r2))
(print-percent-interval (div-interval small-width-r1 small-width-r2))
(print-interval (div-interval small-width-r2 small-width-r1))
(print-percent-interval (div-interval small-width-r2 small-width-r1))
; [0.09998000199980002, 0.10002000200020002]
; [center: 0.10000000200000002, percent: 0.019999999799998926]
; [9.998000199980002, 10.002000200020001]
; [center: 10.000000200000002, percent: 0.019999999799988934]






