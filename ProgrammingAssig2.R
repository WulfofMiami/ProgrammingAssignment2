## The function creates a cacheable matrix object with functions to set and retrieve the matrix.
## It also allows to set and retrieve the inverse and store intermediates.

makecachematrix <- function(a = matrix())
{
  iv <- Null
  set <- function(b)
  {
    a <<- b
    iv <<- NULL
  }
  get <- function() a
  setinverse <- function(inverse) iv <<- inverse
  getinverse <- function() iv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

##The function calculate the inverse of a matrix, catches the result to avoid redundancy if the same matrix is encountered again.
##It also checks if the inverse is already cache, if so it will retrieve it.

cachesolve <- function (a, ... )
{
  iv <- a$getinverse()
  if (!is.null(iv)){
    message("Currently getting cached data")
    return(iv)
  }
  mx <- a$get()
  iv <- solve(mx, ... )
  a$setinverse(iv)
  iv
}
