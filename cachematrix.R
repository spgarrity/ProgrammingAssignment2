## Summary: Creates Inverse Matrix; but checks to see if previously cached
## Two Step Process

## Step 1: Foundation code with Get/Set Functions
## Functions Include:
## Set --> Sets the Matrix Value
## Get --> Gets the Matrix Value
## SetInverse --> Sets the Inverse Value
## GetInverse --> Gets the Inverse Value 

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) s <<- solve
    getinverse <- function() s
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Step 2: Checks to see if Inverse Matrix exists in cache
## If Inverse Matrix does not exist, than create

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
        s <- x$getinverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setinverse(s)
    s
}


