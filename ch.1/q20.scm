;; Q.1.20

;; 正規順序評価
(define (r a b)
  (remainder a b))

(gcd 206 40)
=> (if (= 206 0) 206 (gcd 40 (r 206 40)))
=> (gcd 40 (r 206 40))
=> (if (= (r 206 40) 0) 40 (gcd (r 206 40) (r 40 (r 206 40))))
=> (if (= 6 0) 40 (gcd (r 206 40) (r 40 (r 206 40)))) ;; (= 6 0) => #f ~> count:1
=> (gcd (r 206 40) (r 40 (r 206 40)))
=> (if (= (r 40 (r 206 40)) 0) ;; (= 4 0) => #f ~> count:3
     (r 206 40)
     (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
=> (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
=> (if (= (r (r 206 40) (r 40 (r 206 40))) 0) ;; (= 2 0) => #f ~> count:7
     (r 40 (r 206 40))
     (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))
=> (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
=> (if (= (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) 0) ;; (= 0 0) => #t ~> count:14
     (r (r 206 40) (r 40 (r 206 40)))
     (gcd (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))))
=> (r (r 206 40) (r 40 (r 206 40)))
=> 2 ;; count:18

;; 正規順序評価の場合、remainderは18実行される

;; 作用的順序
(gcd 206 40)
=> (if (= 206 0) 206 (gcd 40 (r 206 40)))
=> (gcd 40 (r 206 40))
=> (gcd 40 6) ;; count:1
=> (if (= 6 0) 40 (gcd 6 (r 40 6)))
=> (gcd 6 (r 40 6))
=> (gcd 6 4) ;; count:2
=> (if (= 4 0) 4 (gcd 4 (r 6 4)))
=> (gcd 4 (r 6 4))
=> (gcd 4 2) ;; count:3
=> (if (= 2 0) 4 (gcd 2 (r 4 2)))
=> (gcd 2 (r 4 2))
=> (gcd 2 0) ;; count:4
=> (if (= 0 0) 2 (gcd 0 (r 2 0)))
=> 2

;; 作用的順序の場合、remainderは4回実行される

