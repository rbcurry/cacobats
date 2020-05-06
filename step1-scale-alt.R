# Alternative sample sizes for available points
# Each dataset contains 47 used points + varying numbers of available points

# Data sources
load("./data/roost.Rdata")

library(dplyr)

#47 + 47*100 = 4747
roost.100 <- as.data.frame(roost)

for (i in 1:length(roost)) {
  attr(roost[[i]], "samples") <- 100
}
rm(i)

#47 + 47*90 = 4277
roost.90 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:91))

for (i in 1:length(roost.90)) {
  attr(roost.90[[i]], "samples") <- 90
}
rm(i)

#47 + 47*80 = 3807
roost.80 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:81))

for (i in 1:length(roost.80)) {
  attr(roost.80[[i]], "samples") <- 80
}
rm(i)

# 47 + 47*70 = 3337
roost.70 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:71))

for (i in 1:length(roost.70)) {
  attr(roost.70[[i]], "samples") <- 70
}
rm(i)

# 47 + 47*60 = 2867
roost.60 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:61))

for (i in 1:length(roost.60)) {
  attr(roost.60[[i]], "samples") <- 60
}
rm(i)

# 47 + 47*50 = 2397
roost.50 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:51))

for (i in 1:length(roost.50)) {
  attr(roost.50[[i]], "samples") <- 50
}
rm(i)

# 47 + 47*40 = 1927
roost.40 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:41))

for (i in 1:length(roost.40)) {
  attr(roost.40[[i]], "samples") <- 40
}
rm(i)

# 47 + 47*30 = 1457
roost.30 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:31))

for (i in 1:length(roost.30)) {
  attr(roost.30[[i]], "samples") <- 30
}
rm(i)

# 47 + 47*20 = 987
roost.20 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:21))

for (i in 1:length(roost.20)) {
  attr(roost.20[[i]], "samples") <- 20
}
rm(i)

# 47 + 47*10 = 517
roost.10 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:11))

for (i in 1:length(roost.10)) {
  attr(roost.10[[i]], "samples") <- 10
}
rm(i)

# 47 + 47*1 = 94
roost.1 <- as.data.frame(roost %>% group_by(locid) %>% slice(1:2))

for (i in 1:length(roost.1)) {
  attr(roost.1[[i]], "samples") <- 1
}
rm(i)

# Save
save(
    roost.100, 
    roost.90, 
    roost.80, 
    roost.70, 
    roost.60, 
    roost.50, 
    roost.40, 
    roost.30, 
    roost.20, 
    roost.10, 
    roost.1, 
    file = "./data/roost-alt.Rdata")

# Split into species datasets - EPFU
epfu.100 <- roost.100[roost.100$species == "EPFU", ]

for (i in 1:length(epfu.100)) {
  attr(epfu.100[[i]], "spp") <- "epfu"
  attr(epfu.100[[i]], "samples") <- 100
}
rm(i)

#
epfu.90 <- roost.90[roost.90$species == "EPFU", ]

for (i in 1:length(epfu.90)) {
  attr(epfu.90[[i]], "spp") <- "epfu"
  attr(epfu.90[[i]], "samples") <- 90
}
rm(i)

#
epfu.80 <- roost.80[roost.80$species == "EPFU", ]

for (i in 1:length(epfu.80)) {
  attr(epfu.80[[i]], "spp") <- "epfu"
  attr(epfu.80[[i]], "samples") <- 80
}
rm(i)

#
epfu.70 <- roost.70[roost.70$species == "EPFU", ]

for (i in 1:length(epfu.70)) {
  attr(epfu.70[[i]], "spp") <- "epfu"
  attr(epfu.70[[i]], "samples") <- 70
}
rm(i)

#
epfu.60 <- roost.60[roost.60$species == "EPFU", ]

for (i in 1:length(epfu.60)) {
  attr(epfu.60[[i]], "spp") <- "epfu"
  attr(epfu.60[[i]], "samples") <- 60
}
rm(i)

#
epfu.50 <- roost.50[roost.50$species == "EPFU", ]

for (i in 1:length(epfu.50)) {
  attr(epfu.50[[i]], "spp") <- "epfu"
  attr(epfu.50[[i]], "samples") <- 50
}
rm(i)

#
epfu.40 <- roost.40[roost.40$species == "EPFU", ]

for (i in 1:length(epfu.40)) {
  attr(epfu.40[[i]], "spp") <- "epfu"
  attr(epfu.40[[i]], "samples") <- 40
}
rm(i)

#
epfu.30 <- roost.30[roost.30$species == "EPFU", ]

for (i in 1:length(epfu.30)) {
  attr(epfu.30[[i]], "spp") <- "epfu"
  attr(epfu.30[[i]], "samples") <- 30
}
rm(i)

#
epfu.20 <- roost.20[roost.20$species == "EPFU", ]

