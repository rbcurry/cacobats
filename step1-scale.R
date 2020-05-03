# Data sources
roost <- read.csv("./data/roost.csv", 
  header = T, 
  sep = ",", 
  dec = ".",
  stringsAsFactors = F)

# Scale variables
roost$dfresh <- scale(roost$dfresh)
roost$dmarine <- scale(roost$dmarine)
roost$dvernal <- scale(roost$dvernal)
roost$dforcore <- scale(roost$dforcore)

roost$elev <- scale(roost$elev)
roost$slope <- scale(roost$slope)
roost$aspect <- scale(roost$aspect)

roost$bldg060 <- scale(roost$bldg060)
roost$bldg090 <- scale(roost$bldg090)
roost$bldg120 <- scale(roost$bldg120)
roost$bldg150 <- scale(roost$bldg150)
roost$bldg180 <- scale(roost$bldg180)
roost$bldg210 <- scale(roost$bldg210)
roost$bldg240 <- scale(roost$bldg240)
roost$bldg270 <- scale(roost$bldg270)
roost$bldg300 <- scale(roost$bldg300)
roost$bldg330 <- scale(roost$bldg330)
roost$bldg360 <- scale(roost$bldg360)

roost$road060 <- scale(roost$road060)
roost$road090 <- scale(roost$road090)
roost$road120 <- scale(roost$road120)
roost$road150 <- scale(roost$road150)
roost$road180 <- scale(roost$road180)
roost$road210 <- scale(roost$road210)
roost$road240 <- scale(roost$road240)
roost$road270 <- scale(roost$road270)
roost$road300 <- scale(roost$road300)
roost$road330 <- scale(roost$road330)
roost$road360 <- scale(roost$road360)

roost$ptcc060 <- scale(roost$ptcc060) 
roost$ptcc090 <- scale(roost$ptcc090)
roost$ptcc120 <- scale(roost$ptcc120)
roost$ptcc150 <- scale(roost$ptcc150)
roost$ptcc180 <- scale(roost$ptcc180)
roost$ptcc210 <- scale(roost$ptcc210)
roost$ptcc240 <- scale(roost$ptcc240)
roost$ptcc270 <- scale(roost$ptcc270)
roost$ptcc300 <- scale(roost$ptcc300)
roost$ptcc330 <- scale(roost$ptcc330)
roost$ptcc360 <- scale(roost$ptcc360)

roost$pdev060 <- scale(roost$pdev060)
roost$pdev090 <- scale(roost$pdev090)
roost$pdev120 <- scale(roost$pdev120)
roost$pdev150 <- scale(roost$pdev150)
roost$pdev180 <- scale(roost$pdev180)
roost$pdev210 <- scale(roost$pdev210)
roost$pdev240 <- scale(roost$pdev240)
roost$pdev270 <- scale(roost$pdev270)
roost$pdev300 <- scale(roost$pdev300)
roost$pdev330 <- scale(roost$pdev330)
roost$pdev360 <- scale(roost$pdev360)

roost$pfor060 <- scale(roost$pfor060)
roost$pfor090 <- scale(roost$pfor090)
roost$pfor120 <- scale(roost$pfor120)
roost$pfor150 <- scale(roost$pfor150)
roost$pfor180 <- scale(roost$pfor180)
roost$pfor210 <- scale(roost$pfor210)
roost$pfor240 <- scale(roost$pfor240)
roost$pfor270 <- scale(roost$pfor270)
roost$pfor300 <- scale(roost$pfor300)
roost$pfor330 <- scale(roost$pfor330)
roost$pfor360 <- scale(roost$pfor360)

roost$pgra060 <- scale(roost$pgra060)
roost$pgra090 <- scale(roost$pgra090)
roost$pgra120 <- scale(roost$pgra120)
roost$pgra150 <- scale(roost$pgra150)
roost$pgra180 <- scale(roost$pgra180)
roost$pgra210 <- scale(roost$pgra210)
roost$pgra240 <- scale(roost$pgra240)
roost$pgra270 <- scale(roost$pgra270)
roost$pgra300 <- scale(roost$pgra300)
roost$pgra330 <- scale(roost$pgra330)
roost$pgra360 <- scale(roost$pgra360)

