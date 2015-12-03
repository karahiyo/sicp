;; Q 2.26

(define x (list 1 2 3))
(define y (list 4 5 6))

(print (append x y))
; => (1 2 3 4 5 6)
; xにyの"要素"をつなげる

(print (cons x y))
; => ((1 2 3) 4 5 6)
; xとyのペアを作成する

(print (list x y))
; => ((1 2 3) (4 5 6))
; 要素がx,yであるリストを作成する

