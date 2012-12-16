;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname pascal-triangle-row-column) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;Give the pascal value in the rth row and the cth column ,both starting from 1
; Number,Number -> Number
(check-expect (pascal 1 1) 1)
(check-expect (pascal 3 1) 1)
(check-expect (pascal 3 2) 2)
(check-expect (pascal 5 3) 6)
(define (pascal r c) 
  (cond
    [(or (= c 1) (= r c)) 1]
    [else (+ (pascal (- r 1) (- c 1))
             (pascal (- r 1) c))])
  )

;Number -> List<List<Number>>
(define (p-t n)
 (map p-row (+ve-list n)))
  
; Number -> List<Number>
; Given a row , p-row will produce all its columns
(define (p-row r)
  (map (lambda (c) (pascal r c)) (+ve-list r)))
  
    
(define (+ve-list n)
  (build-list n (lambda (x) (add1 x))))

(p-t 4)
