# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108852

# 1. From the mtcars data set, define the model matrices for a linear regression model of mpg = wt + hp
##   Calculate the beta vector
X <- as.matrix(cbind(rep(1,length(mtcars$mpg)),mtcars$wt, mtcars$hp))
X

y <- as.matrix(mtcars$mpg)
y

B <- solve(t(X)%*%X) %*% t(X)%*%y
B


# 2. Validate that t(B)t(X)y and t(y)XB evaluate to the same scalar
t(B) %*% t(X) %*% y
t(y) %*% X %*% B


# 3. Validate the the partial derivatives (-2t(X)y + 2t(X)XB) equal 0
-2*t(X)%*%y + 2*t(X)%*%X%*%B
#dimensiones son 3x1 y tiene sentido porque el modelo tiene 3 betas


# 4. Fit the model using the lm() function
mod <- lm(mpg ~ wt + hp, data = mtcars)

## a) Plot the actuals and predicted values, as well as the residuals. Comment on the distribution of the residuals.
library(rgl)

plot3d(x = mtcars$wt,
       y = mtcars$hp,
       z = mtcars$mpg,
       xlab = "wt",
       ylab = "hp",
       zlab = "mpg",
       col = 'blue',
       type = 's')
plot3d(x = mtcars$wt,
       y = mtcars$hp,
       z = mod$fitted.values,
       xlab = "wt",
       ylab = "hp",
       zlab = "mpg",
       col = 'red',
       type = 's',
       add = TRUE)

# residuals
plot(mod$residuals)
abline(h = 0, lty = 3)

## b) Calculate SSE and RMSE and offer interpretations of each
library(tidyverse)
fit.stats <- as.data.frame(cbind(mtcars$mpg,mod$fitted.values)) %>%
  rename(Actuals = V1, Predicted.Values = V2) %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)

SSE <- sum(fit.stats$squared.error)
SSE # 195 total units of squared error in the model

RMSE <- sqrt(mean(fit.stats$squared.error))
RMSE # On average, predicted values are about 2.5 units away from the actuals


## c) Recall the RMSE for the model mpg ~ wt was 2.95. What does this tell us about using hp as a predictor for mpg?
### ANSWER: In terms of RMSE, hp does help lower the overall error in the model
####        However, the residual plot shows some patterned error in the model.