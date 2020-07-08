;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_044) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(define SCENE (empty-scene 500 40))

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

(define HEIGHT-OF-WORLD (image-height BACKGROUND))
(define MID-HEIGHT-OF-WORLD (/ HEIGHT-OF-WORLD 2))

(define WIDTH-OF-CAR (image-width CAR))
(define MID-WIDTH-OF-CAR (/ WIDTH-OF-CAR 2))
(define HEIGHT-OF-CAR (image-height CAR))
(define MID-HEIGHT-OF-CAR (/ HEIGHT-OF-CAR 2))
(define Y-MIN MID-HEIGHT-OF-CAR)
(define Y-MAX (- HEIGHT-OF-WORLD
                 MID-HEIGHT-OF-CAR))
(define Y-INTERVAL (- Y-MAX Y-MIN))

(define Y-CAR (- (image-height BACKGROUND)
                 (/ (image-height CAR) 2)))

(define STEP 3)

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [on-mouse hyper]
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
                                       (- 50 MID-WIDTH-OF-CAR)
                                       (y-car 50)
                                       BACKGROUND))
(check-expect (render 200) (place-image CAR
                                        (- 200 MID-WIDTH-OF-CAR)
                                        (y-car 200)
                                        BACKGROUND))
(define (render cw)
  (place-image CAR
               (- cw MID-WIDTH-OF-CAR)
               (y-car cw)
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

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down"
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (hyper x-position-of-car x-mouse y-mouse me)
  x-position-of-car)

; Number -> Number
; calculate y coordinate of the car depend x
(check-expect (y-car 0) MID-HEIGHT-OF-WORLD)
(check-expect (inexact->exact (y-car (/ pi 2))) Y-MAX)
(check-expect (inexact->exact (y-car (* pi 3/2))) Y-MIN)
(define (y-car x)
  (+ MID-HEIGHT-OF-WORLD (* (/ Y-INTERVAL 2) (sin x))))

(main 0)