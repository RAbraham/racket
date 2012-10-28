;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname S-Expr-Count) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Count the number of times a symbol occurs in a S-Expr
;S-Expr Symbol -> N

(check-expect (count empty 'hello) 0)
(check-expect (count 1 'hello) 0)
(check-expect (count 'hello 'hello) 1)
(check-expect (count '(hello world) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

(define (count sexp sy) 
  (local (; S-Exp -> N
          (define (count-sexp sexp) 
            (cond 
              [(atom? sexp) (count-atom sexp)]
              [else (count-sl sexp)]))
          ; SList -> N
          (define (count-sl sl) 
            (cond
              [(empty? sl) 0]
              [else (+ (count-sexp (first sl) )
                       (count-sl (rest sl)))]))
          ; Count Atom
          (define (count-atom atom) 
            (cond
              [(number? atom) 0]
              [(string? atom) 0]
              [(symbol? atom) (if (symbol=? atom sy) 1 0)]
              [else 0]))
          
          )
    (count-sexp sexp)))

; Atom -> Boolean
(check-expect (atom? "a") true)
(check-expect (atom? 1) true)
(check-expect (atom? 'hello) true)
(check-expect (atom? (list 1 2)) false)

(define (atom? element) 
  (or (string? element)
      (number? element)
      (symbol? element)))
