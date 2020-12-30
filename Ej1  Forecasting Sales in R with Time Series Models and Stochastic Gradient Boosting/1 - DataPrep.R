#Basado en: https://www.eduonix.com/dashboard/applied-machine-learning-for-professionals/lecture/16108514

# ---------------------------------------------
# 1. Cargar dataset, revisar y corregir lo necesario
# 2. Check for valid dates & missing values
# 3. View seasonal plots
# ---------------------------------------------
# ---------------------------------------------


# ---------------------------------------------
# 1. Cargar dataset, revisar y corregir lo necesario
# ---------------------------------------------
library(tidyverse) # for data wrangling
library(forecast)  # for time series forecasting
library(lubridate) # for handling date/time data
library(caret)     # offers streamlined ML functionality
library(xgboost)   # for gradient boosting models


## Cargamos dataset y vemos que tenemos
tsdat.00 <- read.csv('POS_train2.csv', header = T, stringsAsFactors = F)
str(tsdat.00) #tenemos 6 caracteristicas y hay que 'arreglar' dos de ellas:
 #"Store.No" es el identificador de tienda esta como cadena la hemos de pasar a tipo entero
 #"Week" esta como cadena le hemos de pasar a tipo fecha

# Hacemos los cambios planteados
tsdat.00$Store.No <- as.character(tsdat.00$Store.No)
tsdat.00$Week <- as.Date(tsdat.00$Week, format = "%m/%d/%Y")
str(tsdat.00)




# ---------------------------------------------
# 2. Check for valid dates & missing values
# ---------------------------------------------

# Vemos cuantas observaciones hay por tienda para buscar cuales les faltan datos
tsdat.00 %>%
  group_by(Store.No) %>%
  summarise(Length = n())
### NOTE: 930 and 1451 have shorter history than the other stores; 1246 has 2 missing obs.

### Create a vector of date to check for missing weeks, particularly for store 1246
dates <- as.data.frame(seq(as.Date("2/5/2010", format = "%m/%d/%Y"), 
                           as.Date("9/28/2012", format = "%m/%d/%Y"), 
                           by="week"))
dates <- expand.grid(dates[,1], unique(tsdat.00$Store.No))
colnames(dates) <- c("Week", "Store.No")

date.ck <- dates %>%
  left_join(tsdat.00, by = c('Week', 'Store.No')) %>%
  arrange(Store.No, Week)
### We need to impute values for the missing obs. in store 1246


# Function to imput mean value
ts.impute <- function(var) {
  var <- (lag(var) + lead(var))/2
}
date.ck <- date.ck %>%
  mutate(Total.POS = ifelse(Store.No == 1246 & is.na(Format), ts.impute(Total.POS), Total.POS),
         Store.Holiday = ifelse(Store.No == 1246 & is.na(Format), lag(Store.Holiday), Store.Holiday),
         Sq.Ft = ifelse(Store.No == 1246 & is.na(Sq.Ft), lag(Sq.Ft), Sq.Ft)
  )


# ---------------------------------------------
# 3. View seasonal plots
# ---------------------------------------------

#creamos un nuevo objeto llamado tsdat.10 y le llenamos con las observaciones que tengan formato
tsdat.10 <- date.ck %>%
  select(Date = Week, everything()) %>%
  filter(!is.na(Format))


## View seasonal plots
stores <- unique(tsdat.10$Store.No) #creamos una lista con las tiendas agrupandolas por el identificador ("Store.No")
for (i in 1:length(stores)) {
  ts <- tsdat.10 %>%
    filter(Store.No == stores[i]) %>%
    select(Total.POS)
  ts <- ts(ts, frequency = 52, start = c(year(min(tsdat.10$Date)),week(min(tsdat.10$Date))))
  seasonplot(ts, s = 52, col = rainbow(3), main = stores[i], year.labels = TRUE) #52 semanas en el año
}

#esto nos creará un plot por tienda donde podemos ver las ventas de cada semana en los diferentes años.
#lo malo es que vemos 'picos' en unas semanas que no se ven en otros años. Esto hay que arreglarlo para hacer predicciones