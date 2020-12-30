# ------------------------------------------------------------------------
# TOC:
# 1. Plotting vectors
# 2. Scalar multiplication
# 3. Vector addition
# 4. Vector subtraction
# 5. Vector multiplication and addition together
# 6. Plotting vector addition
# ------------------------------------------------------------------------


# ------------------------------------------------------------------------
# 1 . Plotting vectors
# ------------------------------------------------------------------------

# Plotting a single vector in 2-space
vecplot_2d <- function(vector, xax, yax, color) {
  vec <- vector
  plot(vec[1], vec[2], type = 'p', col = color,
       xlim = xax, ylim = yax,
       xlab = "", ylab = "")
  arrows(x0 = 0, y0 = 0, x1 = vec[1], y1 = vec[2], lwd = 2, col = color)
  text(x = vec[1], y = vec[2], labels = paste('(', vec[1], ',', vec[2], ')', sep = ""), 
       pos = 3)
}

### Apply the function
vecplot_2d(vector = c(1,2), xax=c(0,5), yax=c(0,5), color = 'red')


# Plotting a vector in 3-space
library(plot3D)
vecplot_3d <- function(vector, xax, yax, zax, color) {
  vec <- vector
  points3D(x = vec[1], y = vec[2], z = vec[3],
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z")
  text3D(x = vec[1]+0.5, y = vec[2], z = vec[3],
         labels = paste('(',vec[1],',',vec[2],',',vec[3],')', sep = ""), 
         add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec[1], y1=vec[2], z1=vec[3], lwd = 2, col = color, 
           add = TRUE)
}

### Apply the function
vecplot_3d(vector = c(2,3,4), xax = c(0,5), yax=c(0,5), zax=c(0,5), col = 'green')


# ------------------------------------------------------------------------
# 2. Scalar Multiplication: multiplicar cada elemento del del vector por un valor
# ------------------------------------------------------------------------
v1 <- 1:5
2 * v1 #2 4 6 8 10

# ------------------------------------------------------------------------
# 3. Vector Addition: sumar dos vectores de la misma dimension
# ------------------------------------------------------------------------
v2 <- c(-1,-2,-3,-4,-5)
v1 + v2 #0 0 0 0 0

### Recall: vectors MUST be the same size
v3 <- c(1,1,2)
v4 <- rep(1, 6)
v3 #1 1 2
v4 #1 1 1 1 1 1
v3 + v4 #no tienen el mismo tamaño, pero si el uno es proporcional al otro si se suman tantas veces como quepa el uno en el otro
# 1 1 2
#+
# 1 1 1 1 1 1
#------------
# 2 2 3 2 2 3


# ------------------------------------------------------------------------
# 4. Vector Subtraction
# ------------------------------------------------------------------------
v1 - v2 #2  4  6  8 10
v1 - -1*v1 #2  4  6  8 10

# ------------------------------------------------------------------------
# 5. Scalar multiplication and vector addition together
# ------------------------------------------------------------------------
v1 + 5*v2 # -4  -8 -12 -16 -20


# ------------------------------------------------------------------------
# 6. Plotting vector addition
# ------------------------------------------------------------------------

### in 2-space 

library(tidyverse)
vec.add.plot_2d <- function(vec1, vec2, xax, yax) { #creadmos la funcion 'vec.add.plot_2d' con sus parametros (los dos vectores y los limites en cada eje del grafo)
  to.plot <- as.data.frame(rbind(vec1, vec2, vec1+vec2))
  plot(to.plot[-2,]$V1, to.plot[-2,]$V2, type = 'p', col = 'red', lwd = 2,
       xlim = xax, ylim = yax)
  
  # Add arrows
  arrows(x0 = 0, y0 = 0, x1 = to.plot[1,1], y1 = to.plot[1,2], col = 'blue', lwd = 2)
  arrows(x0 = to.plot[1,1], y0 = to.plot[1,2], x1 = to.plot[3,1], y1 = to.plot[3,2], 
         col = 'green', lwd = 2)
  arrows(x0 = 0, y0 = 0, x1 = to.plot[3,1], y1 = to.plot[3,2], col = 'red', lwd = 2)
  
  # Add point labels
  to.plot %>% 
    mutate(point = paste('(', V1, ',', V2, ')', sep = "")) -> to.plot
  with(to.plot[-2,], text(to.plot[-2,], labels = point, pos = 4))
}

### Apply function
vec.add.plot_2d(vec1 = c(1,2), vec2 = c(3,4), xax=c(0,8), yax=c(0,10)) #llamamos a la funcion recien creada con un ejemplo


### in 3-space (requires library plot3D)
library(plot3D)
vec.add.plot_3d <- function(vec1, vec2, xax, yax, zax, phi, theta) {
  points3D(x = vec1[1], y = vec1[2], z = vec1[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           phi = phi,
           theta = theta)
  text3D(x = vec1[1], y = vec1[2], z = vec1[3]+0.25,
         labels = paste("(",vec1[1],",",vec1[2],",",vec1[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec1[1], y1=vec1[2], z1=vec1[3], lwd = 2, col = 'blue', 
           add = TRUE)
  
  points3D(x = vec1[1]+vec2[1], y = vec1[2]+vec2[2], z = vec1[3]+vec2[3], col = 'green',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  arrows3D(x0=vec1[1], y0=vec1[2], z0=vec1[3], x1=vec1[1]+vec2[1], y1=vec1[2]+vec2[2], 
           z1=vec1[3]+vec2[3], lwd = 2, col = 'red', add = TRUE)
  
  vec3 <- vec1 + vec2
  points3D(x = vec3[1], y = vec3[2], z = vec3[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  text3D(x = vec3[1], y = vec3[2], z = vec3[3],
         labels = paste("(",vec3[1],",",vec3[2],",",vec3[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec3[1], y1=vec3[2], z1=vec3[3], lwd = 2, col = 'green', 
           add = TRUE)
}

### Apply function
vec.add.plot_3d(vec1=c(1,2,3), vec2=c(4,5,6), xax=c(0,10), yax=c(0,10), zax=c(0,10),
                phi = 0, theta = 30) #phi, theta son la rotación y angulo del 'cubo'para que se vea bien