;; q.25

(define (alyssa-expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (expt-iter 1 b n))

(define (expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (* a (expt-iter a (* b b) (/ n 2))))
        (else (* b (expt-iter a b (- n 1))))))

(define (expmod base exp m)
  (define (square x)
    (* x x))
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(print (alyssa-expmod 123 33 12))
(print (expmod 123 33 12))

; fast-exptを使った手法の場合、ステップ数はO(log n)と一回の剰余演算。
; base, expの値が大きくなった場合に効率的ではない。
; 例えば、強力な暗号では、base は最低でも256桁の2真数(10進数では77桁) => base = 5 x 10^76, exp = 17

; expmodの場合、ステップ数は同じくO(log n)、が剰余演算の回数がO(log n)回。
; 乗算のたびにmodをとることになるが、各乗算、剰余算のコストが効率的となる。バイナリ法(二進数法)
;

; @see https://ja.wikipedia.org/wiki/冪剰余
