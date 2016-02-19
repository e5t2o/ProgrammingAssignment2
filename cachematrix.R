## 
## This function determines the inverse of a matrix and caches it in a list for 
## future use. 
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Returns a matrix that is the inverse of 'x'

## This function determines if the inverse of the matrix has already been 
## determined, if not, then it determines the inverse of the matrix and places 
## the result in the cache via the setgin function and then prints the inverted 
##matrix.

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
##function to the results of the above functions. 
library(MASS)
m=matrix(c(1,2,3,4),2,2)
solve(m)
move=makeCacheMatrix(m)
cacheSolve(move)
