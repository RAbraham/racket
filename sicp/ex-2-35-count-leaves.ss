(load "util.ss")

;(define (count-leaves t)
;  (accumulate <??> <??> (map <??> <??>)))
;
;
;enumerate leaves
;map 1 for each leaf
;add all the ones

(define tree (list 1 2 (list 5 7)))

(define (leaves tree)
  (cond 
    [(null? tree) tree]
    [(not (pair? tree)) (tree)]
    [else (cons (car tree) (leaves (cdr tree)))]))

(assert (leaves tree) (list 1 2 5 7))
;(map (lambda (x) 1) (list 1 2 3))