;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_042) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WHEEL-RADIUS 5)
(define WHEEL-DIAMETER (* WHEEL-RADIUS 2))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "transparent"))
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

(define SCENE (empty-scene 500 90))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND
  (place-image TREE
               60
               (- (image-height SCENE)
                  (/ (image-height TREE) 2))
               SCENE))

(define Y-CAR (- (image-height BACKGROUND)
                 (/ (image-height CAR) 2)))

(define STEP 3)

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock cw)
  (+ cw STEP))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(check-expect (render 50) (place-image CAR
                                       (- 50 (/ (image-width CAR) 2))
                                       Y-CAR
                                       BACKGROUND))
(check-expect (render 200) (place-image CAR
                                        (- 200 (/ (image-width CAR) 2))
                                        Y-CAR
                                        BACKGROUND))
(define (render cw)
  (place-image CAR
               (- cw (/ (image-width CAR) 2))
               Y-CAR
               BACKGROUND))

; WorldState -> Boolean
; stops the animation when the car has disappeared on the right side
(check-expect (end? 0) #false)
(check-expect (end? (+ (image-width BACKGROUND)
                       (image-width CAR)
                       STEP
                       1))
              #true)
(define (end? cw)
  (< (+ (image-width BACKGROUND)
        (image-width CAR)
        STEP)
      cw))

(main 0)