#lang racket

(define-syntax START
  (syntax-rules (:= <- IF THEN PRINT)
    [(START (x := y)) (void)]
    [(START (x <- y)) (set! x y)]
    [(START (IF c THEN stmt0 ...)) (begin (if (not (= c 0)) (START stmt0 ...) (void)) (void))]
    [(START (PRINT x)) (printf "~a\n" x)]
    [(START (x := y) stmt ...) (let ([x y]) (START stmt ...))]
    [(START (x <- y) stmt ...) (begin (set! x y) (START stmt ...))]
    [(START (IF c THEN stmt0 ...) stmt ...) (begin (begin (if (not (= c 0)) (START stmt0 ...) (void)) (void)) (START stmt ...))]
    [(START (PRINT x) stmt ...) (begin (printf "~a\n" x) (START stmt ...))]))