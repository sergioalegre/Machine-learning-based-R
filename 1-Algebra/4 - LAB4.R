# 1. Define matrix A as a square matrix with entries of your choice.
A <- matrix(1:9, nrow = 3, byrow = TRUE)
A


# 2. Find the transpose of A.
A.t <- t(A)
A.t


# 3. Find the inverse of A, if it exists. 
#    If it does not exist, define a new matrix A that is invertible.
A.i <- solve(A) # not invertible

A <- matrix(c(1,4,2,-1,5,6,0,-2,5), nrow = 3)
A
A.i <- solve(A)
A.i



# 4. Multiply A by its inverse. 
#    Before doing so, what is the expected result?
round(A %*% A.i)