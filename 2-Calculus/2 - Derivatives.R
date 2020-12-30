# ------------------------------------------------
# TOC:
#   1. Plotting a function and its derivative
#   2. Finding a derivative (and the Power Rule)
#   3. Finding and plotting partial derivatives
# ------------------------------------------------
install.packages("Deriv", dependencies = TRUE)
library(Deriv) ## package for finding closed form expression for derivatives



# ----------------------------------------------
# 1. Plotting a function and its derivative
# ----------------------------------------------

### RECALL: a derivative is a function that gives the slopes of the tangent lines of another function
## Start w/ a function
f <- function(x) x^3

## Let's plot some of the tangent lines
tangent.plots <-  function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(f)
  x1 <- pt
  y1 <- f(x1)
  m1 <- f.prime(x1)
  plot(f, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
  points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
  sec.int <- -m1*x1 + y1
  abline(a = sec.int, b = m1, col = 'red')
  text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
  text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}

tangent.plots(fun = f, pt = 4)
## keeping track: x = -2, f' = 12; x = -1, f' = 3; x = 0, f' = 0 (***); x = 1, f' = 3; x = 2, f' = 12

## add these to a plot of the graph
plot(f, xlim = c(-5,5), col = 'blue')
points(x = -4:4, y = c(48,27,12,3,0,3,12,27,48), col = 'red')  ## do -2:2, and then add in 3, and then 4 to show how f' plot builds



# ----------------------------------------------
# 2. Finding a derivative (and the Power Rule)
# ----------------------------------------------
### Use the Deriv() function to find the closed form of a derivative
f.prime <- Deriv(f)
f.prime

## add to previous plot
curve(f.prime, add = TRUE)

### Let's find a few derivatives and look for a pattern
f <- function(x) x^5
Deriv(f)

### POWER RULE for finding derivatives: if f(x) = x^n, f'(x) = n*x^(n-1)
### More generally, if f(x) = ax^n, f'(x) = an*x^(n-1)



# ----------------------------------------------
# 3. Finding and plotting partial derivatives
# ----------------------------------------------
f <- function(x,y) x^2 + y^2
f.x <- Deriv(f, x = 'x') ## partial derivative wrt x
f.y <- Deriv(f, x = 'y') ## partial derivative wrt y

install.packages("rgl", dependencies = TRUE)
library(rgl)
plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'blue')
plot3d(f.x, xlim = c(-10,10), ylim = c(-10,10), type = 'p', col = 'red', add = TRUE)
plot3d(f.y, xlim = c(-10,10), ylim = c(-10,10), col = 'green', add = TRUE)

