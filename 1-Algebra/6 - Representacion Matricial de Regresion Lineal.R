# ---------------------------------------------
# TOC:
# 1. Deterministic example
# 2. Stochastic example
# 3. Calculate predicted values
# ---------------------------------------------


# ---------------------------------------------
# 1. Deterministic example
# ---------------------------------------------
# Define hot dog data
y <- c(24,30,41) ## total cost matrix
x.0 <- rep(1,3) ## unit vector for the intercept term
x.1 <- c(0,2,5) ## number of hot dogs purchased
x.2 <- c(2,2,3) ## number of fries purchased
X <- cbind(x.0,x.1,x.2)
X

## Calculate Beta vector
beta <- solve(t(X) %*% X) %*% t(X) %*% y
beta
















# ---------------------------------------------
# 2. Stochastic example
# ---------------------------------------------
View(mtcars)

# Define mtcars data (desired model: mpg ~ wt + qsec)
y <- as.matrix(mtcars$mpg) ## response
X <- as.matrix(cbind(rep(1,length(mtcars$mpg)), mtcars[,c('wt','qsec')]))
View(X)


## Calculate beta vector (from last time, it should be 19,75, -5.05, and 0.93)
beta <- solve(t(X) %*% X) %*% t(X) %*% y
beta




















# ---------------------------------------------
# 3. Calculate predicted values
# ---------------------------------------------






