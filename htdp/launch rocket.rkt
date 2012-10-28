;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |launch rocket|) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "2htdp") (lib "arrow-gui.ss" "teachpack" "htdp") (lib "batch-io.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp")))))
; physical constants
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)
 
; graphical constants
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red")) ; use your favorite image
(check-expect
 (show "resting")
 (place-image ROCKET
              10 (- HEIGHT (/ (image-height ROCKET) 2))
              BACKG))
 
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET
                           10 (- HEIGHT (/ (image-height ROCKET) 2))
                           BACKG)))
 
(define ROCKET-CENTER (/ (image-height ROCKET) 2))

(check-expect
 (show HEIGHT)
 (place-image ROCKET 10 (- HEIGHT ROCKET-CENTER) BACKG))
 
(check-expect
 (show 53)
 (place-image ROCKET 10 (- 53 ROCKET-CENTER) BACKG))

(define (show x)
  (cond
    [(string? x)
     (scene HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (scene HEIGHT))]
    [(>= x 0)
     (scene x)]))

(define (scene x)
  (place-image ROCKET 10 (- x ROCKET-CENTER) BACKG))

    (check-expect (launch "resting" " ") -3)
    (check-expect (launch "resting" "a") "resting")
    (check-expect (launch -3 " ") -3)
    (check-expect (launch -1 " ") -1)
    (check-expect (launch 33 " ") 33)
    (check-expect (launch 33 "a") 33)
 
  (define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) (if (string=? "resting" x) -3 x) x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))
  
 
 ; LRCD -> LRCD
 
(define (main1 s)
 (big-bang s
           (to-draw show)
           (on-key launch)
           (on-tick fly 1)))
; LRCD -> LRCD
; raise the rocket by YDELTA if it is moving already
 
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))
 
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

(main1 "resting")