#Basado en: https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108239
# ------------------------------------------
# TOC:
#   1. Defining a function
#   2. Plotting a function
#   3. Estimating slope of a 
#      tangent line using secant lines
# ------------------------------------------


# ------------------------------------------
# 1. Defining a function
# ------------------------------------------
f <- function(x) x ## syntax: function(argument/s for function) expression

x2 <- function(x) x^2
x3 <- function(x) x^3
x4 <- function(x) x^4
sqrt.x <- function(x) sqrt(x)



# ------------------------------------------
# 2. Plotting a function
# ------------------------------------------
plot(f, main = "f(x) = x", xlim = c(-5,5), col = 'blue')
plot(x2, main = "f(x) = x^2", xlim = c(-5,5), col = 'blue')
plot(x3, main = "f(x) = x^3", xlim = c(-5,5), col = 'blue')
plot(x4, main = "f(x) = x^4", xlim = c(-5,5), col = 'blue')
plot(sqrt.x, main = "f(x) = sqrt(x)", xlim = c(-5,5), col = 'blue')



# ------------------------------------------
# 3. Estimating the slope of a tangent line
# ------------------------------------------
### function to estimate slope of tangent lines using secant lines
library(animation)
library(Deriv)

f <- function(x) x^2

secant.plots <- function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
  if (m1 < 0) {
    min <- f.prime(x1)-12
    max <- f.prime(x1)
    j <- 0.5
  } else {
    min <- f.prime(x1)+12
    max <- f.prime(x1)
    j <- -0.5
  }
  windows();
  for (i in seq(min,max,j)) {
    plot(fun, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
    points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
    sec.int <- -i*x1 + y1
    abline(a = sec.int, b = i, col = 'red')
    text(x1+8, y1-8, labels = paste('Slope:', i, sep = ""))
    text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
    ani.pause(interval = 0.5)
  }
}

secant.plots(fun = f, pt = -2)



### Single tangent lines
tangent.plots <-  function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
    plot(fun, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
    points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
    sec.int <- -m1*x1 + y1
    abline(a = sec.int, b = m1, col = 'red')
    text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
    text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}

tangent.plots(fun = f, pt = -3)



### Secant and tangent lines for f(x) = sqrt(x) // discuss expected shape (will get smaller)
plot(sqrt.x, xlim = c(-10,10))
plot(sqrt.x, xlim = c(0,20))

sqrt.x.prime <- Deriv(sqrt.x)
curve(sqrt.x.prime, add = TRUE)

secant.plots(fun = sqrt.x, pt = 3)
tangent.plots(fun = sqrt.x, pt = 1)

