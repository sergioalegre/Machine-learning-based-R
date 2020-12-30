                      kccf <- read.csv("kccf.csv", header = T, sep = ",")
                      kccf$Class <- as.factor(kccf$Class)
                      
                      ##  Get an idea of the imbalance in class distribution
                      
                      summary(kccf$Class)
                      
                      
                      ##  Explore to see if there are any missing values in the data
                      
                      nrow(kccf[!complete.cases(kccf), ])
                      colnames(kccf)[colSums(is.na(kccf)) > 0]
