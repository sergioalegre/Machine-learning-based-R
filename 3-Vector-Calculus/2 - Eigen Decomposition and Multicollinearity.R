# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108858
# https://es.wikipedia.org/wiki/Vector_propio_y_valor_propio
# Se usan para ver donde hay mas varianza de datos
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108859

# --------------------------------------------------------------------
# TOC:
#  1. Finding the covariance matrix and eigen decomposition
#  2. Understanding an eigenvalue of zero
# --------------------------------------------------------------------

# --------------------------------------------------------------------
#  1. Finding the covariance matrix and eigen decomposition
# --------------------------------------------------------------------
A <- matrix(c(1,2,-1,0,2,3,4,-2,1), nrow = 3, byrow = TRUE)
colnames(A) <- c('a1', 'a2', 'a3')
round(cov(A), 2)

eigen(cov(A))


# --------------------------------------------------------------------
#  2. Understanding an eigenvalue of zero
# --------------------------------------------------------------------
set.seed(1234)
x1 <- rnorm(n = 50)
x2 <- rnorm(n = 50)
x3 <- 2*x1

B <- cbind(x1,x2,x3)
cov.B <- cov(B)
eigen.B <- eigen(cov.B)
eigen.B

eigen.B$vectors[,1] %*% eigen.B$vectors[,2] ## 0
eigen.B$vectors[,1] %*% eigen.B$vectors[,3] ## 0
eigen.B$vectors[,2] %*% eigen.B$vectors[,3] ## 0

### todos dan 0 por lo que los vectores eigen son un conjunto ortogonal

