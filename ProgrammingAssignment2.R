## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  iv <- NULL
  set <- function(y) {
    x <<- y
    iv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) iv <<- inverse
  getInverse <- function() iv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## The function creates a cacheable matrix object with functions to set and retrieve the matrix.
## It also allows to set and retrieve the inverse and store intermediates.

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}
inv <- x$getInverse()
if (!is.null(inv)) {
  message("getting cached data")
  return(inv)
}
mat <- x$get()
inv <- solve(mat, ...)
x$setInverse(inv)
inv
}
## The function calculate the inverse of a matrix, catches the result to avoid redundancy if the same matrix is encountered again.