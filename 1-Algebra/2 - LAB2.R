# 1. Multiply vector v1, where v1=[3 5] , by -3. What is the result?
v1 <- c(3,5)
-3 * v1 #-9 -15


# 2. Add v2 to v1, where v2 = [4 2]. What is the result?
v2 <- c(4,2)
v1 + v2 #7 7


# 3. What is the sum of v2 and twice v1?
v2 + 2 * v1 #10 12

#otra forma
2*v1 + v2 #10 12



# 4. Plot v1 and v2, along with their sum, v1 + v2.
### From lecture: Plotting a single vector in 2-space
library(tidyverse)
vecplot_2d <- function(vector, xax, yax, color) {
  vec <- vector
  plot(vec[1], vec[2], type = 'p', col = color,
       xlim = xax, ylim = yax,
       xlab = "", ylab = "")
  arrows(x0 = 0, y0 = 0, x1 = vec[1], y1 = vec[2], lwd = 2, col = color)
  text(x = vec[1], y = vec[2], labels = paste('(', vec[1], ',', vec[2], ')', sep = ""), pos = 3)
}

### Apply the function
vecplot_2d(vector = v1, xax=c(0,10), yax=c(0,10), color = 'blue')
vecplot_2d(vector = v2, xax=c(0,10), yax=c(0,10), color = 'red')




### From lecture: Plotting the sum a two 2-D vectors
library(tidyverse)
vec.add.plot_2d <- function(vec1, vec2, xax, yax) {
  to.plot <- as.data.frame(rbind(vec1, vec2, vec1+vec2))
  plot(to.plot[-2,]$V1, to.plot[-2,]$V2, type = 'p', col = 'red', lwd = 2,
       xlim = xax, ylim = yax)
  
  # Add arrows
  arrows(x0 = 0, y0 = 0, x1 = to.plot[1,1], y1 = to.plot[1,2], col = 'blue', lwd = 2)
  arrows(x0 = to.plot[1,1], y0 = to.plot[1,2], x1 = to.plot[3,1], y1 = to.plot[3,2], col = 'green', lwd = 2)
  arrows(x0 = 0, y0 = 0, x1 = to.plot[3,1], y1 = to.plot[3,2], col = 'red', lwd = 2)
  
  # Add point labels
  to.plot %>% 
    mutate(point = paste('(', V1, ',', V2, ')', sep = "")) -> to.plot
  with(to.plot[-2,], text(to.plot[-2,], labels = point, pos = 4))
}

### Apply function
vec.add.plot_2d(vec1 = v1, vec2 = v2, xax = c(0,10), yax=c(0,10))




# 5. Add v3 = [0 4 3] and v4=[4 7 5]. What is the result?
v3 <- c(0,4,3)
v4 <- c(4,7,5)
v3 + v4



# 6. Plot v3 and v4, along with their sum, v3 + v4. 
#   Change the perspective to get a better view of the vectors.
### From the lecture: plotting a vector in 3-space
### Plotting a vector in 3-space
library(plot3D)
vecplot_3d <- function(vector, xax, yax, zax, color) {
  vec <- vector
  points3D(x = vec[1], y = vec[2], z = vec[3],
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z")
  text3D(x = vec[1]+0.5, y = vec[2], z = vec[3],
         labels = paste('(',vec[1],',',vec[2],',',vec[3],')', sep = ""), 
         add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec[1], y1=vec[2], z1=vec[3], lwd = 2, col = color, add = TRUE)
}

### Apply the function
vecplot_3d(vector = v3, xax=c(0,5), yax = c(0,5), zax = c(0,5), col = 'blue')
vecplot_3d(vector = v4, xax=c(0,10), yax = c(0,10), zax = c(0,10), col = 'red')



### Plotting the sum of two 3-D vectors
vec.add.plot_3d <- function(vec1, vec2, xax, yax, zax, phi, theta) {
  points3D(x = vec1[1], y = vec1[2], z = vec1[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           phi = phi,
           theta = theta)
  text3D(x = vec1[1], y = vec1[2], z = vec1[3]+0.25,
         labels = paste("(",vec1[1],",",vec1[2],",",vec1[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec1[1], y1=vec1[2], z1=vec1[3], lwd = 2, col = 'blue', add = TRUE)
  
  points3D(x = vec1[1]+vec2[1], y = vec1[2]+vec2[2], z = vec1[3]+vec2[3], col = 'green',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  arrows3D(x0=vec1[1], y0=vec1[2], z0=vec1[3], x1=vec1[1]+vec2[1], y1=vec1[2]+vec2[2], z1=vec1[3]+vec2[3], lwd = 2, col = 'red', add = TRUE)
  
  vec3 <- vec1 + vec2
  points3D(x = vec3[1], y = vec3[2], z = vec3[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  text3D(x = vec3[1], y = vec3[2], z = vec3[3],
         labels = paste("(",vec3[1],",",vec3[2],",",vec3[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec3[1], y1=vec3[2], z1=vec3[3], lwd = 2, col = 'green', add = TRUE)
}

### Apply function
vec.add.plot_3d(vec1 = v3, vec2 = v4, xax = c(0,15), yax = c(0,15), zax = c(0,15),
                phi = 0, theta = 0)


  