;Calc function for n
; N -> N
; (is (f -1) -1)
; (is (f 2) 2)
; (is (f 3) 4)
; (is (f 4) 11)
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 4)
  