;; Q.26

(define (louis-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (* (louis-expmod base (/ exp 2) m)
                                   louis-expmod base (/ exp 2) m)) m)
        (else (remainder (* base (expmod base (- exp 1) m))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

; ここでのgauche解釈系では式を作用的順序で評価するため、１回のlouis-expmod関数で2回louis-expmodを呼び出すこととなる。
; 結果O(n)のオーダーとなる。
