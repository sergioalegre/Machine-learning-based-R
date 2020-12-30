# 1- cargar el dataset mpg
# 2- ver las 6 primeras rows
# 3- calcular la media de 'cty' para coches compactos
# 4- crear un nuevo dataframe con 5 variables

# 1- cargar el dataset mpg
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
data.00 <- mpg
View(data.00)

# 2. ver las 6 primeras rows; do it 2 different ways
slice(data.00, 1:6)
head(data.00)
data.00[1:6,]

# 3. calcular la media de 'cty' para coches compactos
###  Answer: 20.1
data.00 %>%
  select(class, cty) %>% # subset to only desired variables
  group_by(class) %>% # to collect all vehicles of same class in the calculation
  summarise(mean.cty = mean(cty)) %>% # calculates mean of cty for each class
  filter(class == 'compact')


# 4. crear un nuevo dataframe con 5 variables: 
###       manufacturer, class, cty, mean.hwy, and hwy.per.cyl. 
#    mean.hwy should be the average of 'hwy' for each manufacturer's classes of vehicles,
###       by number of cylinders. 
#    hwy.per.cyl should be the average ratio of hwy to cyl for each manufacturer's classes
###       of vehicles, by number of cylinders.
#    Each manufactuer/class/cyl combination should have only one record in the dataframe.
new.data <- data.00 %>%
  mutate(hwy.to.cyl = hwy / cyl) %>%
  group_by(manufacturer, class, cyl) %>%
  summarise(mean.hwy = mean(hwy), hwy.per.cyl = mean(hwy.to.cyl)) %>%
  select(manufacturer, class, cyl, mean.hwy, hwy.per.cyl)



# 5. Plot 'hwy' against 'cty' for all 2008 models.
data.08 <- data.00 %>%
  filter(year == '2008') %>%
  select(hwy, cty)
plot(data.08$cty, data.08$hwy, type = 'p', col = 'blue',
     main = 'Hwy vs. Cty for 2008 Models')

