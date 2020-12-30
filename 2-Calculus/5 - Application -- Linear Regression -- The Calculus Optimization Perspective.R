# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108849
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108850

# -----------------------------------------------
## TOC:
##  1. Viewing residuals
##  2. Interpreting SSE and RMSE
# -----------------------------------------------

# -----------------------------------------------
##  1. Viewing residuals
# -----------------------------------------------
mod1 <- lm(mpg ~ wt, data = mtcars)

## Plot actuals and predicted values
summary(mtcars$mpg) # range of ~10 to 30
summary(mod1$fitted.values) # range of ~8 to 30

plot(x = mtcars$wt, y = mtcars$mpg, ylim = c(8,30), col = 'blue')
points(x = mtcars$wt, y = mod1$fitted.values, col = 'red')

## Plot residuals directly
plot(mod1$residuals) # should be no discernible pattern, w/ roughly same number above and below
abline(h = 0, lty = 3)


# -----------------------------------------------
##  2. Interpreting SSE and RMSE
# -----------------------------------------------
library(tidyverse) #necesario para la funcion rename
fit.stats <- as.data.frame(cbind(mtcars$mpg, mod1$fitted.values)) %>%
  rename(Actuals = V1, Predicted.Values = V2) %>%
  mutate(error = Actuals - Predicted.Values,  # y - yhat
         squared.error = error^2) 

SSE <- sum(fit.stats$squared.error)
SSE
## The sum of the individual squared errors is ~ 278
## Thus there are are about 278 squared units of error in the model

RMSE <- sqrt(mean(fit.stats$squared.error))
RMSE
## The Mean of the individual squared errors (MSE) is ~ 8.7
## The square root of the MSE (RMSE) is ~ 2.95
## Thus the predicted values are about 2.95 units away from the actual, on average

