## Creates Inverse Matrix; but checks to see if previously cached 

## Foundation code with Get/Set Functions

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


## Check to see if Inverse Matrix exists in cache; otherwise create it 

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


