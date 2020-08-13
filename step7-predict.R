# Data sources
load("./data/epfu3.Rdata")
load("./data/epfu-dredge.Rdata")
load("./data/epfu-dredge-sd.Rdata")
load("./data/epfu-m1.Rdata")

load("./data/myse3.Rdata")
load("./data/myse-dredge.Rdata")
load("./data/myse-dredge-sd.Rdata")
load("./data/myse-m1.Rdata")

# Summary
summary(epfu.m1)

# Residuals
resid.m1 <- resid(epfu.m1)

head(resid.m1)
range(resid.m1)

head(epfu.m1)

p <- predict(epfu.m1, type = "response", re.form = NA)

head(p*100000)
max(p*1000000)
min(p)

# Check for normality
?rstandard.glm
e <- rstandard(epfu.m1)
?rstandard

hist(e)

qqnorm(e)


# Plot
library(ggplot2)

df <- data.frame(x = as.numeric(epfu$aspect))
#df <- data.frame(x = as.numeric(epfu.raw$aspect))
df$use <- as.numeric(epfu$use)
df$batid <- as.character(epfu$batid)

library(lme4)
fit <- glmer(use ~ x + (1|batid), family = "binomial", data = df)
fitted <- data.frame(x = df$x, y = predict(fit, type = "response", re.form = NA))

ggplot(df, aes(x, use)) +
    stat_smooth(method = "glm", method.args = list(family = "binomial")) +
    geom_point(data = fitted, aes(x, y))


str(df)







# New data frame
head(epfu, 3)

epfu.m1 <- glmer(use ~ aspect + (1|batid), family = "binomial", data = epfu)
predict(epfu.m1, newdata = epfu$aspect, type = "response", re.form = NA)

?predict.merMod



head(predict(epfu.m1))
head(predict(epfu.m1, re.form = NA))

predict(epfu.m1, newdata = as.numeric(epfu$aspect))
new <- data.frame(cbind(aspect = epfu$aspect, batid = epfu$batid))
head(new)

# EPFU predicted values
p.aspect <- exp(-0.2889364 * epfu$aspect) / (1 + exp(-0.2889364 * epfu$aspect))
p.dfresh <- exp(-1.4318002 * epfu$dfresh) / (1 + exp(-1.4318002 * epfu$dfresh))
p.ptcc <- exp(0.7432391 * epfu$ptcc) / (1 + exp(0.7432391 * epfu$ptcc))
p.pwet <- exp(-0.4932248 * epfu$pwet) / (1 + exp(-0.4932248 * epfu$pwet))
p.road <- exp(0.4464262 * epfu$road) / (1 + exp(0.4464262 * epfu$road))

# Plot
plot(p.aspect[order(p.aspect)] ~ epfu$aspect[order(p.aspect)], type = "l")
plot(p.dfresh[order(p.dfresh)] ~ epfu$dfresh[order(p.dfresh)], type = "l")
plot(p.ptcc[order(p.ptcc)] ~ epfu$ptcc[order(p.ptcc)], type = "l")
plot(p.pwet[order(p.pwet)] ~ epfu$pwet[order(p.pwet)], type = "l")
plot(p.road[order(p.road)] ~ epfu$road[order(p.road)], type = "l")

plot(p.road[order(p.road)] ~ epfu$road[order(p.road)], type = "l", 
    xlab = "Total road length (m)", 
    ylab = "Relative probability of selection", 
    main = "Road density per hectare")

plot(p.dfresh[order(p.dfresh)] ~ epfu$dfresh[order(p.dfresh)], type = "l", 
    xlab = "Distance to nearest freshwater shoreline (m)", 
    ylab = "Relative probability of selection", 
    main = "Distance to fresh water")

# Data exploration
test <- as.numeric(epfu$dfresh)
test.m1 <- glmer(use ~ dfresh + (1|batid), family = "binomial", data = epfu)

range(test)
x <- seq(floor(min(test)), ceiling(max(test)), 100)
x

y <- predict(test.m1, re.form = NA)
y

length(test)
length(test.m1)
plot(x = test, y = test.m1)


### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Bolker stuff

# fixef(): extract vector of fixed-effects parameters
fixef(epfu.m1)
fixef(myse.m1) # pgra is large

# VarCorr(): extract estimates of random effect variances and covariances
VarCorr(epfu.m1)
VarCorr(myse.m1)

# ranef(): extract estimates of random effects


# Plots
p1 <- plot(epfu.m1, id = 0.05, idLabels = ~.obs)
p1
p2 <- plot(epfu.m1, ylim = c(-1.5, 1), type = c("p", "smooth"))
p2
arrange(p1, p2, nrow = 1)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# EPFU predicted values
p.aspect <- exp(-0.2889364 * epfu.raw$aspect) / (1 + exp(-0.2889364 * epfu.raw$aspect))
p.dfresh <- exp(-1.4318002 * epfu.raw$dfresh) / (1 + exp(-1.4318002 * epfu.raw$dfresh))
p.ptcc <- exp(0.7432391 * epfu.raw$ptcc) / (1 + exp(0.7432391 * epfu.raw$ptcc))
p.pwet <- exp(-0.4932248 * epfu.raw$pwet) / (1 + exp(-0.4932248 * epfu.raw$pwet))
p.road <- exp(0.4464262 * epfu.raw$road) / (1 + exp(0.4464262 * epfu.raw$road))

