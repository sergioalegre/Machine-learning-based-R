# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16109418
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16109419

# -------------------------------------------
# TOC:
#  1. Generate data and fit model
#  2. Run Gradient Descent
#  ------------------------------------------


# -------------------------------------------
#  1. Generate data and fit model
#  ------------------------------------------
set.seed(1234)
x <- rnorm(500)
y <- 5 + 2*x + rnorm(500) # B0 = 5, B1 = 2
plot(x, y)

lm.mod <- lm(y ~ x)
lm.mod  ## Pretty close to actual values of 5 and 2. Deduce un beta0 de 4,95 y un beta1 de 2,076, lo cual es buena aproximación

#veamos como esta predicción se ajusta al modelo:
abline(a = lm.mod$coefficients[1], b = lm.mod$coefficients[2], col = 'red') #vemos que se ajusta bien


# -------------------------------------------
#  2. Run Gradient Descent. HACEMOS LO MISMO PERO CON DESCIENSO DE GRADIENTE
#  ------------------------------------------
X <- as.matrix(cbind(1, x)) # Add vector of 1s for the intercept term

# Define error function
error <- function(beta) {
  sum((X %*% beta - y)^2) # Sum of squared errors
}

# Define partials for b0 and b1
del.b0 <- function(b0, b1) {
  sum(-y + (b1*x + b0)) * (2 / length(x))
}

del.b1 <- function(b0, b1) {
  sum(x %*% (-y + (b1*x + b0))) * (2 / length(x))
}


# Initialize parameters for algorithm
b0 <- 0
b1 <- 0
alpha = 0.01
n.iter <- 500
error.history <- numeric(n.iter)
b0.history <- numeric(n.iter)
b1.history <- numeric(n.iter)

for (i in 1:n.iter) { #cada iteración va calculando un valor para beta0 y beta1
  b0.gradient <- del.b0(b0, b1)
  b1.gradient <- del.b1(b0, b1)
  
  b0 <- b0 - alpha*b0.gradient
  b1 <- b1 - alpha*b1.gradient
  beta <- as.matrix(c(b0, b1))
  
  error.history[i] <- error(beta)
  b0.history[i] <- b0
  b1.history[i] <- b1
}

# View results
beta # Close to 5 and 2 ASI QUE OBTENEMOS LOS MISMOS RESULTADOS
lm.mod # lm() output and gradient descent output identical

# Actuals and fitted line w/ optimal beta values
plot(x, y)
abline(a = b0, b = b1, col = 'red')

# Convergence towards minimum error?
min.error <- round(error.history[n.iter], 3) # min error of 455.455
plot(error.history)
length(which(round(error.history,3) > min.error)) # Ese error mínimo le conseguimos en la iteración 440. Converged around iteration 440

# Actuals with convergence of best fit line
install.packages("animation", dependencies = TRUE)
library(animation)
windows();
for (i in 1:n.iter) {
  plot(x, y)
  abline(a = b0.history[i], b = b1.history[i], col = 'red')
  text(c(-2,-2,-2), c(6,8,10), labels = c(paste('b1 = ', b1.history[i], sep = ''),
                                          paste('b0 = ', b0.history[i], sep = ''),
                                          paste('Iteration: ', i)))
  ani.pause(interval = 0.1)
}
