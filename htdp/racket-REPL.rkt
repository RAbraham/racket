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


; Atom Predicate
; S-Exp -> Boolean
(check-expect (atom? "s") true)
(check-expect (atom? (make-posn 5 6)) false)
(check-expect (atom? 99) true)
(check-expect (atom? 'f1) true)
(define (atom? s) 
  (or (symbol? s) (number? s) (string? s)))

; A BSL-var-expr is one of:
; – Number
; – Symbol
; – (make-add BSL-var-expr BSL-var-expr)
; – (make-mul BSL-var-expr BSL-var-expr)

;Substitute symbol by a Number
;BSL-Var-Expr -> BSL-Var-Expr
(check-expect (subst 'y 'x 2) 'y)
(check-expect (subst 'x 'x 3) 3)
(check-expect (subst (make-add 'x 3) 'x 2 ) (make-add 2 3))
; add and mul recursive
(check-expect (subst (make-add (make-add 4 'x) 3) 'x 2 ) (make-add (make-add 4 2) 3))
; recursive add where x does not exist
(check-expect (subst (make-add (make-add 4 'y) 3) 'x 2 ) (make-add (make-add 4 'y) 3))

(check-expect (subst (make-add (make-mul 4 'x) 3) 'x 2 ) (make-add (make-mul 4 2) 3))
; two tangents, exists/does not exist, recursive
(define (subst e x v) 
  (cond
    [(number? e) e]
    [(symbol? e) (if (eq? x e) v e)]
    [(add? e) (make-add (subst (add-left e) x v) (subst (add-right e) x v))]
    [(mul? e) (make-mul (subst (mul-left e) x v) (subst (mul-right e) x v))]
    ))
;==========================================================================================
; The method parse was copied from a textbook :)
(define WRONG "wrong kind of S-expression")
 
; S-expr -> BSL-expr
; create representation of a BSL expression for s (if possible)
(check-expect (parse '(* 3 5)) (make-mul 3 5))
(check-expect (parse '(* 4 (+ 2 3))) (make-mul 4 (make-add 2 3)))
(define (parse s)
  (local (; S-expr -> BSL-expr
          (define (parse s)
            (cond
              [(atom? s) (parse-atom s)]
              [else (parse-sl s)]))
 
          ; SL -> BSL-expr
          (define (parse-sl s)
            (local ((define L (length s)))
              (cond
                [(< L 3)
                 (error WRONG)]
                [(and (= L 3) (symbol? (first s)))
                 (cond
                   [(symbol=? (first s) '+)
                    (make-add (parse (second s)) (parse (third s)))]
                   [(symbol=? (first s) '*)
                    (make-mul (parse (second s)) (parse (third s)))]
                   [else (error WRONG)])]
                [else
                 (error WRONG)])))
           ; Atom -> BSL-expr
          (define (parse-atom s)
            (cond
              [(number? s) s]
              [(string? s) (error "strings not allowed")]
              [(symbol? s) (error "symbols not allowed")])))
    (parse s)))