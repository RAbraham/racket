(define (assert exp act . msg)
  (define (message m)
    (if (null? m)
        ""
        (car m)))
  (if (not (equal? exp act))
      (error (message msg) "exp =" exp "act="act)
      ))



