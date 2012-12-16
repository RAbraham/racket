(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define s1 (make-segment (make-point 2 3) (make-point 4 8)))

;n,n->n
(define (mid a b) (/ (+ a b) 2))

;S -> Point
(define (midpoint-segment s)
  (let ((st (start-segment s))
        (e (end-segment s))
       )
    (make-point (mid (x-point st) (x-point e)) 
                (mid (y-point st) (y-point e)))))
;===============================================
(midpoint-segment (make-segment (make-point 1 1) (make-point 5 5)))