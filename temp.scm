(define (make-bst entry left right)
(list entry left right))
(define (get-entry bst)
(car bst))
(define (get-right-bst bst)
(caddr bst))
(define (get-left-bst bst)
(cadr bst))

(define make-empty-bst '())

(define (is-empty? bst)
(null? bst))

(define (is-leaf? bst)
(and (is-empty? (get-right-bst bst)) (is-empty? (get-left-bst bst))))

;MAIN FUNCTION 1
(define (search bst val)
(cond ((is-empty? bst) make-empty-bst)
      ((= (get-entry bst) val) bst)
      (else (append (search (get-left-bst bst) val) (search (get-right-bst bst) val)))))

(define (lowest_highest_age age-bst age)
 (cond ((is-empty? age-bst) make-empty-bst)
     ((is-empty? (search age-bst age)) (list (leftmost (get-left-bst age-bst)) (rightmost (get-right-bst age-bst))))
     ((not (is-empty? (search age-bst age))) (entry (bst-lst age-bst) age))
(else make-empty-bst)))
(define (bst-lst bst)
 (if(is-empty? bst)
'()
(append (bst-lst (get-left-bst bst)) (cons (get-entry bst) (bst-lst (get-right-bst bst))))))
(define (get-rest lst) (cdr lst))
(define (entry lst val)
(cond ((or (is-empty? lst) (is-empty? (get-rest lst))) '())
      ((= (get-left-bst lst) val) (list (get-entry lst) (entry (cdr lst) val)))
      ((= (get-entry lst) val) (get-left-bst lst))
      (else (entry (get-rest lst) val))))

(define (rightmost bst)
(cond ((is-leaf? bst) (get-entry bst))
      (else (rightmost (get-right-bst bst)))
))

(define (leftmost bst)
(cond ((is-leaf? bst) (get-entry bst))
(else (leftmost (get-left-bst bst)))))
              

;MAIN FUNCTION 2
(define (total-members-between-ages age-bst age1 age2)
(count-members-between-ages age-bst age1 age2))

(define (count-members-between-ages age-bst age1 age2)
(cond ((is-empty? age-bst) 0)
((and (> (get-entry age-bst) age1) (> (get-entry age-bst) age2)) (count-members-between-ages (get-left-bst age-bst) age1 age2))
((and (< (get-entry age-bst) age1) (< (get-entry age-bst) age2)) (count-members-between-ages (get-right-bst age-bst) age1 age2))
((and (> (get-entry age-bst) age1) (< (get-entry age-bst) age2)) 
     (+ 1 (count-members-between-ages (get-left-bst age-bst) age1 age2)
          (count-members-between-ages (get-right-bst age-bst)   age1 age2)))
((and (< (get-entry age-bst) age1) (> (get-entry age-bst) age2)) 
     (+ 1 (count-members-between-ages (get-left-bst age-bst) age1 age2)
          (count-members-between-ages (get-right-bst age-bst)   age1 age2)))
(else (+ (count-members-between-ages (get-left-bst age-bst) age1 age2) (count-members-between-ages (get-right-bst age-bst) age1 age2)))))
