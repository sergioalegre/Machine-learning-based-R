# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108860
# https://www.eduonix.com/dashboard/mathematics-for-data-science-and-ai-using-r/lecture/16108861
# https://support.minitab.com/es-mx/minitab/19/help-and-how-to/modeling-statistics/anova/supporting-topics/anova-statistics/what-is-the-variance-covariance-matrix/


# 1. Load the Baseball2018 data set and retain Runs, RunsAgainst, and Rdiff.
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

baseball <- read.csv('Baseball2018.csv', header = T, stringsAsFactors = F)
baseball <- baseball %>%
  select(Runs, RunsAgainst, Rdiff)


# 2. Create the covariance matrix. Explain what each entry means.
cov.baseball <- cov(baseball)
cov.baseball
### The diagonal entries show the amount of variation in the individual variables.
### The off-diagonal entries show the amount of vartiation between pairs of variables.



# 3. Create the eigen decomposition for the data set. 
###  How many eigenvectors are needed to account for almost all variation in the data?
eigen.baseball <- eigen(cov.baseball) # a eigen no le podemos pasarel dataset, ha de pasarsele una matriz cuadrada por lo que le pasamos la covarianza del dataset
eigen.baseball
### Two eigenvectors account for almost all variation in the data
# aunque salen 3 resultados el tercero es tan cercano a cero que le descartamos