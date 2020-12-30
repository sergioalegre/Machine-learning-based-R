# ---------------------------------------------
# TOC:
# 1. Matrix transpose
# 2. Matrix inverse
# 3. Identity matrix
# ---------------------------------------------

# ---------------------------------------------
# 1. Matrix transpose #las columnas se convierten en filas y las filas en columnas
# ---------------------------------------------
A <- matrix(1:12, nrow = 3, ncol = 2, byrow = TRUE)
A.t <- t(A)

v1 <- matrix(1:4, nrow = 1)
t(v1)

v2 <- 1:4
t(v2) # Always pass t() a matrix object



# ---------------------------------------------
# 2. Matrix inverse, solo para matrices 'cuadradas' y no puede tener una fila o columna con todo 'ceros'
# ---------------------------------------------
A <- matrix(1:4, nrow = 2, byrow = TRUE)
A^-1 # does not return an inverse; it returns element-wise reciprocation
solve(A)

### only square matrices are invertible
B <- matrix(1:6, nrow = 2)
solve(B) #como no es 'cuadrada' da error


### matrix cannot have a row or column of zeroes
C <- matrix(c(1,2,0,0), nrow = 2)
solve(C) #da error




# ---------------------------------------------
# 3. Identity matrix, generar matrices unitarias
# ---------------------------------------------
### A matrix times it inverse gives the identity
round(A %*% solve(A))


### Get the identity directly using diag(). Crea una matriz de identidad con la dimension indicada
I2 <- diag(2)
I3 <- diag(3)
I7 <- diag(7)


### A matrix times the identity yields the matrix again
A %*% I2