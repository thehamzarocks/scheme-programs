(define tre '(5 (3 (2 () ()) (4 () ())) (15 (6 () ()) (28 () ()))))

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




(define (count-members-between-ages age-bst age1 age2)
(cond ((is-empty? age-bst) 0)
((and (> (get-entry age-bst) age1) (> (get-entry age-bst) age2)) (+ (count-members-between-ages (get-left-bst age-bst) age1 (get-entry age-bst))))
((and (< (get-entry age-bst) age1) (< (get-entry age-bst) age2)) (+ (count-members-between-ages (get-right-bst age-bst) (get-entry age-bst) age2)))
((and (> (get-entry age-bst) age1) (< (get-entry age-bst) age2)) 
     (+ 1 (count-members-between-ages (get-left-bst age-bst) age1 age2)
          (count-members-between-ages (get-right-bst age-bst)   age1 age2)))
((and (< (get-entry age-bst) age1) (> (get-entry age-bst) age2)) 
     (+ 1 (count-members-between-ages (get-left-bst age-bst) age1 age2)
          (count-members-between-ages (get-right-bst age-bst)   age1 age2)))
(else (+ (count-members-between-ages (get-left-bst age-bst) age1 age2) (count-members-between-ages (get-right-bst age-bst) age1 age2)))))



