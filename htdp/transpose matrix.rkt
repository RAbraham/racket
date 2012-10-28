;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |transpose matrix|) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp")))))
(define row0 (cons 1 (cons 2 empty)))
(define row1 (cons 3 (cons 4 empty)))
(define mat1 (cons row0 empty))
(define mat22 (cons row0 (cons row1 empty)))
; A matrix is a ListOfRows
; A row is a List of Numbers

;ListOfRows -> ListOfRows
;returns a transposed matrix
;i.e. the first row becomes the first column and so on

(check-expect (tam empty) empty)
(check-expect (tam (cons row0 empty)) (cons (cons 1 empty) (cons (cons 2 empty) empty)))
(define (tam mat) 
  (cond
    [(empty? mat) empty]
    [(all-empty? mat) empty]
    [(cons? mat) (cons (first* mat) (tam (rest* mat)))]))

;returns the first of each list
;ListOfRows -> ListOfNumbers
(check-expect (first* empty) empty)
(check-expect (first* mat1) (cons 1 empty))
(check-expect (first* mat22) (cons 1 (cons 3 empty)))
(define (first* mat)
  (cond
    [(empty? mat) empty]
    [(cons? mat) (cons (first (first mat)) (first* (rest mat)))]))

;returns the rest of the Matrix except their first elements
;ListOfRows -> ListOfRows
(check-expect (rest* mat1) (cons (cons 2 empty) empty))
(check-expect (rest* mat22) (cons (cons 2 empty) (cons (cons 4 empty) empty)))
(define (rest* mat)
  (cond
    [(empty? mat) empty]
    [(cons? mat) (cons (rest (first mat)) (rest* (rest mat)))]))

;returns True if all elements in lists are empty
;List -> Boolean
(check-expect (all-empty? empty) true)
(check-expect (all-empty? (cons empty empty)) true)
(check-expect (all-empty? (cons empty (cons 6 empty))) false)
(define (all-empty? l)
  (cond
    [(empty? l) true]
    [(cons? l) (and (empty? (first l)) (all-empty? (rest l)))])
  )

