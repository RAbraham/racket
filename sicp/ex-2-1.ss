(define (make-rat n d)
;  (define (rat-sign x)
;     (if (< (* n d) 0) x (- 0 x)))
  (define (rat-sign n d) 
    (lambda (x)(if (< (* n d ) 0)
                   x
                   (- 0 x))))
  (let ((g (gcd n d))
        (sig_rajiv (rat-sign n d)))
    
    (cons (sig_rajiv (/ n g)) (abs (/ d g)))))

(define numer car)
(define denom cdr)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(make-rat -4 6)