#lang racket
(require 2htdp/batch-io)

; doesn't work

(define box-ids
    (map
        (lambda (l) (remove* '("") (string-split l "")))
        (read-lines 'stdin)))

(define (num-differences a b)
    (foldl + 0
        (map
            (lambda (e) (if e 0 1))
            (map eq? a b))))

(define all-pairs (cartesian-product box-ids box-ids))

(define diffs (map
    (lambda (p)
        (let (
            [one (car p)]
            [two (cadr p)])
            (list
                (num-differences one two)
                one
                two)))
    all-pairs))

(findf (lambda (el) (eq? (car el) 1)) diffs)