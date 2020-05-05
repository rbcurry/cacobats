# Data sources
load("./data/epfu2.Rdata")
load("./data/epfu-raw.Rdata")

load("./data/myse2.Rdata")
load("./data/myse-raw.Rdata")

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Unscale EPFU

# Local
epfu$dfresh <- epfu$dfresh * 
    attr(epfu$dfresh, 'scaled:scale') + 
    attr(epfu$dfresh, 'scaled:center')

all.equal(as.numeric(epfu$dfresh), epfu.raw$dfresh)

epfu$dmarine <- epfu$dmarine * 
    attr(epfu$dmarine, 'scaled:scale') + 
    attr(epfu$dmarine, 'scaled:center')

all.equal(as.numeric(epfu$dmarine), epfu.raw$dmarine)

epfu$dforcore <- epfu$dforcore * 
    attr(epfu$dforcore, 'scaled:scale') + 
    attr(epfu$dforcore, 'scaled:center')

all.equal(as.numeric(epfu$dforcore), epfu.raw$dforcore)

epfu$elev <- epfu$elev * 
    attr(epfu$elev, 'scaled:scale') + 
    attr(epfu$elev, 'scaled:center')

all.equal(as.numeric(epfu$elev), epfu.raw$elev)

epfu$slope <- epfu$slope * 
    attr(epfu$slope, 'scaled:scale') + 
    attr(epfu$slope, 'scaled:center')

all.equal(as.numeric(epfu$slope), epfu.raw$slope)

epfu$aspect <- epfu$aspect * 
    attr(epfu$aspect, 'scaled:scale') + 
    attr(epfu$aspect, 'scaled:center')

all.equal(as.numeric(epfu$aspect), epfu.raw$aspect)

# Landscape
epfu$road <- epfu$road * 
    attr(epfu$road, 'scaled:scale') + 
    attr(epfu$road, 'scaled:center')

all.equal(as.numeric(epfu$road), epfu.raw$road180)

epfu$ptcc <- epfu$ptcc * 
    attr(epfu$ptcc, 'scaled:scale') + 
    attr(epfu$ptcc, 'scaled:center')

all.equal(as.numeric(epfu$ptcc), epfu.raw$ptcc240)

epfu$pgra <- epfu$pgra * 
    attr(epfu$pgra, 'scaled:scale') + 
    attr(epfu$pgra, 'scaled:center')

all.equal(as.numeric(epfu$pgra), epfu.raw$pgra300)

epfu$pwet <- epfu$pwet * 
    attr(epfu$pwet, 'scaled:scale') + 
    attr(epfu$pwet, 'scaled:center')

all.equal(as.numeric(epfu$pwet), epfu.raw$pwet060)

# Save and cleanup
save(epfu, file = "./data/epfu3.Rdata")
rm(epfu.raw)

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Unscale MYSE

# Local
myse$dfresh <- myse$dfresh * 
    attr(myse$dfresh, 'scaled:scale') + 
    attr(myse$dfresh, 'scaled:center')

all.equal(as.numeric(myse$dfresh), myse.raw$dfresh)

myse$dmarine <- myse$dmarine * 
    attr(myse$dmarine, 'scaled:scale') + 
    attr(myse$dmarine, 'scaled:center')

all.equal(as.numeric(myse$dmarine), myse.raw$dmarine)

myse$dforcore <- myse$dforcore * 
    attr(myse$dforcore, 'scaled:scale') + 
    attr(myse$dforcore, 'scaled:center')

all.equal(as.numeric(myse$dforcore), myse.raw$dforcore)

myse$elev <- myse$elev * 
    attr(myse$elev, 'scaled:scale') + 
    attr(myse$elev, 'scaled:center')

all.equal(as.numeric(myse$elev), myse.raw$elev)

myse$slope <- myse$slope * 
    attr(myse$slope, 'scaled:scale') + 
    attr(myse$slope, 'scaled:center')

all.equal(as.numeric(myse$slope), myse.raw$slope)

myse$aspect <- myse$aspect * 
    attr(myse$aspect, 'scaled:scale') + 
    attr(myse$aspect, 'scaled:center')

all.equal(as.numeric(myse$aspect), myse.raw$aspect)

# Landscape
myse$bldg <- myse$bldg * 
    attr(myse$bldg, 'scaled:scale') + 
    attr(myse$bldg, 'scaled:center')

all.equal(as.numeric(myse$bldg), myse.raw$bldg060)

myse$road <- myse$road * 
    attr(myse$road, 'scaled:scale') + 
    attr(myse$road, 'scaled:center')

all.equal(as.numeric(myse$road), myse.raw$road090)

myse$ptcc <- myse$ptcc * 
    attr(myse$ptcc, 'scaled:scale') + 
    attr(myse$ptcc, 'scaled:center')

all.equal(as.numeric(myse$ptcc), myse.raw$ptcc150)

myse$pfor <- myse$pfor * 
    attr(myse$pfor, 'scaled:scale') + 
    attr(myse$pfor, 'scaled:center')

all.equal(as.numeric(myse$pfor), myse.raw$pfor150)

myse$pgra <- myse$pgra * 
    attr(myse$pgra, 'scaled:scale') + 
    attr(myse$pgra, 'scaled:center')

all.equal(as.numeric(myse$pgra), myse.raw$pgra090)


myse$pwet <- myse$pwet * 
    attr(myse$pwet, 'scaled:scale') + 
    attr(myse$pwet, 'scaled:center')

all.equal(as.numeric(myse$pwet), myse.raw$pwet360)

# Save and cleanup
save(myse, file = "./data/myse3.Rdata")
rm(myse.raw)
