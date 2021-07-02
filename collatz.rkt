#lang racket

(define/contract (collatz n)
  (-> exact-positive-integer? exact-positive-integer?)
  (cond
    [(= n 1) 1]
    [(= (remainder n 2) 0) (collatz (/ n 2))]
    [else (collatz (+ (* n 3) 1))]))