# Scheme Programs

## What is it? 
Some experimentations with scheme and functional programming. 

## Part 0
This function takes a list and an atom and returns a list the indexes at which the atom appears. 

## Part 1
This function takes a list and an unary function and an atom. It returns a list of indexes. If we apply the input function on an element in the list and the function returns a value equal to the atom in the argument, the index of that element is in the output list. 

## Part 2
This function takes two lists as arguments and return a list that represents their intersection. 

## Part 3
This function takes two functions as arguments and returns a function which is the composition of the two input functions. 

## Part 4
This function takes two lists of equal length, a unary predicate, and a unary function. It maps an element using the input function if the predicate holds, and keeps the original element if it doesn't. 

## Part 5
This function takes an integer x as argument, and returns a function that has x layers of composition. It returns the argument passed to it at the last layer. 