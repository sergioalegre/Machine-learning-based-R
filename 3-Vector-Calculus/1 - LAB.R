# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108856
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108857

# 1. Create a pair of orthogonal 2-D vectors
v1 <- c(0,1)
v2 <- c(1,0)
v1 %*% v2


# 2. Create a pair of orthogonal 3-D vectors
v3 <- c(0,0,1)
v4 <- c(1,1,0)
v3 %*% v4


# 3. Load the Baseball2018 data set
baseball <- read.csv('Baseball2018.csv', header = T, stringsAsFactors = F)

### a. The variable Games is a linear combination of Wins and Losses (Games = Wins + Losses). 
###    There is one more variable that is a linear combination of two other variables.
###    Find this combination. Express as v3 = c1*v1 + c2*v2.
##### ANSWER: Rdiff = 1*Runs + (-1)*RunsAgainst

### b. For the combination in part a), fit WinPct ~ v3 and WinPct ~ v1 + v2. 
mod1 <- lm(WinPct ~ Rdiff, data = baseball)
mod1

mod2 <- lm(WinPct ~ Runs + RunsAgainst, data = baseball)
mod2

###    Describe the relationship between the coefficients from each model.
#####  ANSWER: The intercept is ~ 0.5 for each because the average WinPct is 0.5 (on average, half of the games are won)
#####          The coefficient on Rdiff is equal to the weighted average of coefficients for Runs and RunsAgainst
#####          That is, 0.097 = (1*0.096 + (-1)*-0.098) / 2
(1*0.096 + (-1)*-0.098) / 2


### c. Compare the fitted values for both models from part b) and comment on the comparison.
plot(mod1$fitted.values, mod2$fitted.values)
abline(a = 0, b = 1, col = 'red')



# 4. Assume one predictor variable can be written as a linear combination of other variables. 
###  Explain in your own words why it is best practice to use the single variable for modeling 
###  rather than the other variables.
### ANSWER: The single variable provides all necessary information. Introducing the extra variables
###         introduces more potential sources for error.



