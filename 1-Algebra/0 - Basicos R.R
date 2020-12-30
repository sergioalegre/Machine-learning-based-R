# ---------------------------------------------------------------------------------
# I. R Workspace
# ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------
### Editor -- Where you write your programs / scripts
### Console -- Shows the commands you are writing ; you can also write directly to it
### Environment -- shows all of the objects in your current R session
### Plots, Packages, and Help -- tabs with additional info about your session

# ---------------------------------------------------------------------------------
# II. Basic Commands & Operations
# ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------
### Assignment Operator
data.00 <- mtcars

#specific rows, columns, entries, etc. using $ and [i,j]
### accessing a specific column with the $ operator
data.00$mpg
data.00[,'mpg']

### accesssing columns with the [i,j] notation
data.00[,1]
data.00[1:5,1]

# first 5 observations
data.00[1:5,]

###head(), tail(), and str()
head(data.00) # first 6 observations
tail(data.00) # last 6 observations
str(data.00)

# ---------------------------------------------------------------------------------
###tidyverse standards and data wrangling
# ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------
library(tidyverse)

# 1. Every column is a unique variable
# 2. Every row is a unique observation
# 3. Only keep what you need in a data set

### Working w/ what you have
filter(data.00, cyl == 4) # row subsetting function
select(data.00, mpg, cyl) # column subsetting function

data.00 %>% # piping operator
  filter(cyl == 4)

data.00 %>%
  select(mpg, cyl) %>%
  filter(cyl == 4)


### Creating something new
data.00 %>%
  mutate(mpg.per.cyl = mpg / cyl) %>%
  group_by(cyl) %>%
  summarise(mean.mpg.per.cyl = mean(mpg.per.cyl))

#Quick plot
plot(x = data.00$cyl, y = data.00$mpg, xlab = 'Cylinders', ylab = 'Miles Per Gallon',
     col = 'red', main = 'MPG by Number of Cylinders')
