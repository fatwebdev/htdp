;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_035) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> 1String
; extracts the last character from a non-empty string
; given: "hello", expect: "o"
; given: "sicp", expect: "p"
; given: "", expect: ""
(define (string-last str)
  (if (zero? (string-length str))
      ""
      (string-ith str (sub1 (string-length str)))))