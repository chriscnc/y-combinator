#lang lazy

;(define factorial
;  (lambda (n)
;    (if (= n 0)
;        1
;        (* n (factorial (- n 1))))))

;(define Y
;  (lambda (f)
;    (f (Y f))))



(define almost-factorial
  (lambda (f)
    (lambda (n)
      (if (= n 0)
          1
          (* n (f (- n 1)))))))

(define Y
  (lambda (f)
    ((lambda (x) (f (x x)))
     (lambda (x) (f (x x))))))

(define factorial (Y almost-factorial))


(define identity (lambda (x) x))
(define factorial0 (almost-factorial identity))
;(define factorial1 (almost-factorial factorial0))

;(define factorialA (almost-factorial factorialA))

; (define factorial0
;   (lambda (n)
;     (if (= n 0)
;         1
;         (* n (identity (- n 1))))))

(define factorial1
  (lambda (n)
    (if (= n 0)
        1
        (* n ((if (= (- n 1) 0)
                    1
                    (* (- n 1) (identity (- (- n 1) 1)))))))))





