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

# Calculate correlation table
ef.corr <- corr(epfu)
write.csv(ef.corr, "./results/epfu-corr1.csv")

ms.corr <- corr(myse)
write.csv(ms.corr, "./results/myse-corr1.csv")

# Remove correlated variables

# EPFU

# pdev vs. pfor
pdev <- glmer(use ~ pdev + (1|batid), family = "binomial", data = epfu)
pfor <- glmer(use ~ pfor + (1|batid), family = "binomial", data = epfu)

compare <- AICc(pdev, pfor)
compare$delta <- round((compare$AICc - min(compare$AICc)), digits = 4)
compare <- compare[order(compare$delta), ]

compare # Remove pdev
epfu$pdev <- NULL

# Re-calculate correlation table
ef.corr <- corr(epfu)
write.csv(ef.corr, "./results/epfu-corr2.csv")

# ptcc vs. pfor
ptcc <- glmer(use ~ ptcc + (1|batid), family = "binomial", data = epfu)
pfor <- glmer(use ~ pfor + (1|batid), family = "binomial", data = epfu)

compare <- AICc(ptcc, pfor)
compare$delta <- round((compare$AICc - min(compare$AICc)), digits = 4)
compare <- compare[order(compare$delta), ]

compare # Remove pfor
epfu$pfor <- NULL

# Re-calculate correlation table
ef.corr <- corr(epfu)
write.csv(ef.corr, "./results/epfu-corr3.csv")

# bldg vs. ptcc
bldg <- glmer(use ~ bldg + (1|batid), family = "binomial", data = epfu)
ptcc <- glmer(use ~ ptcc + (1|batid), family = "binomial", data = epfu)

compare <- AICc(bldg, ptcc)
compare$delta <- round((compare$AICc - min(compare$AICc)), digits = 4)
compare <- compare[order(compare$delta), ]

compare # Remove bldg
epfu$bldg <- NULL

# Re-calculate correlation table
ef.corr <- corr(epfu)
write.csv(ef.corr, "./results/epfu-corr4.csv")

# MYSE

# pdev vs. pfor
pdev <- glmer(use ~ pdev + (1|batid), family = "binomial", data = myse)
pfor <- glmer(use ~ pfor + (1|batid), family = "binomial", data = myse)

compare <- AICc(pdev, pfor)
compare$delta <- round((compare$AICc - min(compare$AICc)), digits = 4)
compare <- compare[order(compare$delta), ]

compare # Remove pdev
myse$pdev <- NULL

# Re-calculate correlation table
ms.corr <- corr(myse)
write.csv(ms.corr, "./results/myse-corr2.csv")

# Save
save(epfu, file = "./data/epfu2.Rdata")
save(myse, file = "./data/myse2.Rdata")
