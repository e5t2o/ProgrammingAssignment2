## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


## This function determines the inverse of a matrix and caches it in a list for 
## future use. 
makeCacheMatrix <- function(x = matrix()) {
        gin <- NULL
        set <- function(y) {
                x <<- y
                gin <<- NULL
        }
        get <- function() x
        setgin <- function(ginv) gin <<- ginv
        getgin <- function() gin
        list(set = set, get = get,
             setgin = setgin,
             getgin = getgin)
}


## Returns a matrix that is the inverse of 'x'

## This function determines if the inverse of the matrix has already been 
## determined, if not, then it determines the inverse of the matrix and palces 
## the result in the cache via the setgin function.

cacheSolve <- function(x, ...) {
        makeCacheMatrix(gin)
        gin <- x$getgin()
        if(!is.null(gin)) {
                message("getting cached data")
                return(gin)
        }
        data <- x$get()
        gin <- gin(data, ...)
        x$setmean(gin)
        gin
}
