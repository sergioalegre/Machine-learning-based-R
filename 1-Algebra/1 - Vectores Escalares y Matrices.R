### LINEAR ALGEBRA ###

#escalar: una constante, cualquier numero
#vector: un array de numeros (una fila o una columna)
#matriz: coleccion rectangular de numeros

#dimension: numero de rows y columnas de una matriz
#un vector es una matriz simple, de una dimensión
#escalar: es una matriz de 1x1

# --------------------------------------------------------------------------------
# TOC:
# 1. Defining a vector [c(), :, seq(), rep()]
# 2. Defining a matrix [matrix(), rbind(), cbind()]
# 3. Plots in 2-D and 3-D
# --------------------------------------------------------------------------------

# ---------------------------------------------
# 1. Defining a vector [c(), :, seq(), rep()] hay 4 métodos  diferentes de crearlos
# ---------------------------------------------
# Using the c() function
v1 <- c(2,3,4,5)
str(v1) #str para ver la estructura

# Using the ':' operator
v2 <- 2:5 #de 2 a 5 de uno en uno, genera integers

# Using the seq() function; a long-form version of the ':' operator
v3 <- seq(from = 2, to = 8, by = 2) #del 2 al 8 de dos en dos
v3.1 <- seq(2, 5, 1) #del 2 al 5 de uno en uno

# Using the rep() function
v4 <- rep(37, 5) #repite el 37 cinco veces


# --------------------------------------------------
# 2. Defining a matrix [matrix(), rbind(), cbind() una matrix es una colección de vectores
# --------------------------------------------------
# A matrix is just a collection of vectors

# Using the matrix() function
m1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE) #una matriz de 2x3
str(m1)
m1.1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = FALSE) #byrow hace que la ordenación por columnas en lugar de filas
str(m1.1)

# Using rbind()
m2 <- rbind(c(1,2,3), c(4,5,6)) #será el equivalente a m1, decir por filas cuales son los elementos

# Using cbind()
m3 <- cbind(c(1,4), c(2,5), c(3,6)) #lo contrario a rbind, decir por columnas

# ---------------------------------------------
# 3. Plots in 2-D and 3-D
# ---------------------------------------------
# Vector in 2-space
u1 <- c(2,4)
plot(u1[1], u1[2], type = 'p', col = 'red',
     xlim = c(0,5), ylim = c(0,5), #limites del grafico
     xlab = "", ylab = "") #etiquetas
arrows(x0 = 0, y0 = 0, x1 = u1[1], y1=u1[2], lwd = 2) #donde ha de empezar la flecha (en 0,0 en este caso)

# Vector in 3-space
install.packages("plot3D", dependencies = TRUE)
library(plot3D)
u2 <- c(2,3,4)
points3D(x=u2[1], y=u2[2], z=u2[3], col = 'red',
         xlim = c(0,5), ylim = c(0,5), zlim = c(0,5),
         phi = 0)
arrows3D(x0 = 0, y0 = 0, z0 = 0, x1 = u2[1], y1 = u2[2], z1 = u2[3], lwd = 2, add = TRUE)
