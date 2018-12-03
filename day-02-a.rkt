#lang racket
(require 2htdp/batch-io)

; doesn't work

(define box-ids (read-lines 'stdin))

(define checksum-pieces
    (foldl (lambda (line two-three-count)
        (let*
            (
            [twos (car two-three-count)]
            [threes (cadr two-three-count)]
            [counts (map length
                        (group-by
                            (lambda (x) x)
                            (remove "" (string-split line ""))))]
            [has-two (member 2 counts)]
            [has-three (member 3 counts)]
            [new-twos (+ twos (if has-two 1 0))]
            [new-threes (+ threes (if has-three 1 0))])
            (cons new-twos (cons new-threes '()))))
            '(0 0)
            box-ids))

(apply * checksum-pieces)

