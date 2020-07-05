;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_030) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PERFORMANCE-FIXED-COST 180)
(define COST-PER-ATTENDEE 0.04)
(define BASE-TICKET-PRICE 5.0)
(define PEOPLE-COUNT-ON-BASE-TICKET-PRICE 120)
(define PRICE-SENSITIVITY-OF-ATTENDANCE (/ 15 0.1))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (cost ticket-price)
  (+ PERFORMANCE-FIXED-COST
     (* COST-PER-ATTENDEE (attendees ticket-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (attendees ticket-price)
  (- PEOPLE-COUNT-ON-BASE-TICKET-PRICE
     (* (- ticket-price BASE-TICKET-PRICE) PRICE-SENSITIVITY-OF-ATTENDANCE)))