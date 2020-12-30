# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108252
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108253

# 1. Define and plot f(x,y) = x^2 + x*y + y^2 + y for x and y between -10 and 10
f <- function(x,y) x^2 + x*y + y^2 + y

library(rgl)
plot3d(f, xlim = c(-10,10), ylim = c(-10,10))



# 2. Find f.x, f.y, f.xx, f.yy, and f.xy. Write the closed form expressions for each.
library(Deriv)
f.x <- Deriv(f, x = 'x')
f.x # 2x + y

f.y <- Deriv(f, x = 'y')
f.y # 2y + x + 1

f.xx <- Deriv(f.x, x = 'x')
f.xx # 2

f.yy <- Deriv(f.y, x = 'y')
f.yy # 2

f.xy <- Deriv(f.x, x = 'y')
f.xy # 1



# 3. The critical point is at (1/3, -2/3). Verify analytically that f.x and f.y equal 0 here.
f.x(x=1/3, y=-2/3) #sale 0 en la consola -> COMPROBADO
f.y(x=1/3, y=-2/3) #sale 0 en la consola -> COMPROBADO

## might want to verify critical point
library(rootSolve)

funs <- function(x) c(f1 = 2*x[1] + x[2],
                      f2 = x[1] + 2*x[2] + 1)
multiroot(funs, start = c(0,0)) #root sale 0.3333333 -0.6666667 lo que es igual a 1/3 y -2/3






# 4. Verify the critical point satisfies the conditions of the Second Der. test for being a min.
D <- f.xx(c(1/3,-2/3))*f.yy(c(1/3,-2/3)) - f.xy(c(1/3,-2/3))^2
D #3

f.xx(c(1/3,-2/3)) #2

## D > 0 and f.xx > 0, so it is a local min
