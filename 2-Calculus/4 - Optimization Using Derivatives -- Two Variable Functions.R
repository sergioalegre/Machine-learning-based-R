#https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108250
#https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108251

# -------------------------------------------
# TOC:
#  1. Finding all derivatives equal to zero
#  2. Second Derivative Test for Two Vars
# -------------------------------------------

# -------------------------------------------
# 1. Finding all derivatives equal to zero
# -------------------------------------------
library(Deriv)

f <- function(x,y) x^2 + y^2 - 2*x - 6*y + 14
f.x <- Deriv(f, x = 'x')
f.x # 2x - 2

f.y <- Deriv(f, x = 'y')
f.y # 2y - 6

plot(f.x, xlim = c(-10,10))


### In this case, we can do f.x and f.y individually with uniroot()
uniroot(f.x, interval = c(-10,10)) # f.x = 0 at x = 1

# need to pass uniroot() something that's a function of 'x'
uniroot(function(x) 2*x-6, interval = c(-10,10)) # f.y = 0 at y = 3


### A couple other methods can be used too. Use solve().
# Want:
### 2x-2=0 --> 2x + 0y - 2 = 0 -->    2x + 0y = 2
### 2y-6=0 --> 0x + 2y - 6 = 0 -->    0x + 2y = 6
#en LHS ponemos en una matriz los valores de x e y, wn RHS los resultados de las funciones
LHS <- matrix(c(2,0,0,2), nrow = 2, byrow = TRUE)
RHS <- c(2,6)
LHS
RHS
solve(LHS, RHS)


### What if f' is a function of two variables?
## Ex:
f2 <- function(x,y) x^2 + y^2 + x*y
f2.x <- Deriv(f2, x = 'x')
f2.x

f2.y <- Deriv(f2, x = 'y')
f2.y

### Find when f2.x = 0
# need an idea of where to look
library(rgl)
plot3d(f2.x, xlim = c(-10,10), ylim = c(-10,10))

# new package has the function multiroot()
install.packages("rootSolve", dependencies = TRUE)
library(rootSolve)

func <- function(x) c(f1 = 2*x[1]+x[2],
                      f2 = 2*x[2] +x[1])

multiroot(f = func, start = c(0,0))




# -------------------------------------------
# 2. Second Derivative Test for Two Vars
# -------------------------------------------
f.xx <- Deriv(f.x, x = 'x')
f.xx #2

f.yy <- Deriv(f.y, x = 'y')
f.yy #2

f.xy <- Deriv(f.x, x = 'y')
f.xy #0

D <- f.xx(c(1,3))*f.yy(c(1,3)) - f.xy(c(1,3))^2
D #4

## D > 0 and f.xx > 0, so (1,3) is a local min
