;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_017) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (image-classify img)
  (image-classify-by-sizes (image-height img)
                           (image-width img)))

(define (image-classify-by-sizes height width)
  (cond
    [(= height width) "square"]
    [(> height width) "tall"]
    [(< height width) "wide"]))

