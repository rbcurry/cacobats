# Data sources
load("./data/epfu-alt.Rdata")
load("./data/myse-alt.Rdata")

dataset.list <- list(
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

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

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
        "-", 
        attr(dataset$sampleid, "samples"), 
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
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Road density
var <- c("road060", "road090", "road120", "road150", "road180", "road210", 
    "road240", "road270", "road300", "road330", "road360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Tree canopy cover
var <- c("ptcc060", "ptcc090", "ptcc120", "ptcc150", "ptcc180", "ptcc210", 
    "ptcc240", "ptcc270", "ptcc300", "ptcc330", "ptcc360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Developed
var <- c("pdev060", "pdev090", "pdev120", "pdev150", "pdev180", "pdev210", 
    "pdev240", "pdev270", "pdev300", "pdev330", "pdev360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Forested
var <- c("pfor060", "pfor090", "pfor120", "pfor150", "pfor180", "pfor210", 
    "pfor240", "pfor270", "pfor300", "pfor330", "pfor360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Grass/sand
var <- c("pgra060", "pgra090", "pgra120", "pgra150", "pgra180", "pgra210", 
    "pgra240", "pgra270", "pgra300", "pgra330", "pgra360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Wetland
var <- c("pwet060", "pwet090", "pwet120", "pwet150", "pwet180", "pwet210", 
    "pwet240", "pwet270", "pwet300", "pwet330", "pwet360")

aic.table <- aic.compare(var)

aic.table.name <- paste(attr(dataset$sampleid, "spp"), ".aic.", 
    aic.table$var[1], ".", attr(dataset$sampleid, "samples"), sep = "")

assign(aic.table.name, aic.table)

rm(var, aic.table, aic.table.name)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

}
rm(i, dataset, dataset.list)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## Combine AIC tables
epfu.aic.combined.alt <- data.frame(rbind(
    epfu.aic.bldg.100, 
    epfu.aic.bldg.90, 
    epfu.aic.bldg.80, 
    epfu.aic.bldg.70, 
    epfu.aic.bldg.60, 
    epfu.aic.bldg.50, 
    epfu.aic.bldg.40, 
    epfu.aic.bldg.30, 
    epfu.aic.bldg.20, 
    epfu.aic.bldg.10, 
    epfu.aic.bldg.1, 
    epfu.aic.road.100, 
    epfu.aic.road.90, 
    epfu.aic.road.80, 
    epfu.aic.road.70, 
    epfu.aic.road.60, 
    epfu.aic.road.50, 
    epfu.aic.road.40, 
    epfu.aic.road.30, 
    epfu.aic.road.20, 
    epfu.aic.road.10, 
    epfu.aic.road.1, 
    epfu.aic.pdev.100, 
    epfu.aic.pdev.90, 
    epfu.aic.pdev.80, 
    epfu.aic.pdev.70, 
    epfu.aic.pdev.60, 
    epfu.aic.pdev.50, 
    epfu.aic.pdev.40, 
    epfu.aic.pdev.30, 
    epfu.aic.pdev.20, 
    epfu.aic.pdev.10, 
    epfu.aic.pdev.1, 
    epfu.aic.pfor.100, 
    epfu.aic.pfor.90, 
    epfu.aic.pfor.80, 
    epfu.aic.pfor.70, 
    epfu.aic.pfor.60, 
    epfu.aic.pfor.50, 
    epfu.aic.pfor.40, 
    epfu.aic.pfor.30, 
    epfu.aic.pfor.20, 
    epfu.aic.pfor.10, 
    epfu.aic.pfor.1, 
    epfu.aic.pgra.100, 
    epfu.aic.pgra.90, 
    epfu.aic.pgra.80, 
    epfu.aic.pgra.70, 
    epfu.aic.pgra.60, 
    epfu.aic.pgra.50, 
    epfu.aic.pgra.40, 
    epfu.aic.pgra.30, 
    epfu.aic.pgra.20, 
    epfu.aic.pgra.10, 
    epfu.aic.pgra.1, 
    epfu.aic.pwet.100, 
    epfu.aic.pwet.90, 
    epfu.aic.pwet.80, 
    epfu.aic.pwet.70, 
    epfu.aic.pwet.60, 
    epfu.aic.pwet.50, 
    epfu.aic.pwet.40, 
    epfu.aic.pwet.30, 
    epfu.aic.pwet.20, 
    epfu.aic.pwet.10, 
    epfu.aic.pwet.1
    )
)

myse.aic.combined.alt <- data.frame(rbind(
    myse.aic.bldg.100, 
    myse.aic.bldg.90, 
    myse.aic.bldg.80, 
    myse.aic.bldg.70, 
    myse.aic.bldg.60, 
    myse.aic.bldg.50, 
    myse.aic.bldg.40, 
    myse.aic.bldg.30, 
    myse.aic.bldg.20, 
    myse.aic.bldg.10, 
    myse.aic.bldg.1, 
    myse.aic.road.100, 
    myse.aic.road.90, 
    myse.aic.road.80, 
    myse.aic.road.70, 
    myse.aic.road.60, 
    myse.aic.road.50, 
    myse.aic.road.40, 
    myse.aic.road.30, 
    myse.aic.road.20, 
    myse.aic.road.10, 
    myse.aic.road.1, 
    myse.aic.pdev.100, 
    myse.aic.pdev.90, 
    myse.aic.pdev.80, 
    myse.aic.pdev.70, 
    myse.aic.pdev.60, 
    myse.aic.pdev.50, 
    myse.aic.pdev.40, 
    myse.aic.pdev.30, 
    myse.aic.pdev.20, 
    myse.aic.pdev.10, 
    myse.aic.pdev.1, 
    myse.aic.pfor.100, 
    myse.aic.pfor.90, 
    myse.aic.pfor.80, 
    myse.aic.pfor.70, 
    myse.aic.pfor.60, 
    myse.aic.pfor.50, 
    myse.aic.pfor.40, 
    myse.aic.pfor.30, 
    myse.aic.pfor.20, 
    myse.aic.pfor.10, 
    myse.aic.pfor.1, 
    myse.aic.pgra.100, 
    myse.aic.pgra.90, 
    myse.aic.pgra.80, 
    myse.aic.pgra.70, 
    myse.aic.pgra.60, 
    myse.aic.pgra.50, 
    myse.aic.pgra.40, 
    myse.aic.pgra.30, 
    myse.aic.pgra.20, 
    myse.aic.pgra.10, 
    myse.aic.pgra.1, 
    myse.aic.pwet.100, 
    myse.aic.pwet.90, 
    myse.aic.pwet.80, 
    myse.aic.pwet.70, 
    myse.aic.pwet.60, 
    myse.aic.pwet.50, 
    myse.aic.pwet.40, 
    myse.aic.pwet.30, 
    myse.aic.pwet.20, 
    myse.aic.pwet.10, 
    myse.aic.pwet.1
    )
)

## Save
save(epfu.aic.combined.alt, file = "./data/epfu-aic-combined-alt.Rdata")
save(myse.aic.combined.alt, file = "./data/myse-aic-combined-alt.Rdata")

## Cleanup
rm(
    epfu.aic.bldg.100,
	epfu.aic.bldg.90,
	epfu.aic.bldg.80,
	epfu.aic.bldg.70,
	epfu.aic.bldg.60,
	epfu.aic.bldg.50,
	epfu.aic.bldg.40,
	epfu.aic.bldg.30,
	epfu.aic.bldg.20,
	epfu.aic.bldg.10,
	epfu.aic.bldg.1,
	epfu.aic.road.100,
	epfu.aic.road.90,
	epfu.aic.road.80,
	epfu.aic.road.70,
	epfu.aic.road.60,
	epfu.aic.road.50,
	epfu.aic.road.40,
	epfu.aic.road.30,
	epfu.aic.road.20,
	epfu.aic.road.10,
	epfu.aic.road.1,
	epfu.aic.pdev.100,
	epfu.aic.pdev.90,
	epfu.aic.pdev.80,
	epfu.aic.pdev.70,
	epfu.aic.pdev.60,
	epfu.aic.pdev.50,
	epfu.aic.pdev.40,
	epfu.aic.pdev.30,
	epfu.aic.pdev.20,
	epfu.aic.pdev.10,
	epfu.aic.pdev.1,
	epfu.aic.pfor.100,
	epfu.aic.pfor.90,
	epfu.aic.pfor.80,
	epfu.aic.pfor.70,
	epfu.aic.pfor.60,
	epfu.aic.pfor.50,
	epfu.aic.pfor.40,
	epfu.aic.pfor.30,
	epfu.aic.pfor.20,
	epfu.aic.pfor.10,
	epfu.aic.pfor.1,
	epfu.aic.pgra.100,
	epfu.aic.pgra.90,
	epfu.aic.pgra.80,
	epfu.aic.pgra.70,
	epfu.aic.pgra.60,
	epfu.aic.pgra.50,
	epfu.aic.pgra.40,
	epfu.aic.pgra.30,
	epfu.aic.pgra.20,
	epfu.aic.pgra.10,
	epfu.aic.pgra.1,
	epfu.aic.pwet.100,
	epfu.aic.pwet.90,
	epfu.aic.pwet.80,
	epfu.aic.pwet.70,
	epfu.aic.pwet.60,
	epfu.aic.pwet.50,
	epfu.aic.pwet.40,
	epfu.aic.pwet.30,
	epfu.aic.pwet.20,
	epfu.aic.pwet.10,
	epfu.aic.pwet.1
)

rm(
    myse.aic.bldg.100,
	myse.aic.bldg.90,
	myse.aic.bldg.80,
	myse.aic.bldg.70,
	myse.aic.bldg.60,
	myse.aic.bldg.50,
	myse.aic.bldg.40,
	myse.aic.bldg.30,
	myse.aic.bldg.20,
	myse.aic.bldg.10,
	myse.aic.bldg.1,
	myse.aic.road.100,
	myse.aic.road.90,
	myse.aic.road.80,
	myse.aic.road.70,
	myse.aic.road.60,
	myse.aic.road.50,
	myse.aic.road.40,
	myse.aic.road.30,
	myse.aic.road.20,
	myse.aic.road.10,
	myse.aic.road.1,
	myse.aic.pdev.100,
	myse.aic.pdev.90,
	myse.aic.pdev.80,
	myse.aic.pdev.70,
	myse.aic.pdev.60,
	myse.aic.pdev.50,
	myse.aic.pdev.40,
	myse.aic.pdev.30,
	myse.aic.pdev.20,
	myse.aic.pdev.10,
	myse.aic.pdev.1,
	myse.aic.pfor.100,
	myse.aic.pfor.90,
	myse.aic.pfor.80,
	myse.aic.pfor.70,
	myse.aic.pfor.60,
	myse.aic.pfor.50,
	myse.aic.pfor.40,
	myse.aic.pfor.30,
	myse.aic.pfor.20,
	myse.aic.pfor.10,
	myse.aic.pfor.1,
	myse.aic.pgra.100,
	myse.aic.pgra.90,
	myse.aic.pgra.80,
	myse.aic.pgra.70,
	myse.aic.pgra.60,
	myse.aic.pgra.50,
	myse.aic.pgra.40,
	myse.aic.pgra.30,
	myse.aic.pgra.20,
	myse.aic.pgra.10,
	myse.aic.pgra.1,
	myse.aic.pwet.100,
	myse.aic.pwet.90,
	myse.aic.pwet.80,
	myse.aic.pwet.70,
	myse.aic.pwet.60,
	myse.aic.pwet.50,
	myse.aic.pwet.40,
	myse.aic.pwet.30,
	myse.aic.pwet.20,
	myse.aic.pwet.10,
	myse.aic.pwet.1
)
