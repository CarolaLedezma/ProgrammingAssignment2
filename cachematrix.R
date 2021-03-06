## Almacenamiento en caché de la inversa de una matriz 

## La inversión de matriz es generalmente un cálculo costoso.
## Hay mucho beneficio para el almacenamiento en caché de la inversa de
## una matriz en lugar de calcular varias veces.


makeCacheMatrix <- function(x=matrix()) {
  ## Crea una lista de funciones
  ## pueden almacenarse  cache de la matrix inversa
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<-inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


cacheSolve <- function(x, ...) {
  ## Calcula la inversa de la matriz devuelta
  ## Por makeCacheMatrix ()
  ## Ya ha calculado, en cuyo caso
  ## Se recupera de la memoria caché.
  m <- x$getInverse()
  if ( ! is.null(m)) {
    print("getting cached data")
    return(m)
  }
  m <- solve(x$get())
  x$setInverse(m)
  m
}


## Pruebas


a <- makeCacheMatrix(matrix(1:4,2))
a$get()
a$getInverse()
a$set(matrix(5:8,2))
a$get()
cacheSolve(a)
cacheSolve(a)
a$getInverse()
b = a$getInverse()
a$get() %*% b