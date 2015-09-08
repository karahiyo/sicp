; Q 1.35

; 黄金比(phi)は
; phi^2 = phi + 1
; を満たす。
; これと等価な方程式は
; phi = 1 + 1/phi
; とかける。
; よって、phi -> 1 + 1/phi の不動点を求めることでphiを求めることができる。

(load "./ch.1/s1.3.3.scm")

(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
  1.0))

(print (phi))
; => 1.6180327868852458 ≒ 1.6180
