#basado en: https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108218
# ---------------------------------------------
# TOC:
# 1. Scalar multiplication of matrices
# 2. Matrix addition and subtraction
# 3. Matrix multiplication
# ---------------------------------------------

# ---------------------------------------------
# 1. Scalar multiplication of matrices, simplemente multiplicar cada elemento de la matriz por el número. No importa las dimensiones.
# ---------------------------------------------
A <- matrix(c(-1,2,7,0), nrow = 2, ncol = 2, byrow = TRUE)
2 * A

# ---------------------------------------------
# 2. Matrix addition and subtraction, la dimension debe ser exactamente la misma
# ---------------------------------------------
A <- matrix(c(0,1,2,3), nrow = 2, byrow = TRUE)
B <- matrix(c(0,-2,-5,12), nrow = 2, byrow = TRUE)
A + B

A2 <- matrix(1:6, nrow = 2, byrow = TRUE)
A + A2

C <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)
D <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)
C - D


# ---------------------------------------------
# 3. Matrix multiplication, solo se pueden multiplicar matrices de 2 en 2, no tienen porque tener las mismas dimensiones
# ---------------------------------------------
A * B # is element-wise multiplication, posiblemente no es lo que esperabamos, no con asterisco

A %*% B # is matrix multiplication (this is what you want!)

C %*% D

A %*% B
B %*% A
