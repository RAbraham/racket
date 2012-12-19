;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex-2-3-binary-mobile) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; A mobile is a pair of
;left-branch and right-branch
(define (make-mobile left right)
  (cons left (cons right empty)))
(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))

; a branch is a 
; (length, structure)

; A structure is either a
; - weight
; - Mobile

(define (make-branch length structure)
  (cons length (cons structure empty)))



(define (branch-length b) (car b))
(define (branch-structure b) (car (cdr b)))
;cdr: expects a pair; given 100

;total-weight is the weight of its left and right branches



(define m (make-mobile (make-branch 3 5) (make-branch 2 9)))
(define m1 (make-mobile (make-branch 100 (make-mobile (make-branch 99 11)
                                                      (make-branch 98 5)))
                        (make-branch 400 6)))


(check-expect (total-weight m) 14)
(check-expect (total-weight m1) 22)
; Mobile -> Int

(define (total-weight m)
  (let ((l-b (left-branch m))
        (r-b (right-branch m))) 
    (+ (weight (branch-structure l-b))
       (weight (branch-structure r-b))) 
    ))


;Type Structure
;Weight of a structure is the leaf weight or the weight of the mobile
; Structure -> Number 
(define (weight s)
  (cond
    [(number? s) s]
    [else (total-weight s)]))

(define (sum l)
  (foldl + 0 l))

;-------------------------------------------------------------------------

; Predicates if the tree is balanced
; Tree<Mobile> -> True
(define mbt (make-mobile (make-branch 4 5) (make-branch 4 5)))
(define mx (make-mobile (make-branch 99 11)
                        (make-branch 222 1)))
(define mt (make-mobile (make-branch 100 (make-mobile (make-branch 20 5)
                                                      (make-branch 25 4)))
                        (make-branch 450 2)))

(check-expect (balanced? mbt) true)
(check-expect (balanced? mx) false)
(check-expect (balanced? mt) true)

(define (balanced? m)
  (let ((l-b (left-branch m))
        (r-b (right-branch m)))
    (and (= (torque l-b)
            (torque r-b))
         (balanced-structures? m))))


; Type:  mobile 
; Mobile -> Boolean
; Contract:
; Test

(define (balanced-structures? m)
  (and (balanced-structure? (branch-structure (left-branch m)))
      (balanced-structure? (branch-structure (right-branch m)))
  ))

;Type Structure
; Structure -> Boolean

(define (balanced-structure? s)
  (cond
    [(number? s) true]
    [else (balanced? s)])
  )(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

;Torque of a branch
; Branch -> N
(define (torque b)
  (* (branch-length b) (weight (branch-structure b))))



