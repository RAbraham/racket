(load "util.ss")
(define (mapp p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(mapp (lambda (x) (* x x)) (list 1 2 3))
(list 1 2)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(append (list 1 2) nil)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y) ) 0 sequence))

(length (list 1 2 4))

