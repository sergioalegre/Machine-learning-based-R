# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16110400
###
# 1 - Open the Longley data set from the datasets package
# 2 - Plot Employed against each variable and select the 3 variables most correlated to Employed.
# 3 - For each variable selected in number 2, create a regression model for Employed. Select the best model.
# 4 - For the champion model from number 3, create the model matrices.
# 5 - Recalculate the regression parameters and predicted values from the model matrices.
###


# 1 - Open the Longley data set from the datasets package
#View(longley)



# 2 - Plot Employed against each variable and select the 3 variables most correlated to Employed.

x <- longley$Employed

GNP.deflator <- longley$GNP.deflator
GNP <- longley$GNP
Unemployed <- longley$Unemployed
Armed.Forces <- longley$Armed.Forces
Population <- longley$Population
Year <- longley$Year

plot(x, GNP.deflator) #very correlated 0.9708985
plot(x, GNP) #very correlated 0.9835516
plot(x, Unemployed) #not correlated 0.5024981
plot(x, Armed.Forces) #not correlated 0.4573074
plot(x, Population) #very correlated 0.9603906
plot(x, Year) #very correlated 0.9713295

cor(longley)

#SOLUTION: GNP.deflator, GNP, & Year are very correlated to Employed



# 3 - For each variable selected in number 2, create a regression model for Employed. Select the best model.


regression1 <- lm(GNP.deflator ~ Employed, data = longley)
summary(regression1) #R-squared:  0.9426 -> un 94% es explicado por este modelo
anova(regression1) #Pr(>F): 4.389e-10


regression2 <- lm(GNP ~ Employed, data = longley)
summary(regression2) #R-squared:  0.9674 -> un 96% es explicado por este modelo
anova(regression2) #Pr(>F): 8.363e-12


regression3 <- lm(Year ~ Employed, data = longley)
summary(regression3) #R-squared:  0.9435 -> un 94% es explicado por este modelo
anova(regression3) #Pr(>F): 3.958e-10

#SOLUTION: GNP looks to be a best predict variable



# 4 - For the champion model from number 3, create the model matrices.


longley.x <- data.matrix(longley[2]) # 2= GNP


# 5 - Recalculate the regression parameters and predicted values from the model matrices.

longley.y <- longley[, "Employed"]
#pairs(longley, main = "longley data")
summary(fm1 <- lm(Employed ~ ., data = longley))



#AYUDA:
# https://setscholars.net/wp-content/uploads/2019/02/Linear-Regression-in-R-using-OLS-Regression.html
# https://rstudio-pubs-static.s3.amazonaws.com/269760_abe16b38acec471e92021b0ee703efd8.html
# https://www.youtube.com/watch?v=552Ddym5R1E