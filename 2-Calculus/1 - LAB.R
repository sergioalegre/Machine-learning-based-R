# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108240
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108241


# 1. Define the function f(x) = x^3 + 1
f <- function(x) x^3

# Plot f(x)
plot(f, xlim = c(-10,10)) #-10 y 10 son los límites del grafo


# 2. Find the slopes of the tanget lines at x = -1, 0, and 2
###  What patterns do you notice between the values of x and your estimation of the slopes 
###  of the tangent lines?
install.packages("animation", dependencies = TRUE)
library(animation)
install.packages("Deriv", dependencies = TRUE)
library(Deriv)

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

secant.plots(fun = f, pt = -1) ## 3 slope=3
secant.plots(fun = f, pt = 0)  ## 0
secant.plots(fun = f, pt = 2)  ## 12

### Results: x = -1; f'(x) = 3 // x = 0; f'(x) = 0 // x = 2; f'(x) = 12
### Patterns? LEAVE OPEN


# 3. Repeat the above for f(x) = x^4
f2 <- function(x) x^4

# plot
plot(f2, xlim = c(-10,10), ylim = c(-10,10))


# Estimate slopes of tangent lines at x = -1, 0, 2
secant.plots(fun = f2, pt = -1)  ## -4
secant.plots(fun = f2, pt = 0)   ## 0
secant.plots(fun = f2, pt = 2)   ## 32
## Patterns? LEAVE OPEN




# 4. Plot each function. For x = -1, 0, and 2, determine if the slopes of the tangent lines 
###  will be > 0, < 0, or = 0.
###  Functions: f(x) = x^5, f(x) = ln(x), f(x) = e^x, f(x) = 1/x
x5 <- function(x) x^5
plot(x5, xlim = c(-2,5), ylim = c(-10,10)) # positive, zero, positive

ln.x <- function(x) log(x)
plot(ln.x, xlim = c(-2,5), ylim = c(-10,10)) # DNE, zero, positive

e.x <- function(x) exp(x)
plot(e.x, xlim = c(-2,5), ylim = c(-10,10)) # positive, positive, positive

one.x <- function(x) 1/x
plot(one.x, xlim = c(-2,5), ylim = c(-10,10)) # negative, negative, negative







