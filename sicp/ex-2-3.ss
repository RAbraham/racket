;------------------------------------------
;Degrees
; Creator, Accessors
(define (make-degree n) n)
;Operations


;-------------------------------------------
;Point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;---------------------------------------------------------
;Segment - Creators and Accessors
(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
;Segment - Operators

;n,n->n
(define (mid a b) (/ (+ a b) 2))
;S -> Point
(define (midpoint s) 
  (define sp (start-segment s))
  (define ep (end-segment s))
  
  (let ((x1 (x-point sp))
        (x2 (x-point ep))
        (y1 (y-point sp))
        (y2 (y-point ep))
        )
    (make-point (mid x1 x2) (mid y1 y2))  ))

; Seg,Seg -> Degree
(define (angle seg1 seg2)
  (make-degree 90)
  )
;List<Segs>,List<Segs> -> List<Segs>
(define (intersection l1 l2)
  (list 1)
  )

;--------------------------------------------
;Rectangle
;Constructor and Selectors
; Constraints: All angles of a rectangle are  90 degrees
; Constraint: Opposite sides are equal
; Constraint: area of triangle is l*b
; Constraint: perimeter of triangle is 2(l+b)
;(= (angle l-seg b-seg) (degrees 90)) 

(define (make-rect l-seg b-seg)

  (define (right-angled? seg1 seg2) 
    (= (angle seg1 seg2) (make-degree 90))
   )
  
  (define (common-terminating-point seg1 seg2)
    (= (length (intersection seg1 seg2)) 1))
  
  (if (and (right-angled? l-seg b-seg) (common-terminating-point l-seg b-seg))
      (cons l-seg b-seg)
      (error "Given segments are not segments of a rectangle")))

;Length of rectangle
; Rectangle->N
(define (length r) (distance (car r)))
(define (breadth r)(distance (cdr r)))

; Returns area of a rectangle
; the area of a triangle is the product of its length and breadth
; Rect -> N
(define (area r) 
  (* (length r) (breadth r))
;perimeter
(define (perimeter r)
  (* 2 (+ (length r) (breadth r))))

;===============================================
(define s1 (make-segment (make-point 1 1) (make-point 5 1)))
(define s1 (make-segment (make-point 1 1) (make-point 1 5)))
