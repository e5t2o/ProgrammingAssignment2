## Matrix inversion functions

## These functions were generated as a way to cache inverted matrices for cases 
## where the inverse of a matrix may need to be calculated multiple times as it 
## can be a computationally expensive calculation. 

## Assumptions- this function assumes that the applied matrix is invertible. 

## Function 1

## This function generates a list of functions to be applied to a matrix.

## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve #<<- operator is used to assign 
        #a value to an object in an environment that is different from the 
        #current environment
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## Function 2

## Returns a matrix that is the inverse of 'x'

## This function determines if the inverse of the matrix has already been 
## determined, if not, then it determines the inverse of the matrix and places 
## the result in the cache via the setgin function. In either case, the 
## inverted matrix is then printed.

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

##Below is a short test of the function comparing the results of 'solve' 
##function to the results of the above functions as an example. 

#m=matrix(c(1,2,3,4),2,2)
#solve(m)
#move=makeCacheMatrix(m)
#cacheSolve(move)
