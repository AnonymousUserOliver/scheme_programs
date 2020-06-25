#| Part 0 |#
#| This function recursively find the indexes of the occurance of the atom in the list
and construct a list of the indexes in reverse order|#
(define (findindexhelper lst atm indexes index)
  (cond
    ((null? lst) indexes)
    (else (cond
            ((= atm (car lst)) (findindexhelper (cdr lst) atm (cons index indexes) (+ index 1)))
            (else (findindexhelper (cdr lst) atm indexes (+ index 1)))))))

#| This function recursively reverse the order of a list  |#
(define (reverselist original reversed)
  (cond
    ((null? original) reversed)
    (else (reverselist (cdr original) (cons (car original) reversed)))))

#| This function calls the recursive helper function to compute the output index list.
  It calls the reverselist function to reverse the order of index list before returning it.|#
(define (findindex lst atm)
  (cond
    ((null? (findindexhelper lst atm '() 0)) '(-1))
    (else (reverselist (findindexhelper lst atm '() 0) '()))))

(display "Question 1\n")
(findindex '(1 2 4 3 2 5 3 7 2) 3)
(findindex '(1 2 4 3 2 5 3 7 2) 2)
(findindex '(1 2 4 3 2 5 3 7 2) 6)

#| Part 1|#

#| This function recursively find the list of indexes that satisfies condition.
 The returned list is in reverse order|#
(define (findrangeindexhelper lst func atm indexes index)
  (cond
    ((null? lst) indexes) 
    (else (cond
            ((= atm (func (car lst))) (findrangeindexhelper (cdr lst) func atm (cons index indexes) (+ index 1)))
            (else (findrangeindexhelper (cdr lst) func atm indexes (+ index 1)))))))

#| This function calls the recursive helper function to compute the output.
 It calls the reverselist function to reverse the output list.|#
(define (findrangeindex lst func atm)
  (cond
    ((null? (findrangeindexhelper lst func atm '() 0)) '(-1))
    (else (reverselist(findrangeindexhelper lst func atm '() 0) '()))))




(display "Question 2\n")
(define (inc x) (+ x 1))
(findrangeindex '(1 2 4 3 2 5) inc 3)
(findrangeindex '(3 5 1) inc 2)

#| Part 2 |#

#| This function checks if a list contains a certain atom.
 It returns #f if it doesn't contains the atom and
returns the atom if it does. |#
(define (contains lst atm)
  (cond
    ((null? lst) #f)
    (else (cond
            ((eq? atm (car lst)) atm)
            (else (contains (cdr lst) atm))))))

#| This function recursively find the intersection of the two lists
 and constructs a list that contains the elements in their intersection.|#
(define (intersectionhelper lst1 lst2 result)
  (cond
    ((null? lst2) result)
    (else (cond
            ((contains lst1 (car lst2)) (intersectionhelper lst1 (cdr lst2) (cons (car lst2) result)))
            (else (intersectionhelper lst1 (cdr lst2) result))))))

#| This function calls the recursive helper function to compute the intersection  |#
(define (intersection lst1 lst2)
  (intersectionhelper lst1 lst2 '()))

(display "Question 3\n")
(intersection '(2) '(2))
(intersection '(2) '(1))
(intersection '(1 2) '(1))
(intersection '(2 1 2) '((1) 2))

#| Part 3 |#

(display "Question 4\n")
#| This function takes two functions as arguments and
 compose a function from them|#
(define (compose func1 func2)
  (define (result arg)
    (func2 (func1 arg)))
  result)

(compose inc inc)
((compose inc inc) 5)

#| Part 4 |#

#| This function recursively compute the output list in reverse order
 and it returns an error message if the two lists are not of the same size|#
(define (map2helper list0 list1 p f output)
  (cond
    ((null? list0) (cond
                     ((null? list1) output)
                     (else "ERROR: The two lists are not of the same size!\n")))
    ((null? list1) "ERROR: The two lists are not of the same size! \n")
    (else (cond
            ((p (car list0)) (map2helper (cdr list0) (cdr list1) p f (cons (f (car list1)) output)))
            (else (map2helper (cdr list0) (cdr list1) p f (cons (car list1) output)))))))

#| This function calls the recursive helper function to compute the output list.
 It calls the reverselist function to convert the output to the correct order.
 It returns an error message if the helper function returns one. |#
(define (map2 list0 list1 p f)
  (cond
    ((list? (map2helper list0 list1 p f '())) (reverselist (map2helper list0 list1 p f '()) '()))
    (else (map2helper list0 list1 p f '()))))

(display "Question 5\n")
(map2 '(1 2 3 4) '(2 3 4 5) (lambda (x) (> x 2)) inc)

#| Part 5 |#

#| This function recursively construct a lambda function that takes in a certain number
  of arguments, specified by argumetn "step", and returns the last arguments only. |#
(define (skiphelper step func)
  (cond
    ((= step 0) func)
    (else (skiphelper (- step 1) (lambda (x) func)))))
#| This function calls the recursive helper function and pass in the last function
 to be called in the returned chain of functions, which returnes the argument itself.|#
(define (skip step)
  (skiphelper step (lambda (x) x)))

(display "Question 6\n")
((skip 0) 'foo)
(((skip 1) 'foo) 'bar)
((((skip 2) 'foo) 'bar) 'baz)
