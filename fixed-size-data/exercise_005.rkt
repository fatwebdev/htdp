;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_005) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define RATIO 1)
(define BOAT-COLOR "brown")

(define hull (overlay/align/offset "right" "top"
                                   (triangle/ass 90 (* RATIO 15) (* RATIO 20) "solid" BOAT-COLOR)
                                   (* RATIO -20) 0
                                   (overlay/align/offset "left" "top"
                                                         (triangle/sas (* RATIO 15) 90 (* RATIO 20) "solid" BOAT-COLOR)
                                                         (* RATIO 20) 0
                                                         (rectangle (* RATIO 60) (* RATIO 15) "solid" BOAT-COLOR))))

(define mast (rectangle (* RATIO 2) (* RATIO 30) "solid" BOAT-COLOR))

(define sail (rotate 135
                     (triangle/sas (* RATIO 20) 90 (* RATIO 20) "outline" "black")))

(overlay/align/offset "middle" "top"
                      (overlay/align/offset "right" "top"
                                            mast
                                            (* RATIO -2) 0
                                            sail)
                      0 (* RATIO 30)
                      hull)
