## The functions below allow to cache inverse of a matrix.
## For this assignment an assumption is made that the matrix supplied is always
## invertible
## Matrix creation example:
## test1 <- matrix(sample(1:100000, 16), 4, 4)

## `makeCacheMatrix` function below creates a special "matrix" object that can
## cache its inverse and makes functions `set`, `get`, `setinv` and `getinv`
## available for the next function 'cacheSolve`
## Example of usage:
## test11 <- makeCacheMatrix(test1)

makeCacheMatrix <- function(x = matrix()) {
        inv_m <- NULL
        set <- function(y) {
                x <<- y
                inv_m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv_m <<- solve
        getinv <- function() inv_m
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## `cacheSolve` function computes the inverse of the special "matrix" returned
## by `makeCacheMatrix` above. If the inverse has already been calculated then
## `cacheSolve` retrieves the inverse from the cache
## Example of usage:
## cacheSolve(test11)

cacheSolve <- function(x, ...) {
        inv_m <- x$getinv()
        if(!is.null(inv_m)) {
                message("getting cached inversed matrix")
                return(inv_m)
        }
        data <- x$get()
        inv_m <- solve(data, ...)
        x$setinv(inv_m)
        return(inv_m)
}
