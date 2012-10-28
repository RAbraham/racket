;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Sorting) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp")))))
; List-of-numbers -> List-of-numbers
; produces a version of alon, sorted in descending order
 
(check-expect (sort-> empty) empty)
 
(check-expect (sort-> (list 12 20 -5)) (list 20 12 -5))
 
(check-expect (sort-> (list 3 2 1)) (list 3 2 1))
 
(check-expect (sort-> (list 1 2 3)) (list 3 2 1))
 
(define (sort-> alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon)  (sort-> (rest alon)))]))

;Inserts an element at a position where all number in the list below are equal or lower
;than it in comparison
; Number,ListOfNumbers -> ListOfNumbers
(check-expect (insert 5 empty) (cons 5 empty))
(check-expect (insert 3 (list 4)) (list 4 3))
(check-expect (insert 6 (list 2)) (list 6 2))
(check-expect (insert 6 (list 4 2)) (list 6 4 2))
(check-expect (insert 6 (list 9 2)) (list 9 6 2))
(check-expect (insert 6 (list  8 7)) (list 8 7 6))
(define (insert n alon)
  (cond
    [(empty? alon) (list n)]
    [(cons? alon) (if (>= n (first alon))
                       (cons n alon)
                       (cons (first alon) (insert n (rest alon))))]))