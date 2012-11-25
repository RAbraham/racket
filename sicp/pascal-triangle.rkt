;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname pascal-triangle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;calculate pascal triangle for given depth n
; Integer -> List<List<Numbers>>

(check-expect (pascal-triangle 1) (list (list 1)))
(check-expect (pascal-triangle 2) (list (list 1) (list 1 1)))
(check-expect (pascal-triangle 3) (list (list 1) (list 1 1) (list 1 2 1)))
(define (pascal-triangle n)
  (local ( (define (i-pascal-triangle alon no)
             (cond
               [(= no 0) empty] 
               [else (cons (next-columns alon) (i-pascal-triangle (next-columns alon)(- no 1)))]))
             )
    (i-pascal-triangle empty n)))
  

;Properties of a number-triangle
; list of rows
; the next row(list) is one more in length than the current row
; rows start from 0.the 0th row has one element
; rules are given to generate the next row. row(n,rules)
; row(0,pascal-triangle-rules) = '(1)
; row(1,pascal-triange-rules) = '(1 1)
; until we reach n, we keep on adding the next row(list) to the main list.
; an edge is the first and last element of the row
; rules is a function, it will be given a column number and it has to return the value
; 


; The numbers at the edge of the triangle are all 1,
; and each number in the current row of the number triangle inside the triangle is the sum(left parent,right parent) 


; How do I make the lists?
; how do I get the previous values for the next list

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; generate next-row given current row
; List<Numbers> -> List<Numbers>
; size(output_list) -> 1 + size(input_list)
(check-expect (next-columns empty) (list 1))
(check-expect (next-columns (list 1)) (list 1 1))
(check-expect (next-columns (list 1 1)) (list 1 2 1))
(check-expect (next-columns (list 1 2 1)) (list 1 3 3 1))
(check-expect (next-columns (list 1 3 3 1)) (list 1 4 6 4 1))


(define (next-columns curr-cols )
 (local ( (define n  (length curr-cols))
          
          (define (last_edge? alon)
            (empty? (rest alon)))
          
          (define (next-col-i c-cols)
            (cond
              [(empty? c-cols) empty]
              [(last_edge? c-cols) (list 1)]
              [else (cons (+ (first c-cols) (second c-cols)) (next-col-i (rest c-cols)))])
            )
         )
   
   (cons 1 (next-col-i curr-cols))))

; List<Numbers>,Number -> Boolean
(define (first_edge? alon n)
  (= (length alon) (- n 1)))

