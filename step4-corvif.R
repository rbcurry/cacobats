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
write.csv(ef.corr, "./results/corvif/epfu-corr1.csv")

ms.corr <- corr(myse)
write.csv(ms.corr, "./results/corvif/myse-corr1.csv")

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
write.csv(ef.corr, "./results/corvif/epfu-corr2.csv")

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
write.csv(ef.corr, "./results/corvif/epfu-corr3.csv")

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
write.csv(ef.corr, "./results/corvif/epfu-corr4.csv")

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
write.csv(ms.corr, "./results/corvif/myse-corr2.csv")

# Save
save(epfu, file = "./data/epfu2.Rdata")
save(myse, file = "./data/myse2.Rdata")

# Generate global models and examine VIF

# VIF function
vif.mer <- function (fit) {
    ## adapted from rms::vif
    v <- vcov(fit)
    nam <- names(fixef(fit))
    ## exclude intercepts
    ns <- sum(1 * (nam == "Intercept" | nam == "(Intercept)"))
    if (ns > 0) {
        v <- v[-(1:ns), -(1:ns), drop = FALSE]
        nam <- nam[-(1:ns)]
    }
    d <- diag(v)^0.5
    v <- diag(solve(v/(d %o% d)))
    names(v) <- nam
    v
}

# EPFU
load("./data/epfu2.Rdata")
vars <- names(epfu[9:length(names(epfu))])
m <- list()

for (i in 1:length(vars)) {
    m[[i]] <- glmer(
        formula(paste("use ~ ", vars[i], " + (1|batid)", sep = "")), 
        family = "binomial", data = epfu)
}
rm(i)

# Generate VIF table
vif.table <- data.frame(row.names = vars, VIF = sapply(m, vif.mer))
vif.table
vif.table[which(vif.table$VIF >= 4), ] # None

# Write table
write.csv(vif.table, file = "./results/corvif/epfu-vif.csv")

# Cleanup
rm(epfu, vars, m, vif.table)

# MYSE
load("./data/myse2.Rdata")
vars <- names(myse[9:length(names(myse))])
m <- list()

for (i in 1:length(vars)) {
    m[[i]] <- glmer(
        formula(paste("use ~ ", vars[i], " + (1|batid)", sep = "")), 
        family = "binomial", data = myse)
}
rm(i)

# Generate VIF table
vif.table <- data.frame(row.names = vars, VIF = sapply(m, vif.mer))
vif.table
vif.table[which(vif.table$VIF >= 4), ] # None

# Write table
write.csv(vif.table, file = "./results/corvif/myse-vif.csv")

# Cleanup
rm(myse, vars, m, vif.table)