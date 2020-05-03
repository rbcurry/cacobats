# Scale-of-effect plots
soeplot <- function (aic.table, title, species) {

library(ggplot2)

# Create working data frame
aic.table <- aic.table[order(aic.table$samples, aic.table$scale), ]

df <- data.frame(
    s = aic.table$samples,
    x = as.numeric(aic.table$scale),
    y = aic.table$delta
)

# Plot
soeplot <- ggplot(df) + 

    geom_line(
        aes(x = x, y = y, group = s, color = s), 
        show.legend = T) + 

    ggtitle(
        label = paste("Scale of effect: ", title, " (", toupper(species), ")", sep = ""), 
        subtitle = paste("Median minimum AIC(c) =", 
            median(df$x[df$y == 0]), "m")) + 

    scale_x_continuous(
        name = "Measured area diameter (m)", 
        breaks = seq(60, 360, 30), 
        minor_breaks = seq(min(df$x), 360, 10), 
        limits = c(min(df$x), 360)) + 

    scale_y_continuous(
        name = "Delta AIC(c)", 
        breaks = seq(trunc(min(df$y)), ceiling(max(df$y)), 1), 
        minor_breaks = seq(trunc(min(df$y)), ceiling(max(df$y)), 0.5), 
        limits = c(floor(min(df$y)), ceiling(max(df$y)))) + 

    scale_color_manual(paste("Samples", sep = ""), 
        values = rep("#000000", length(unique(df$s)))) +

    theme_bw() + 

    theme(panel.grid.minor = element_blank()) + 

    theme(plot.title = element_text(hjust = 0.5)) + 
    
    theme(plot.subtitle = element_text(hjust = 0.5)) + 
    
    theme(legend.title.align = 0.5)

# Save
ggsave(
    filename = paste("./results/plots/", species, "-soe-", 
      aic.table$var[1], ".png", sep = ""), 
  plot = soeplot,
  device = "png", 
  width = 6.5, 
  height = 4, 
  units = c("in")
)

return(soeplot)
}
