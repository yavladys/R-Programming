## Below are two functions that are used to create a special object
## that stores a numeric matrix and cache's its inverse.

## The first function, makeCacheMatrix creates special object, 
## which is a list containing a function to
## get the matrix
## set the inverse of this matrix
## get the inverse of this matrix

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  get <- function() x
  setinv<-function (inverse) m<<-inverse
  getinv<-function() m
  list(get=get, setinv = setinv, getinv = getinv)
}


## The following function calculates the inverse of special
## object created with the above function. However,
## it first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and sets the inverse
## of the matrix in the cache via the setinv function.

cacheSolve <- function(x, ...) {
  m<-x$getinv()
  if(!is.null(m)) {
  message("getting cached data")
  return(m)
  }       else {
                m<-solve(x$get()) 
                x$setinv(m)
                return(m)
          }
}