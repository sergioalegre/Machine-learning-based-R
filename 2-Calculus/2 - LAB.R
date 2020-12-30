#https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108245

# 1. For f(x) = sqrt(x) and f(x) = x, do the following:
###  a. Define f and f'. Write the closed form expression for f'.
###  b. Plot f and f' together.
###  c. Pick 3-5 values of x, find f'(x), and plot those points
###  d. What is the slope of the tangent line to f at each value of x from part c?

library(Deriv)

# a. Define f and f'.
f1 <- function(x) sqrt(x)
f1.prime <- Deriv(f1) ### closed form: f'(x) = 0.5 / sqrt(x)


# b. Plot f and f' together.
plot(f1, xlim = c(-1,10), ylim = c(0,10), col = 'blue')
curve(f1.prime, xlim = c(-1,10), ylim = c(0,10), col = 'red', add = TRUE)


# c. Pick 3-5 values of x, find f'(x), and plot those points
0.5 / sqrt(0.5) # 0.707
f1.prime(0.5)
f1.prime(1) # 0.5
f1.prime(2) # 0.353
f1.prime(3) # 0.288
f1.prime(4) # 0.25

points(x = 0:10, y = f1.prime(0:10), col = 'black')

#  d. What is the slope of the tangent line to f at each value of x from part c?
### 0.707, 0.5, 0.353, etc.



# 2. For f(x,y) = x^3 + y^3,
###  a. Find f_x and f_y. Write the closed form expression for each.
###  b. Plot f, f_x, and f_y together.

#  a. Find f_x and f_y. Write the closed form expression for each.
f.xy <- function(x,y) x^3 + y^3
f.x <- Deriv(f.xy, x = 'x') ## 3x^2
f.y <- Deriv(f.xy, x = 'y') ## 3y^2

library(rgl)
plot3d(f.xy, xlim = c(-10,10), ylim = c(-10,10), col = 'blue')
plot3d(f.x, xlim = c(-10,10), ylim = c(-10,10), type = 'p', col = 'red', add = TRUE)
plot3d(f.y, xlim = c(-10,10), ylim = c(-10,10), col = 'green', add = TRUE)
