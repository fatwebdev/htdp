;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_037) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; produces a string like the given one with the first character removed
; given: "hello", expect: "ello"
; given: "sicp", expect: "icp"
; given: "", expect: ""
(define (string-rest str)
  (if (zero? (string-length str))
      ""
      (substring str 1)))