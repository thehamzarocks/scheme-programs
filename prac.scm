(define (make-tree entry left right)
(list entry left right))

(define (get-entry tree)
(car tree)
)

(define (get-leftsubtree tree)
(cadr tree))

(define (get-rightsubtree tree)
(caddr tree))

(define (is-empty-tree? tree)
(null? tree))

(define (is-leaf? tree)
(and (is-emptry-tree? (get-rightsubtree tree)) (is-empty-tree? (get-leftsubtree tree))))

(define make-empty '())

(define (tree->lst tree)
(cond ((is-empty-tree? tree) make-empty)
      (else (append (get-leftsubtree tree) (cons (get-entry tree) (get-rightsubtree tree))))))

(define (is-member-tree? tree val)
   (cond ((is-empty-tree? tree) #f)
         ((eq? (get-first (tree->lst tree))) #t)
         (else (
