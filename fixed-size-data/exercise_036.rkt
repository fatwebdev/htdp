;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_036) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; We use numbers to represent pixels count
; Image -> Number
; counts the number of pixels in a given image
; given:
;    (square 10 "solid" "red")
; expect:
;    100
(define (image-area img)
  (* (image-height img)
     (image-width img)))