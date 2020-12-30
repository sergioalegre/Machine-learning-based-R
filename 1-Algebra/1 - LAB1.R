#1 - crear matriz de 3x4 llamada A, rellenarla con numeros del 1 al 12, ver el valor del elemento en posición a24
#2 - crear dos vectores v1 y v2 con numeros, plotear v1 y v2 en el mismo plano
#3 - Add 3 to the second entry in v1 and re-plot. Describe the position of the new vector in 2-space relative to v1.
#4 - Create a 1 x 3 vector, v3, with numeric entries of your choice. Plot v3 in 3-space.
#5 - Fill in the blanks: A ________ is a ________ with only one ________ or ________.


#1 - crear matriz de 3x4 llamada A, rellenarla con numeros del 1 al 12, ver el valor del elemento en posición a24
A <- matrix(seq(1, 12, 1),nrow = 3, ncol = 4)
#A <- matrix(1:12, nrow = 3, ncol = 4) #otra forma
#a_24 vale 11


#2 - crear dos vectores v1 y v2 con numeros, plotear v1 y v2 en el mismo plano
v1 <- c(1,4)
v2 <- c(5,8)

plot(x=v1[1], y=v1[2], xlim = c(0,10), ylim = c(0,10))
arrows(x0=0, y0=0, x1=v1[1], y1=v1[2])
points(x=v2[1], y=v2[2], col = 'blue')
arrows(x0=0, y0=0, x1=v2[1], y1=v2[2], col = 'blue')


#3 - Add 3 to the second entry in v1 and re-plot. Describe the position of the new vector in 2-space relative to v1.
v1.new <- c(1,7)

plot(x=v1[1], y=v1[2], xlim = c(0,10), ylim = c(0,10))
arrows(x0=0, y0=0, x1=v1[1], y1=v1[2])
points(x=v1.new[1], y=v1.new[2], col = 'blue')
arrows(x0=0, y0=0, x1=v1.new[1], y1=v1.new[2], col = 'blue')


#4 - Create a 1 x 3 vector, v3, with numeric entries of your choice. Plot v3 in 3-space.
v3 <- c(2,5,8)

library(plot3D)
points3D(x=v3[1], y=v3[2], z=v3[3], xlim=c(0,10), ylim=c(0,10), zlim=c(0,10))
arrows3D(x0=0, y0=0, z0=0, x1=v3[1], y1=v3[2], z1=v3[3], col = 'red', add=TRUE)


#5 - Fill in the blanks: One ________ is a ________ with only one ________ or ________.
#una matrix es un vector con una solo una fila or columna