# Data sources
load("./data/epfu.Rdata")
load("./data/myse.Rdata")

load("./data/epfu-aic-combined-alt.Rdata")
load("./data/myse-aic-combined-alt.Rdata")

# Scale-of-effect plots
source("./functions/soeplot.R")

df <- epfu.aic.combined.alt

soeplot(df[df$var == "bldg", ], "Building density", "epfu")
soeplot(df[df$var == "road", ], "Road density", "epfu")
#soeplot(df[df$var == "ptcc", ], "Tree canopy cover", "epfu")
soeplot(df[df$var == "pdev", ], "Proportion developed", "epfu")
soeplot(df[df$var == "pfor", ], "Proportion forest", "epfu")
soeplot(df[df$var == "pgra", ], "Proportion grass/sand", "epfu")
soeplot(df[df$var == "pwet", ], "Proportion wetland", "epfu")

df <- myse.aic.combined.alt

soeplot(df[df$var == "bldg", ], "bldg", "myse")
soeplot(df[df$var == "road", ], "road", "myse")
#soeplot(df[df$var == "ptcc", ], "Tree canopy cover", "myse")
soeplot(df[df$var == "pdev", ], "Proportion developed", "myse")
soeplot(df[df$var == "pfor", ], "Proportion forest", "myse")
soeplot(df[df$var == "pgra", ], "Proportion grass/sand", "myse")
soeplot(df[df$var == "pwet", ], "Proportion wetland", "myse")

# Scale-of-effect plots (modified for ptcc)
source("./functions/soeplot-ptcc.R")

df <- epfu.aic.combined.alt

soeplot(df[df$var == "ptcc", ], "Tree canopy cover", "epfu")

df <- myse.aic.combined.alt

soeplot(df[df$var == "ptcc", ], "Tree canopy cover", "myse")

# Cleanup
rm(epfu.aic.combined.alt, myse.aic.combined.alt, df)

# Remove vars except at chosen scale
epfu$bldg060 <- NULL
epfu$bldg090 <- NULL
epfu$bldg120 <- NULL
epfu$bldg150 <- NULL
epfu$bldg180 <- NULL
epfu$bldg210 <- NULL
epfu$bldg240 <- NULL
epfu$bldg270 <- NULL
epfu$bldg300 <- NULL
epfu$bldg330 <- NULL
#epfu$bldg360 <- NULL

epfu$pdev060 <- NULL
epfu$pdev090 <- NULL
epfu$pdev120 <- NULL
epfu$pdev150 <- NULL
epfu$pdev180 <- NULL
epfu$pdev210 <- NULL
epfu$pdev240 <- NULL
epfu$pdev270 <- NULL
epfu$pdev300 <- NULL
epfu$pdev330 <- NULL
#epfu$pdev360 <- NULL

epfu$pfor060 <- NULL
epfu$pfor090 <- NULL
epfu$pfor120 <- NULL
epfu$pfor150 <- NULL
epfu$pfor180 <- NULL
epfu$pfor210 <- NULL
epfu$pfor240 <- NULL
epfu$pfor270 <- NULL
epfu$pfor300 <- NULL
epfu$pfor330 <- NULL
#epfu$pfor360 <- NULL

epfu$pgra060 <- NULL
epfu$pgra090 <- NULL
epfu$pgra120 <- NULL
epfu$pgra150 <- NULL
epfu$pgra180 <- NULL
epfu$pgra210 <- NULL
epfu$pgra240 <- NULL
epfu$pgra270 <- NULL
#epfu$pgra300 <- NULL
epfu$pgra330 <- NULL
epfu$pgra360 <- NULL

epfu$ptcc060 <- NULL
epfu$ptcc090 <- NULL
epfu$ptcc120 <- NULL
epfu$ptcc150 <- NULL
epfu$ptcc180 <- NULL
epfu$ptcc210 <- NULL
#epfu$ptcc240 <- NULL
epfu$ptcc270 <- NULL
epfu$ptcc300 <- NULL
epfu$ptcc330 <- NULL
epfu$ptcc360 <- NULL

#epfu$pwet060 <- NULL
epfu$pwet090 <- NULL
epfu$pwet120 <- NULL
epfu$pwet150 <- NULL
epfu$pwet180 <- NULL
epfu$pwet210 <- NULL
epfu$pwet240 <- NULL
epfu$pwet270 <- NULL
epfu$pwet300 <- NULL
epfu$pwet330 <- NULL
epfu$pwet360 <- NULL

