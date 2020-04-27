# Data sources
load("./data/epfu-aic-combined-alt.Rdata")

library(ggplot2)

# Test config
aic.table <- epfu.aic.combined.alt[epfu.aic.combined.alt$var == "pdev", ]
varname <- "NETH_Dev"
species <- "EPFU"

# Set figure dimensions
xdim <- 6.5
ydim <- 4

# Arrange AIC table
aic.table <- aic.table[order(aic.table$samples, aic.table$scale), ]

# Create data frame
df <- data.frame(
  s = aic.table$samples,
  x = as.numeric(aic.table$scale),
  y = aic.table$delta
)

# Colorblind-friendly palette
cbpalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", 
  "#0072B2", "#D55E00", "#CC79A7", "#000000", "#000000", "#000000")

# Plot
ggplot(df) + 

    geom_line(aes(x = df$x, y = df$y, group = df$s, color = df$s), show.legend = T) + 

    ggtitle(
        label = paste("Scale of effect:", varname), 
        subtitle = paste("Best performance for", species, "when measured at", df$x[which(df$y == min(df$y))], "m")) + 

    geom_text(label = species, aes(x = 210, y = 0.90*ceiling(max(df$y))), size = 8) +

    scale_x_continuous(
        name = "Measurement scale (m)", 
        breaks = df$x, 
        minor_breaks = seq(min(df$x), max(df$x), 10), 
        limits = c(min(df$x), max(df$x))) + 

    scale_y_continuous(
        name = "Delta AIC(c)", 
        breaks = seq(trunc(min(df$y)), ceiling(max(df$y)), 1), 
        minor_breaks = seq(trunc(min(df$y)), ceiling(max(df$y)), 0.5), 
        limits = c(floor(min(df$y)), ceiling(max(df$y)))) + 

    scale_color_manual(paste("Samples", sep = ""), 
        values = cbpalette) +

    theme_bw() + 

    theme(panel.grid.minor = element_blank()) + 

    theme(plot.title = element_text(hjust = 0.5)) + 
    
    theme(plot.subtitle = element_text(hjust = 0.5)) + 
    
    theme(legend.title.align = 0.5)
