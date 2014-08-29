(define (improve guess x)
                (average guess (/ x guess)))
(define (average x y)
                (/ (+ x y) 2))
(define (good-enough? guess x)
                (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
                (sqrt-iter 1.0 x))
(define (square x)
                (* x x))

(define (new-if predicate then-clause else-clause)
        (cond (predicate then-clause)
              (else else-clause)))

(define (sqrt-iter guess x)
        (begin 
          (print guess ":" x)
          (new-if (good-enough? guess x)
                  guess
                  (sqrt-iter (improve guess x) x))))

(print (sqrt 5))

#; Alyssaは無限ループに出会う。
#; new-ifは式であり、gaucheが作用的順序で式を評価するため

#;```
#;gosh> (sqrt 5)
#;*** UNHANDLED-SIGNAL-ERROR: unhandled signal 2 (SIGINT)
#;Stack Trace:
#;_______________________________________
#;  0  (good-enough? guess x)
#;        At line 9 of "(stdin)"
#;  1  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  2  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  3  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  4  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  5  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  6  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  7  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  8  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;  9  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 10  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 11  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 12  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 13  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 14  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 15  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 16  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 17  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 18  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 19  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 20  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 21  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 22  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 23  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 24  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 25  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 26  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 27  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 28  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#; 29  (sqrt-iter (improve guess x) x)
#;        At line 11 of "(stdin)"
#;... (more stack dump truncated)
#;```

#;この時、sqrt内部では次の式展開が行われている。
#;#;```
#;=> (sqrt 5)
#;=> (sqrt-iter 1.0 5)
#;=> (new-if (good-enough? 1.0 5)
#;           1.0
#;           (sqrt-iter (improve 1.0 5) 5))
#;=> (new-if (good-enough? 1.0 5)
#;           1.0
#;           (sqrt-iter (average 1.0 (/ 5 1.0)) 5))
#;=> (new-if (good-enough? 1.0 5)
#;           1.0
#;           (sqrt-iter (average 1.0 5) 5))
#;=> (new-if (good-enough? 1.0 5)
#;           1.0
#;           (sqrt-iter 3 5))
#;=> (new-if (< (abs (- (square 1.0) 5)) 0.001) 
#;           1.0
#;           (sqrt-iter 3 5))
#;=> (new-if #f
#;           1.0
#;           (sqrt-iter 3 5))
#;=> (new-if #f
#;           1.0
#;           (sqrt-iter 3 5))
#;=> (new-if #f
#;           1.0
#;           (new-if (good-enough? 3 5)
#;                   3
#;                   (sqrt-iter (improve 3 5) 5)))
#;=> (new-if #f
#;           1.0
#;           (new-if #f
#;                   3
#;                   (sqrt-iter 7/3 5)))
#;=> (new-if #f
#;           1.0
#;           (new-if #f
#;                   3
#;                   (new-if (good-enough? 7/3 5)
#;                      7/3
#;                      (sqrt-iter (improve 7/3 5) 5)))
#;
#; ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ 
#;=> (new-if #f
#;        (new-if #f)
#;            (new-if #f)
#;                (new-if #t)
#;                    (new-if #t)
#;                    ...
#;                    (new-if #t)
#;                        (sqrt-iter (improve 2.23606797749979 5) 5))
#;

