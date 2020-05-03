# Data sources
load("./data/epfu1.Rdata")
load("./data/myse1.Rdata")

library(lme4)
library(MuMIn)

# Corr function
corr <- function(data) {
  df <- data[, 9:length(data)]
  
  df.corr <- round(cor(df), digits = 2)
  df.corr[df.corr == 1] <- NA
  df.corr[abs(df.corr) < 0.7] <- NA
  
  rm(df)
  return(df.corr)
}

# Create correlation tables
ef.corr <- corr(epfu)
ms.corr <- corr(myse)

# Save correlation tables
save(ef.corr, file = "./data/epfu-corr1.Rdata")
save(ms.corr, file = "./data/myse-corr1.Rdata")

# Write to file
write.csv(ef.corr, "./results/epfu-corr1.csv")
write.csv(ms.corr, "./results/myse-corr1.csv")
