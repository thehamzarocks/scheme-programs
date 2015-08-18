(define (reverse x)
           (if(null? x)
              '()
              (append (reverse (cdr x)) (list (car x)))))
