;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_039) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WHEEL-RADIUS 5)
(define WHEEL-DIAMETER (* WHEEL-RADIUS 2))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS
  (beside/align "bottom" WHEEL SPACE WHEEL))
(define ROOF
  (rectangle (+ WHEEL-DISTANCE WHEEL-DIAMETER) WHEEL-RADIUS "solid" "red"))
(define BODY
  (rectangle (* WHEEL-DISTANCE 3) WHEEL-DIAMETER "solid" "red"))
(define BODY-WITH-ROOF
  (above ROOF BODY))

(define CAR
  (overlay/align/offset "middle" "bottom"
                        BOTH-WHEELS
                        0 (* WHEEL-RADIUS -1)
                        BODY-WITH-ROOF))

CAR