roost$pwet060 <- scale(roost$pwet060)
roost$pwet090 <- scale(roost$pwet090)
roost$pwet120 <- scale(roost$pwet120)
roost$pwet150 <- scale(roost$pwet150)
roost$pwet180 <- scale(roost$pwet180)
roost$pwet210 <- scale(roost$pwet210)
roost$pwet240 <- scale(roost$pwet240)
roost$pwet270 <- scale(roost$pwet270)
roost$pwet300 <- scale(roost$pwet300)
roost$pwet330 <- scale(roost$pwet330)
roost$pwet360 <- scale(roost$pwet360)

# Define avector function
as.data.frame.avector <- as.data.frame.vector

`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}

# Apply avector to roost dataset
roost <- data.frame(
  lapply(roost, function(x) {
    structure(x, class = c("avector", class(x)))
  })
)

# Add variable descriptions
attr(roost$dfresh, "desc") <- "Distance to fresh water"
attr(roost$dmarine, "desc") <- "Distance to marine shore"
attr(roost$dvernal, "desc") <- "Distance to vernal pool"
attr(roost$dforcore, "desc") <- "Distance to forest core boundary"

attr(roost$elev, "desc") <- "Elevation"
attr(roost$slope, "desc") <- "Slope"
attr(roost$aspect, "desc") <- "Topographic aspect"

attr(roost$bldg060, "desc") <- "Building density within 60 m"
attr(roost$bldg090, "desc") <- "Building density within 90 m"
attr(roost$bldg120, "desc") <- "Building density within 120 m"
attr(roost$bldg150, "desc") <- "Building density within 150 m"
attr(roost$bldg180, "desc") <- "Building density within 180 m"
attr(roost$bldg210, "desc") <- "Building density within 210 m"
attr(roost$bldg240, "desc") <- "Building density within 240 m"
attr(roost$bldg270, "desc") <- "Building density within 270 m"
attr(roost$bldg300, "desc") <- "Building density within 300 m"
attr(roost$bldg330, "desc") <- "Building density within 330 m"
attr(roost$bldg360, "desc") <- "Building density within 360 m"

attr(roost$road060, "desc") <- "Road density within 60 m"
attr(roost$road090, "desc") <- "Road density within 90 m"
attr(roost$road120, "desc") <- "Road density within 120 m"
attr(roost$road150, "desc") <- "Road density within 150 m"
attr(roost$road180, "desc") <- "Road density within 180 m"
attr(roost$road210, "desc") <- "Road density within 210 m"
attr(roost$road240, "desc") <- "Road density within 240 m"
attr(roost$road270, "desc") <- "Road density within 270 m"
attr(roost$road300, "desc") <- "Road density within 300 m"
attr(roost$road330, "desc") <- "Road density within 330 m"
attr(roost$road360, "desc") <- "Road density within 360 m"

attr(roost$ptcc060, "desc") <- "Percent tree canopy cover within 60 m"
attr(roost$ptcc090, "desc") <- "Percent tree canopy cover within 90 m"
attr(roost$ptcc120, "desc") <- "Percent tree canopy cover within 120 m"
attr(roost$ptcc150, "desc") <- "Percent tree canopy cover within 150 m"
attr(roost$ptcc180, "desc") <- "Percent tree canopy cover within 180 m"
attr(roost$ptcc210, "desc") <- "Percent tree canopy cover within 210 m"
attr(roost$ptcc240, "desc") <- "Percent tree canopy cover within 240 m"
attr(roost$ptcc270, "desc") <- "Percent tree canopy cover within 270 m"
attr(roost$ptcc300, "desc") <- "Percent tree canopy cover within 300 m"
attr(roost$ptcc330, "desc") <- "Percent tree canopy cover within 330 m"
attr(roost$ptcc360, "desc") <- "Percent tree canopy cover within 360 m"

attr(roost$pdev060, "desc") <- "Proportion of developed land within 60 m"
attr(roost$pdev090, "desc") <- "Proportion of developed land within 90 m"
attr(roost$pdev120, "desc") <- "Proportion of developed land within 120 m"
attr(roost$pdev150, "desc") <- "Proportion of developed land within 150 m"
attr(roost$pdev180, "desc") <- "Proportion of developed land within 180 m"
attr(roost$pdev210, "desc") <- "Proportion of developed land within 210 m"
attr(roost$pdev240, "desc") <- "Proportion of developed land within 240 m"
attr(roost$pdev270, "desc") <- "Proportion of developed land within 270 m"
attr(roost$pdev300, "desc") <- "Proportion of developed land within 300 m"
attr(roost$pdev330, "desc") <- "Proportion of developed land within 330 m"
attr(roost$pdev360, "desc") <- "Proportion of developed land within 360 m"

attr(roost$pfor060, "desc") <- "Proportion of forest within 60 m"
attr(roost$pfor090, "desc") <- "Proportion of forest within 90 m"
attr(roost$pfor120, "desc") <- "Proportion of forest within 120 m"
attr(roost$pfor150, "desc") <- "Proportion of forest within 150 m"
attr(roost$pfor180, "desc") <- "Proportion of forest within 180 m"
attr(roost$pfor210, "desc") <- "Proportion of forest within 210 m"
attr(roost$pfor240, "desc") <- "Proportion of forest within 240 m"
attr(roost$pfor270, "desc") <- "Proportion of forest within 270 m"
attr(roost$pfor300, "desc") <- "Proportion of forest within 300 m"
attr(roost$pfor330, "desc") <- "Proportion of forest within 330 m"
attr(roost$pfor360, "desc") <- "Proportion of forest within 360 m"

attr(roost$pgra060, "desc") <- "Proportion of sand/grassland within 60 m"
attr(roost$pgra090, "desc") <- "Proportion of sand/grassland within 90 m"
attr(roost$pgra120, "desc") <- "Proportion of sand/grassland within 120 m"
attr(roost$pgra150, "desc") <- "Proportion of sand/grassland within 150 m"
attr(roost$pgra180, "desc") <- "Proportion of sand/grassland within 180 m"
attr(roost$pgra210, "desc") <- "Proportion of sand/grassland within 210 m"
attr(roost$pgra240, "desc") <- "Proportion of sand/grassland within 240 m"
attr(roost$pgra270, "desc") <- "Proportion of sand/grassland within 270 m"
attr(roost$pgra300, "desc") <- "Proportion of sand/grassland within 300 m"
attr(roost$pgra330, "desc") <- "Proportion of sand/grassland within 330 m"
attr(roost$pgra360, "desc") <- "Proportion of sand/grassland within 360 m"

attr(roost$pwet060, "desc") <- "Proportion of wetland within 60 m"
attr(roost$pwet090, "desc") <- "Proportion of wetland within 90 m"
attr(roost$pwet120, "desc") <- "Proportion of wetland within 120 m"
attr(roost$pwet150, "desc") <- "Proportion of wetland within 150 m"
attr(roost$pwet180, "desc") <- "Proportion of wetland within 180 m"
attr(roost$pwet210, "desc") <- "Proportion of wetland within 210 m"
attr(roost$pwet240, "desc") <- "Proportion of wetland within 240 m"
attr(roost$pwet270, "desc") <- "Proportion of wetland within 270 m"
attr(roost$pwet300, "desc") <- "Proportion of wetland within 300 m"
attr(roost$pwet330, "desc") <- "Proportion of wetland within 330 m"
attr(roost$pwet360, "desc") <- "Proportion of wetland within 360 m"

# Save
save(roost, file = "./data/roost.Rdata")

# Split into separate datasets for each species
epfu <- roost[roost$species == "EPFU", ]

for (i in 1:length(epfu)) {
  attr(epfu[[i]], "spp") <- "epfu"
  attr(epfu[[i]], "samples") <- 100
}
rm(i)

myse <- roost[roost$species == "MYSE", ]

for (i in 1:length(myse)) {
  attr(myse[[i]], "spp") <- "myse"
  attr(myse[[i]], "samples") <- 100
}
rm(i)

# Save
save(epfu, file = "./data/epfu.Rdata")
save(myse, file = "./data/myse.Rdata")

# Cleanup
rm(roost, epfu, myse)