# MYSE predicted values
p.aspect <- exp(0.4994905 * myse.raw$aspect) / (1 + exp(0.4994905 * myse.raw$aspect))
p.bldg <- exp(1.0560482 * myse.raw$bldg) / (1 + exp(1.0560482 * myse.raw$bldg))
p.elev <- exp(0.7990804 * myse.raw$elev) / (1 + exp(0.7990804 * myse.raw$elev))
p.pgra <- exp(-5.2874291 * myse.raw$pgra) / (1 + exp(-5.2874291 * myse.raw$pgra))
p.pwet <- exp(0.3869128 * myse.raw$pwet) / (1 + exp(0.3869128 * myse.raw$pwet))

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Plot
plot(p.dfresh ~ epfu.raw$dfresh, type = "l")
plot(p.dfresh[order(p.dfresh)] ~ epfu.raw$dfresh, type = "l")
plot(p.dfresh[order(p.dfresh)] ~ epfu.raw$dfresh[order(epfu.raw$dfresh)], type = "l")

plot(p.dmarine ~ epfu.raw$dmarine, type = "l")
plot(p.dmarine[order(p.dmarine)] ~ epfu.raw$dmarine, type = "l")
plot(p.dmarine[order(p.dmarine)] ~ epfu.raw$dmarine[order(epfu.raw$dmarine)], type = "l")

plot(p.dforcore ~ epfu.raw$dforcore, type = "l")
plot(p.dforcore[order(p.dforcore)] ~ epfu.raw$dforcore, type = "l")
plot(p.dforcore[order(p.dforcore)] ~ epfu.raw$dforcore[order(epfu.raw$dforcore)], type = "l")

#
plot(plogis(predict(glm.fresh))~combined$Fresh)

plot(epfu.raw$use ~ epfu.raw$dfresh)

p <- epfu.models[[3]]
p2 <- predict(p)
p3 <- plogis(p2)

plot(p3 ~ epfu.raw$dfresh)
plot(p3 ~ epfu.raw$dfresh, type = "l")
plot(p3[order(p3)] ~ epfu.raw$dfresh)

y = rnorm(100)
x = c(1:100)
plot(y ~ x)
plot(y[order(y)] ~ x)
plot(y[order(x)] ~ x)
plot(y ~ x[order(x)])
plot(y ~ x[order(y)])


plot(plogis(p ~ epfu.raw$dfresh))

#
summary(glm.fresh)

plogis(predict(glm.fresh))


### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# MYSE
summary(myse.models[[2]])$coefficients

# MYSE predicted values
p.dfresh <- exp(0.06935953 * myse.raw$dfresh) / (1 + exp(0.06935953 * myse.raw$dfresh))
p.dmarine <- exp(-0.19489882 * myse.raw$dmarine) / (1 + exp(-0.19489882 * myse.raw$dmarine))
p.dforcore <- exp(-0.41925563 * myse.raw$dforcore) / (1 + exp(-0.41925563 * myse.raw$dforcore))
p.elev <- exp(0.82622730 * myse.raw$elev) / (1 + exp(0.82622730 * myse.raw$elev))
p.slope <- exp(0.15645890 * myse.raw$slope) / (1 + exp(0.15645890 * myse.raw$slope))
p.aspect <- exp(0.51876342 * myse.raw$aspect) / (1 + exp(0.51876342 * myse.raw$aspect))
p.bldg <- exp(0.88876148 * myse.raw$bldg) / (1 + exp(0.88876148 * myse.raw$bldg))
p.road <- exp(0.31515225 * myse.raw$road) / (1 + exp(0.31515225 * myse.raw$road))
p.ptcc <- exp(-0.67810063 * myse.raw$ptcc) / (1 + exp(-0.67810063 * myse.raw$ptcc))
p.pfor <- exp(0.37974504 * myse.raw$pfor) / (1 + exp(0.37974504 * myse.raw$pfor))
p.pgra <- exp(-7.07137992 * myse.raw$pgra) / (1 + exp(-7.07137992 * myse.raw$pgra))
p.pwet <- exp(0.34600506 * myse.raw$pwet) / (1 + exp(0.34600506 * myse.raw$pwet))

# Plot
plot(p.dfresh[order(p.dfresh)] ~ epfu.raw$dfresh[order(p.dfresh)], type = "l")



### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# EPFU
# predicted values
p.dstruct = exp(-3.0654*myse$dstruct)/(1+exp(-3.0654*myse$dstruct))
p.elev <- exp(0.6417*myse$elev)/(1+exp(0.6417*myse$elev))
p.gra180 <- exp(-2.3077*myse$gra180)/(1+exp(-2.3077*myse$gra180))

# plots
plot(p.dstruct[order(p.dstruct)]~myse$dstruct[order(p.dstruct)], type="l")
plot(p.elev[order(p.elev)]~myse$elev[order(p.elev)], type="l")
plot(p.gra180[order(p.gra180)]~myse$gra180[order(p.gra180)], type="l")

# original values
myse$elev2 <- myse$elev*6.840799+11.30945

myse$dstruct2 <- myse$dstruct*attr(myse$dstruct, 'scaled:scale')+attr(myse$dstruct, 'scaled:center')
myse$elev2 <- myse$elev*attr(myse$elev, 'scaled:scale')+attr(myse$elev, 'scaled:center')
myse$gra1802 <- myse$gra180*attr(myse$gra180, 'scaled:scale')+attr(myse$gra180, 'scaled:center')


