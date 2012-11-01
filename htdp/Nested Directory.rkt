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
(define d_f1 (make-dir 'd '(f1) empty))
(define d_f2 (make-dir 'd '(f1 f2) empty))

;empty dir

;dir with one subdir
(define d_d1 (make-dir 'd_d1 empty '(d0)))
;dir with one file and one subdir

;dir with 2 files, 2 subdir
;dir 2 files,1 subdir with a file
(define d_2f_df (make-dir 'd_2f_d (list f1 f2) (list d_f1)))

;dir no files,1 subdir with 2 files
(define d0_d2 (make-dir 'd0_d2 empty (list d_f2)))
;dir with 2 files, 2 subdir with files
(define nested_dir (make-dir 'nested_dir (list f1 f2) (list d_f1 d_f2)))
; recursively counts the number of files in a directory
; Dir -> N

(check-expect (file-count d_2f_df) 3)
(check-expect (file-count d0_d2) 2)
(check-expect (file-count nested_dir) 5)

(define (file-count d)
  
  (+ (length (dir-files d))
      (foldl +
             0 
             (map file-count (dir-dirs d)))))

