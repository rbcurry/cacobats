# Data sources
load("./data/epfu2.Rdata")
load("./data/myse2.Rdata")

library(lme4)
library(MuMIn)

# Generate global models

# EPFU
vars <- names(epfu[9:length(names(epfu))])

epfu.ungroup.global <- glm(
    formula(paste("use ~ ", paste(vars, collapse = " + "))), 
    family = "binomial", data = epfu)

save(epfu.ungroup.global, file = "./data/epfu-ungroup-global.Rdata")

rm(vars)

# MYSE
vars <- names(myse[9:length(names(myse))])

myse.ungroup.global <- glm(
    formula(paste("use ~ ", paste(vars, collapse = " + "))), 
    family = "binomial", data = myse) # Warning message

save(myse.ungroup.global, file = "./data/myse-ungroup-global.Rdata")

rm(vars)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Dredge
options(na.action = "na.fail")

# EPFU
epfu.ungroup.dredge <- dredge(epfu.ungroup.global)
epfu.ungroup.dredge.sd <- dredge(epfu.ungroup.global, beta = c("sd"))

write.csv(epfu.ungroup.dredge, file = "./results/epfu-ungroup-dredge.csv")
write.csv(epfu.ungroup.dredge.sd, file = "./results/epfu-ungroup-dredge-sd.csv")

save(epfu.ungroup.dredge, file = "./data/epfu-ungroup-dredge.Rdata")
save(epfu.ungroup.dredge.sd, file = "./data/epfu-ungroup-dredge-sd.Rdata")

# MYSE
myse.ungroup.dredge <- dredge(myse.ungroup.global) # Warning message
myse.ungroup.dredge.sd <- dredge(myse.ungroup.global, beta = c("sd")) # Warning message

write.csv(myse.ungroup.dredge, file = "./results/myse-ungroup-dredge.csv")
write.csv(myse.ungroup.dredge.sd, file = "./results/myse-ungroup-dredge-sd.csv")

save(myse.ungroup.dredge, file = "./data/myse-ungroup-dredge.Rdata")
save(myse.ungroup.dredge.sd, file = "./data/myse-ungroup-dredge-sd.Rdata")

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# EPFU top model
epfu.ungroup.dredge.sd[1, ]

epfu.ungroup.m1 <- glm(use ~ aspect + dfresh + ptcc + pwet + road,
    family = "binomial", data = epfu)

summary(epfu.ungroup.m1, correlation = F)

save(epfu.ungroup.m1, file = "./data/epfu-ungroup-m1.Rdata")

# MYSE top model
myse.ungroup.dredge.sd[1, ]

myse.ungroup.m1 <- glm(use ~ aspect + bldg + elev + pgra + pwet, 
    family = "binomial", data = myse) # Warning message

summary(myse.ungroup.m1, correlation = F)

save(myse.ungroup.m1, file = "./data/myse-ungroup-m1.Rdata")

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Cleanup
rm(epfu.ungroup.global)
rm(myse.ungroup.global)
