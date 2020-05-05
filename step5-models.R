# Data sources
load("./data/epfu2.Rdata")
load("./data/myse2.Rdata")

library(lme4)
library(MuMIn)

# Global models

# EPFU
load("./data/epfu2.Rdata")

vars <- names(epfu[9:length(names(epfu))])

epfu.global <- glmer(
    formula(paste("use ~ ", paste(vars, collapse = " + "), " + (1|batid)")), 
    family = "binomial", data = epfu)

save(epfu.global, file = "./data/epfu-global.Rdata")

rm(vars)

# MYSE
load("./data/myse2.Rdata")

vars <- names(myse[9:length(names(myse))])

myse.global <- glmer(
    formula(paste("use ~ ", paste(vars, collapse = " + "), " + (1|batid)")), 
    family = "binomial", data = myse)

save(myse.global, file = "./data/myse-global.Rdata")

rm(vars)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

load("./data/epfu-global.Rdata")
load("./data/myse-global.Rdata")

# Dredge
options(na.action = "na.fail")

# EPFU
epfu.dredge <- dredge(epfu.global)
epfu.dredge.sd <- dredge(epfu.global, beta = c("sd"))

write.csv(epfu.dredge, file = "./results/epfu-dredge.csv")
write.csv(epfu.dredge.sd, file = "./results/epfu-dredge-sd.csv")

save(epfu.dredge, file = "./data/epfu-dredge.Rdata")
save(epfu.dredge.sd, file = "./data/epfu-dredge-sd.Rdata")

# MYSE
myse.dredge <- dredge(myse.global)
myse.dredge.sd <- dredge(myse.global, beta = c("sd"))

write.csv(myse.dredge, file = "./results/myse-dredge.csv")
write.csv(myse.dredge.sd, file = "./results/myse-dredge-sd.csv")

save(myse.dredge, file = "./data/myse-dredge.Rdata")
save(myse.dredge.sd, file = "./data/myse-dredge-sd.Rdata")

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# EPFU top model
epfu.dredge[1, ]

epfu.m1 <- glmer(use ~ aspect + dfresh + ptcc + pwet + road + (1|batid),
    family = "binomial", data = epfu)

summary(epfu.m1, correlation = F)

save(epfu.m1, file = "./data/epfu-m1.Rdata")

# MYSE top model
myse.dredge[1, ]

myse.m1 <- glmer(use ~ aspect + bldg + elev + pgra + pwet + (1|batid), 
    family = "binomial", data = myse)

summary(myse.m1, correlation = F)

save(myse.m1, file = "./data/myse-m1.Rdata")

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Candidate models 

# Template
epfu.m <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

# Names
names(epfu.dredge[6, is.na(epfu.dredge[6, ])])

# EPFU candidate models
#epfu.m2 <- glmer(use ~ aspect + dforcore + dfresh + ptcc + pwet + road + (1|batid),
    family = "binomial", data = epfu)

#epfu.m3 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + ptcc + pwet + road + (1|batid),
    family = "binomial", data = epfu)

#epfu.m4 <- glmer(use ~ aspect + dfresh + ptcc + road + (1|batid),
    family = "binomial", data = epfu)

#epfu.m5 <- glmer(use ~ aspect + dfresh + dmarine + ptcc + pwet + road + (1|batid),
    family = "binomial", data = epfu)

#epfu.m6 <- glmer(use ~ dfresh + ptcc + pwet + road + (1|batid),
    family = "binomial", data = epfu)

epfu.m7 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m8 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m9 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m10 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m11 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m12 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)

epfu.m13 <- glmer(use ~ aspect + dforcore + dfresh + dmarine + elev + pgra + ptcc + pwet + road + slope + (1|batid),
    family = "binomial", data = epfu)
