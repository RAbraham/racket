;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname racket-REPL) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;A Mul is a structure:
(define-struct mul (left right))
; (make-mul BSL-Expr BSL-Expr)

;A Add is a structure:
(define-struct add (left right))
; (make-add BSL-Expr BSL-Expr)


;BSL-Expr is one of 
; Number
;(make-mul BSL-Expr BSL-Expr)
;(make-add BSL-Expr BSL-Expr)


; Evaluates an expression;
; Mul|Add,Number -> Number
(check-expect (eval-expression 0) 0)
(check-expect (eval-expression (make-mul 3 5)) 15)
(check-expect (eval-expression (make-add 4 5)) 9)
(check-expect (eval-expression (make-add (make-mul 3 7) 5)) 26)
(check-expect (eval-expression (make-add (make-mul 1 1) 10)) 11)
(check-expect (eval-expression (make-mul (make-add 1 (make-mul 2 3)) (make-mul 2 6))) 84)
 
 
(define (eval-expression expr) 
  (cond 
    [(number? expr) expr]
    [(mul? expr) (* (eval-expression (mul-left expr)) (eval-expression (mul-right expr)))]
    [(add? expr) (+ (eval-expression (add-left expr)) (eval-expression (add-right expr)))]))