for (i in 1:length(epfu.20)) {
  attr(epfu.20[[i]], "spp") <- "epfu"
  attr(epfu.20[[i]], "samples") <- 20
}
rm(i)

#
epfu.10 <- roost.10[roost.10$species == "EPFU", ]

for (i in 1:length(epfu.10)) {
  attr(epfu.10[[i]], "spp") <- "epfu"
  attr(epfu.10[[i]], "samples") <- 10
}
rm(i)

#
epfu.1 <- roost.1[roost.1$species == "EPFU", ]

for (i in 1:length(epfu.1)) {
  attr(epfu.1[[i]], "spp") <- "epfu"
  attr(epfu.1[[i]], "samples") <- 1
}
rm(i)

# Save
save(
    epfu.100, 
    epfu.90, 
    epfu.80, 
    epfu.70, 
    epfu.60, 
    epfu.50, 
    epfu.40, 
    epfu.30, 
    epfu.20, 
    epfu.10, 
    epfu.1, 
    file = "./data/epfu-alt.Rdata")

# Cleanup
rm(
    epfu.100, 
    epfu.90, 
    epfu.80, 
    epfu.70, 
    epfu.60, 
    epfu.50, 
    epfu.40, 
    epfu.30, 
    epfu.20, 
    epfu.10, 
    epfu.1
)

# Split into species datasets - MYSE
myse.100 <- roost.100[roost.100$species == "MYSE", ]

for (i in 1:length(myse.100)) {
  attr(myse.100[[i]], "spp") <- "myse"
  attr(myse.100[[i]], "samples") <- 100
}
rm(i)

#
myse.90 <- roost.90[roost.90$species == "MYSE", ]

for (i in 1:length(myse.90)) {
  attr(myse.90[[i]], "spp") <- "myse"
  attr(myse.90[[i]], "samples") <- 90
}
rm(i)

#
myse.80 <- roost.80[roost.80$species == "MYSE", ]

for (i in 1:length(myse.80)) {
  attr(myse.80[[i]], "spp") <- "myse"
  attr(myse.80[[i]], "samples") <- 80
}
rm(i)

#
myse.70 <- roost.70[roost.70$species == "MYSE", ]

for (i in 1:length(myse.70)) {
  attr(myse.70[[i]], "spp") <- "myse"
  attr(myse.70[[i]], "samples") <- 70
}
rm(i)

#
myse.60 <- roost.60[roost.60$species == "MYSE", ]

for (i in 1:length(myse.60)) {
  attr(myse.60[[i]], "spp") <- "myse"
  attr(myse.60[[i]], "samples") <- 60
}
rm(i)

#
myse.50 <- roost.50[roost.50$species == "MYSE", ]

for (i in 1:length(myse.50)) {
  attr(myse.50[[i]], "spp") <- "myse"
  attr(myse.50[[i]], "samples") <- 50
}
rm(i)

#
myse.40 <- roost.40[roost.40$species == "MYSE", ]

for (i in 1:length(myse.40)) {
  attr(myse.40[[i]], "spp") <- "myse"
  attr(myse.40[[i]], "samples") <- 40
}
rm(i)

#
myse.30 <- roost.30[roost.30$species == "MYSE", ]

for (i in 1:length(myse.30)) {
  attr(myse.30[[i]], "spp") <- "myse"
  attr(myse.30[[i]], "samples") <- 30
}
rm(i)

#
myse.20 <- roost.20[roost.20$species == "MYSE", ]

for (i in 1:length(myse.20)) {
  attr(myse.20[[i]], "spp") <- "myse"
  attr(myse.20[[i]], "samples") <- 20
}
rm(i)

#
myse.10 <- roost.10[roost.10$species == "MYSE", ]

for (i in 1:length(myse.10)) {
  attr(myse.10[[i]], "spp") <- "myse"
  attr(myse.10[[i]], "samples") <- 10
}
rm(i)

#
myse.1 <- roost.1[roost.1$species == "MYSE", ]

for (i in 1:length(myse.1)) {
  attr(myse.1[[i]], "spp") <- "myse"
  attr(myse.1[[i]], "samples") <- 1
}
rm(i)

# Save
save(
    myse.100, 
    myse.90, 
    myse.80, 
    myse.70, 
    myse.60, 
    myse.50, 
    myse.40, 
    myse.30, 
    myse.20, 
    myse.10, 
    myse.1, 
    file = "./data/myse-alt.Rdata")

# Cleanup
rm(
    myse.100, 
    myse.90, 
    myse.80, 
    myse.70, 
    myse.60, 
    myse.50, 
    myse.40, 
    myse.30, 
    myse.20, 
    myse.10, 
    myse.1
)

rm(
    roost.100, 
    roost.90, 
    roost.80, 
    roost.70, 
    roost.60, 
    roost.50, 
    roost.40, 
    roost.30, 
    roost.20, 
    roost.10, 
    roost.1,
    roost
)
