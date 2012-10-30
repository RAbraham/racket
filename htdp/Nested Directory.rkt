;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Nested Directory|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct dir (name files dirs))
;(make-dir Symbol File* Dir* )

; A Dir* is one of 
; - empty
; - (cons Dir Dir*)

; A File* is one of 
; - empty
; - (cons File File*)

(define-struct file (name content size))
;(make-file Symbol String Number)

(define f1 (make-file 'f1 "" 11))
(define f2 (make-file 'f2 "" 22))
(define d0 (make-dir 'd0 empty empty))
(define d0_f1 (make-dir 'd0 '(f1) empty))
(define d0_f2 (make-dir 'd0 '(f1 f2) empty))

;empty dir

;dir with one file

;(make-dir 'root ())
;dir with one subdir
;dir with one file and one subdir
;dir with 2 files, 2 subdir
;dir 2 files,1 subdir with a file
;dir no files,1 subdir with 2 files
;dir with 2 files, 2 subdir with a file each
