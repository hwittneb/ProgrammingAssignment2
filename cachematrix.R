# Caching the Inverse of a Matrix
#
# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.
# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    minv <- NULL
    set <- function(y) {
        x <<- y
        minv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) minv <<- inverse
    getInverse <- function() minv
    list(set=set, get=get, 
         setInverse=setInverse, 
         getInverse=getInverse)
}
# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.
# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
    minv <- x$getInverse()
    if(!is.null(minv)) {
        message("getting cached data.")
        return(minv)
    }
    data <- x$get()
    minv <- solve(data)
    x$setInverse(minv)
    minv
}