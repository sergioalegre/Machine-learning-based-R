#https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108228

# 1. Load the data
### Read in data and subset to desired variables
library(tidyverse)
library(rgl)

data.00 <- read.csv("Baseball2018.csv", header = TRUE, stringsAsFactors = FALSE)
data.10 <- data.00 %>%
  select(Runs, HomeRun, H9)
View(data.10)



# 2. Plot Runs vs. HomeRun and Runs vs. H9. 
#    Of HomeRun and H9, which appears to be more closely related to Runs? 
#    Plot Runs vs. HomeRun and H9 in 3-space.
plot(data.10$HomeRun, data.10$Runs)
plot(data.10$H9, data.10$Runs)

### Which variable looks like the better predictor?
### Answer: Both are fairly strong, but HomeRun looks a bit stronger

# Plot all 3 variables together
plot3d(x = data.10$HomeRun, y = data.10$H9, z = data.10$Runs, type = 's', col = 'red')





# 3. Use the lm() function to estimate the linear regression model for Runs 
#    as a function of HomeRun and H9. Write the regression equation. 
#    Plot fitted values against actuals. 
#    How accurate would you say the predictions are?
HR.mod <- lm(Runs ~ HomeRun + H9, data = data.10)
summary(HR.mod)
### Regression equation: Runs = 5.15 + 0.009*HomeRun - 0.29*H9

# Plot fitted vs actuals
plot(HR.mod$model$Runs, HR.mod$fitted.values)  # Expect a straight line

plot3d(x = data.10$HomeRun, y = data.10$H9, z = data.10$Runs, type = 's', col = 'red')
plot3d(x = data.10$HomeRun, y = data.10$H9, z = HR.mod$fitted.values, type = 's', col = 'blue', add = TRUE)





# 4. Calculate RMSE for the model and offer an interpretation for the value in the context 
#    of the problem. Does this change your perception of the quality of the model predictions?
error.measures <- as.data.frame(cbind(HR.mod$model$Runs, HR.mod$fitted.values))
colnames(error.measures) <- c("Actuals", "Predicted.Values")
error.measures <- error.measures %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2) %>%
  summarise(sqrt(mean(squared.error)))
### Interpretation: 

### Change in perception? 
