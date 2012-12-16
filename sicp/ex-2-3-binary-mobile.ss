;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex-2-3-binary-mobile) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; A mobile is a pair of
;left-branch and right-branch
(define (make-mobile left right)
  (list left right))
(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))


; a branch is a pair of either
; (length, weight)
; (length, mobile)

(define (make-branch length structure)
  (list length structure))


(define mx (make-mobile (make-branch 99 11)
                        (make-branch 222 1)))

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
  (+ (weight-branch (left-branch m))
     (weight-branch (right-branch m))))


(define (weight-branch b)
  (cond
    [(weight? b) (branch-structure b)]
    [else (total-weight (branch-structure b))]))

;Returns true if branch is a leaf weight
; Branch -> Boolean
(define (weight? b)
  (number?  (branch-structure b)))


(define bx (make-branch 100 (make-mobile (make-branch 99 11)
                                                      (make-branch 98 5))))
(weight-branch bx)


(define (sum l)
  (foldl + 0 l))

;Mobile-> Int
; Returns the weight of a mobiles leafs




