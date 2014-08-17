(define (p) (p))

(define (test x y)
  (if (= x 0)
	0
	y))

(test 0 (p))

;; 処理系:gauche

;; gaucheはnorma-order evaluationを採用している。
;; 今回の場合であれば、`(test 0 (p))`を実行した際には
;; `(p)`が無限に展開され続ける。

;; --------
;; gosh> (test 0 (p))
;;
;; *** UNHANDLED-SIGNAL-ERROR: unhandled signal 2 (SIGINT)
;; Stack Trace:
;; _______________________________________
;;   0  (p)
;;         At line 8 of "(stdin)"
;; --------

;; applicative-order evaluationを採用しているlisp処理系ならば、
;; 今回の式ではまず`(test 0 (p))`が評価され
;; 値0を返し正常終了する。