epfu$road060 <- NULL
epfu$road090 <- NULL
epfu$road120 <- NULL
epfu$road150 <- NULL
#epfu$road180 <- NULL
epfu$road210 <- NULL
epfu$road240 <- NULL
epfu$road270 <- NULL
epfu$road300 <- NULL
epfu$road330 <- NULL
epfu$road360 <- NULL

# Rename variables
colnames(epfu)[colnames(epfu) == "bldg360"] <- "bldg"
colnames(epfu)[colnames(epfu) == "pdev360"] <- "pdev"
colnames(epfu)[colnames(epfu) == "pfor360"] <- "pfor"
colnames(epfu)[colnames(epfu) == "pgra300"] <- "pgra"
colnames(epfu)[colnames(epfu) == "ptcc240"] <- "ptcc"
colnames(epfu)[colnames(epfu) == "pwet060"] <- "pwet"
colnames(epfu)[colnames(epfu) == "road180"] <- "road"

# Save
save(epfu, file = "./data/epfu1.Rdata")

## Remove vars except at chosen scale
#myse$bldg060 <- NULL
myse$bldg090 <- NULL
myse$bldg120 <- NULL
myse$bldg150 <- NULL
myse$bldg180 <- NULL
myse$bldg210 <- NULL
myse$bldg240 <- NULL
myse$bldg270 <- NULL
myse$bldg300 <- NULL
myse$bldg330 <- NULL
myse$bldg360 <- NULL

myse$pdev060 <- NULL
myse$pdev090 <- NULL
myse$pdev120 <- NULL
#myse$pdev150 <- NULL
myse$pdev180 <- NULL
myse$pdev210 <- NULL
myse$pdev240 <- NULL
myse$pdev270 <- NULL
myse$pdev300 <- NULL
myse$pdev330 <- NULL
myse$pdev360 <- NULL

myse$pfor060 <- NULL
myse$pfor090 <- NULL
myse$pfor120 <- NULL
#myse$pfor150 <- NULL
myse$pfor180 <- NULL
myse$pfor210 <- NULL
myse$pfor240 <- NULL
myse$pfor270 <- NULL
myse$pfor300 <- NULL
myse$pfor330 <- NULL
myse$pfor360 <- NULL

myse$pgra060 <- NULL
#myse$pgra090 <- NULL
myse$pgra120 <- NULL
myse$pgra150 <- NULL
myse$pgra180 <- NULL
myse$pgra210 <- NULL
myse$pgra240 <- NULL
myse$pgra270 <- NULL
myse$pgra300 <- NULL
myse$pgra330 <- NULL
myse$pgra360 <- NULL

myse$ptcc060 <- NULL
myse$ptcc090 <- NULL
myse$ptcc120 <- NULL
#myse$ptcc150 <- NULL
myse$ptcc180 <- NULL
myse$ptcc210 <- NULL
myse$ptcc240 <- NULL
myse$ptcc270 <- NULL
myse$ptcc300 <- NULL
myse$ptcc330 <- NULL
myse$ptcc360 <- NULL

myse$pwet060 <- NULL
myse$pwet090 <- NULL
myse$pwet120 <- NULL
myse$pwet150 <- NULL
myse$pwet180 <- NULL
myse$pwet210 <- NULL
myse$pwet240 <- NULL
myse$pwet270 <- NULL
myse$pwet300 <- NULL
myse$pwet330 <- NULL
#myse$pwet360 <- NULL

myse$road060 <- NULL
#myse$road090 <- NULL
myse$road120 <- NULL
myse$road150 <- NULL
myse$road180 <- NULL
myse$road210 <- NULL
myse$road240 <- NULL
myse$road270 <- NULL
myse$road300 <- NULL
myse$road330 <- NULL
myse$road360 <- NULL

# Rename variables
colnames(myse)[colnames(myse) == "bldg060"] <- "bldg"
colnames(myse)[colnames(myse) == "pdev150"] <- "pdev"
colnames(myse)[colnames(myse) == "pfor150"] <- "pfor"
colnames(myse)[colnames(myse) == "pgra090"] <- "pgra"
colnames(myse)[colnames(myse) == "ptcc150"] <- "ptcc"
colnames(myse)[colnames(myse) == "pwet360"] <- "pwet"
colnames(myse)[colnames(myse) == "road090"] <- "road"

## Save data
save(myse, file = "./data/myse1.Rdata")