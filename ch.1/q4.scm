(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(print (a-plus-abs-b 2 5))
(print (a-plus-abs-b 2 -5))

;; `a-plus-abs-b` は二つの被演算子(operands)を受け取り
;; 第二被演算子の値の絶対値を第一被演算子の値に加算したものをかえす

