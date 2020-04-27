# Data sources
load("./data/epfu.Rdata")
load("./data/myse.Rdata")

load("./data/epfu-aic-combined-alt.Rdata")
load("./data/myse-aic-combined-alt.Rdata")

## Scale-of-effect plots
source("./functions/soeplot.R")

soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "bldg", ], "Bldg", "EPFU")
soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "road", ], "Road", "EPFU")
#soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "ptcc", ], "TCC", "EPFU")
soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "pdev", ], "NETH_Dev", "EPFU")
soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "pfor", ], "NETH_For", "EPFU")
soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "pgra", ], "NETH_Gra", "EPFU")
soeplot(epfu.aic.combined.alt[epfu.aic.combined.alt$var == "pwet", ], "NETH_Wet", "EPFU")

soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "bldg", ], "Bldg", "MYSE")
soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "road", ], "Road", "MYSE")
#soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "ptcc", ], "TCC", "MYSE")
soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "pdev", ], "NETH_Dev", "MYSE")
soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "pfor", ], "NETH_For", "MYSE")
soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "pgra", ], "NETH_Gra", "MYSE")
soeplot(myse.aic.combined.alt[myse.aic.combined.alt$var == "pwet", ], "NETH_Wet", "MYSE")

