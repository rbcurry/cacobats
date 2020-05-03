# Data sources
load("./data/epfu.Rdata")
load("./data/myse.Rdata")

dataset.list <- list(epfu, myse)

# AIC comparison and table generation function
aic.compare <- function(var) {

library(lme4)
library(MuMIn)

m <- list()

for (i in 1:length(var)) {
    m[[i]] <- glmer(
        formula(paste("use ~ ", var[i], " + (1|batid)", sep = "")), 
        family = "binomial", data = dataset)
}
rm(i)

# Generate AIC table
aic.table <- AICc(m[[1]], m[[2]], m[[3]], m[[4]], m[[5]], m[[6]], m[[7]], 
    m[[8]], m[[9]], m[[10]], m[[11]])

rm(m)

rownames(aic.table) <- var

aic.table$delta <- round((aic.table$AICc - min(aic.table$AICc)), digits = 4)
aic.table <- aic.table[order(aic.table$delta), ]

aic.table$var <- substring(rownames(aic.table), 0, 4)
aic.table$scale <- substring(rownames(aic.table), 
    nchar(rownames(aic.table))-2, 
    nchar(rownames(aic.table)))
aic.table$spp <- as.factor(attr(dataset$sampleid, "spp"))
aic.table$samples <- as.factor(attr(dataset$sampleid, "samples"))

aic.table <- aic.table[c("spp", "samples", "var", "scale", "AICc", "delta", "df")]

# Write table
write.csv(aic.table, 
    file = paste("./results/aic/", 
        attr(dataset$sampleid, "spp"), 
        "-aic-", 
        aic.table$var[1], 
        ".csv",
        sep = ""))

return(aic.table)
}

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Loop through the AIC comparison function for each sample size dataset
for (i in 1:length(dataset.list)) {
    dataset <- as.data.frame(dataset.list[i])

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Building density
var <- c("bldg060", "bldg090", "bldg120", "bldg150", "bldg180", "bldg210", 
    "bldg240", "bldg270", "bldg300", "bldg330", "bldg360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Road density
var <- c("road060", "road090", "road120", "road150", "road180", "road210", 
    "road240", "road270", "road300", "road330", "road360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Tree canopy cover
var <- c("ptcc060", "ptcc090", "ptcc120", "ptcc150", "ptcc180", "ptcc210", 
    "ptcc240", "ptcc240", "ptcc240", "ptcc240", "ptcc240")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Developed
var <- c("pdev060", "pdev090", "pdev120", "pdev150", "pdev180", "pdev210", 
    "pdev240", "pdev270", "pdev300", "pdev330", "pdev360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Forested
var <- c("pfor060", "pfor090", "pfor120", "pfor150", "pfor180", "pfor210", 
    "pfor240", "pfor270", "pfor300", "pfor330", "pfor360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Grass/sand
var <- c("pgra060", "pgra090", "pgra120", "pgra150", "pgra180", "pgra210", 
    "pgra240", "pgra270", "pgra300", "pgra330", "pgra360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Wetland
var <- c("pwet060", "pwet090", "pwet120", "pwet150", "pwet180", "pwet210", 
    "pwet240", "pwet270", "pwet300", "pwet330", "pwet360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

}
rm(i, dataset, dataset.list)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## Combine AIC tables
epfu.aic.combined <- data.frame(rbind(
    epfu.aic.bldg, 
    epfu.aic.road, 
    epfu.aic.pdev, 
    epfu.aic.pfor, 
    epfu.aic.pgra, 
    epfu.aic.pwet
    )
)

myse.aic.combined <- data.frame(rbind(
    myse.aic.bldg, 
    myse.aic.road, 
    myse.aic.pdev, 
    myse.aic.pfor, 
    myse.aic.pgra, 
    myse.aic.pwet
    )
)

## Save
save(epfu.aic.combined, file = "./data/epfu-aic-combined.Rdata")
save(myse.aic.combined, file = "./data/myse-aic-combined.Rdata")
