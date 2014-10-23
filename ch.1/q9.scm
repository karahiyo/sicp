;; q 1.9
;;
(use slib)
(require `trace)

;; plus手続きは二つの引数を受け取り、第二引数に第一引数の回数分inc手続きを処理する手続きである。

(define (inc n)
  (+ n 1))
(define (dec n)
  (- n 1))

(define (plus a b)
  (if (= a 0)
    b
    (inc (plus (dec a) b))))

(trace plus)
(print (plus 4 5))


;; A. 再起的手続き
;;
;;### 置き換えモデル
;; (plus 4 5)
;; (inc (plus 3 5))
;; (inc (inc (plus 2 5)))
;; (inc (inc (inc (plus 1 5))))
;; (inc (inc (inc (inc (plus 0 5)))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9
;;
;; 収縮の際に実際のincの処理が実行されている。
;;
;; ### trace出力
;; ```
;; CALL plus 4 5
;;   CALL plus 3 5
;;     CALL plus 2 5
;;       CALL plus 1 5
;;         CALL plus 0 5
;;         RETN plus 5
;;       RETN plus 6
;;     RETN plus 7
;;   RETN plus 8
;; RETN plus 9
;; ```


;;------------------------------------>

(define (plus a b)
  (if (= a 0)
    b
    (plus (dec a) (inc b))))

(trace plus)
(plus 4 5))

;; A. 反復的手続き
;;
;; ### 置き換えモデル
;; (plus 4 5)
;; (plus 3 6)
;; (plus 2 7)
;; (plus 1 8)
;; (plus 0 9)
;; 9

;; ### trace出力
;; ```
;;CALL plus 4 5
;;  CALL plus 3 6
;;    CALL plus 2 7
;;      CALL plus 1 8
;;        CALL plus 0 9
;;        RETN plus 9
;;      RETN plus 9
;;    RETN plus 9
;;  RETN plus 9
;;RETN plus 9
;; ```

