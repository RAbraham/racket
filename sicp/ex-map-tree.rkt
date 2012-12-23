;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex-map-tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;Tree is either:
; Leaf i.e. Number
; (left_tree,right_tree)

; Tree -> Tree ( with values squared)
(define (square-tree tree)
  (cond
    [(empty? tree) empty]
    [(number? tree) (* tree tree)]
    [else (cons (square-tree (first tree))
                (square-tree (rest tree)))]))

(define (square-tree-it tree)
  (map (lambda (node)
         (cond 
           [(number? node) (* node node)]
           [else (square-tree-it node)]))
       tree))


(define (tree-map scale tree)
  (map (lambda (node)
         (cond 
           [(number? node) (scale node)]
           [else (square-tree-it node)]))
       tree))
(define square (lambda (x) (* x x)))

(define sq (lambda (tree) (tree-map square tree)))
  
(check-expect (sq
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
 (list 1 (list 4 (list 9 16) 25) (list 36 49)))

