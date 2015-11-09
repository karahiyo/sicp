;; Q 2.11

; (define (mul-interval x y)
;   (let ((p1 (* (lower-bound x) (lower-bound y)))
;         (p2 (* (lower-bound x) (upper-bound y)))
;         (p3 (* (upper-bound x) (lower-bound y)))
;         (p4 (* (upper-bound x) (upper-bound y))))
;     (make-interval (min p1 p2 p3 p4)
;                    (max p1 p2 p3 p4))))
;
; [a, b] * [c, d] = ...
;
; 1) a > 0, b > 0, c > 0, d > 0
; min: a * c
; max: b * d
;
; 2) a > 0, b > 0, c < 0, d > 0
; min: b * c
; max: b * d
;
; 3) a < 0, b > 0, c > 0, d > 0
; min: a * d
; max: b * d
;
; 4) a < 0, b > 0, c < 0, d > 0
; min: a * d or b * c
; max: a * c or b * d
;
; 5) a > 0, b > 0, c < 0, d < 0
; min: b * c
; max: a * c
;
; 6) a < 0, b < 0, c > 0, d > 0
; min: b * d
; max: a * c
;
; 7) a < 0, b > 0, c < 0, d < 0
; min: b * c
; max: a * c
;
; 8) a < 0, b < 0, c < 0, d > 0
; min: a * d
; max: a * c
;
; 9) a < 0, b < 0, c < 0, d < 0
; min: b * d
; max: a * c
;
