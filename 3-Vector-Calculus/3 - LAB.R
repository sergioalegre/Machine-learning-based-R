# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16109415

# 1. Define and plot f(x,y) = x^2 + x*y + y^2 + y for x and y between -10 and 10
install.packages("rgl", dependencies = TRUE)
library(rgl)

f <- function(x,y) x^2 + x*y + y^2 + y
plot3d(f, xlim = c(-5,5), ylim = c(-5,5), col = 'green')

# 2. Run gradient descent on f to find its minimum.
#    Use (0,0) to initialize first, and then (5,5).
### 1. Define del.f
f.x <- Deriv(f, x = 'x') ## partial derivative wrt x
f.y <- Deriv(f, x = 'y') ## partial derivative wrt y

### 2. Intialize a starting point
x <- 0
y <- 0

alpha = 0.01
n.iter <- 500
f1.history <- numeric(n.iter)
x1.history <- numeric(n.iter)
y1.history <- numeric(n.iter)

for (i in 1:n.iter) {
  # 3. Calculate del.f(x,y)
  x.gradient <- f.x(x=x, y=y)
  y.gradient <- f.y(y=y, x=x)
  
  # 4. Calculate new point as xnew = x - alpha*f_x(x,y) and ynew = y - alpha*f_y(x,y)
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  # 5. Repeat until (x,y) is a critical point
  f1.history[i] <- f(x,y)
  x1.history[i] <- x
  y1.history[i] <- y
}

# ahora en consola con View(f1.history) parece que esta en -1/3 porque despues de 500 interaciones da:  -0.3333225


### Using (5,5)
x <- 5
y <- 5

alpha = 0.01
n.iter <- 500
f2.history <- numeric(n.iter)
x2.history <- numeric(n.iter)
y2.history <- numeric(n.iter)

for (i in 1:n.iter) {
  x.gradient <- f.x(x=x, y=y)
  y.gradient <- f.y(y=y, x=x)
  
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  f2.history[i] <- f(x,y)
  x2.history[i] <- x
  y2.history[i] <- y
}

# ahora en consola con View(f2.history), vemos que acabamos igual pero que las primeras observaciones están muy lejos

###  a. Compare number of iterations for each run. 
###     Does this make sense?
###     What do you think explains this comparison?
plot(f1.history) # desciende mas lento al principio
plot(f2.history) # desciende mucho mas rápido
### It doesn't really make sense. Al observar la funcion todo hacia pensar que nos acercariamos mas rápidamente desde 0,0 ya que se veia a ojo que el minimo estaba cerca, pero cuan rápido nos acerquemos tambien depende de la forma de la función
### Cause is that the rate of convergence depends on rate of change in the function.


# 3. Plot the path taken by each run.
plot3d(f, xlim = c(-5,5), ylim = c(-5,5), col = 'green')
points3d(x1.history, y1.history, f(x1.history,y1.history), col = 'red')
points3d(x2.history, y2.history, f(x2.history,y2.history), col = 'black')


# 4. Propose starting point that would satisfy the following
###  a) Fewer iterations that (5,5) ANSWER: (20,20) [far away]
###  b) More iterations than (5,5)  ANSWER: (1/4,-1/2) [very close]
###  c) Same number of iterations as (5,5) ANSWER: (-5,5) [any pt in relatively the same area]
