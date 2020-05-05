# Ben Bolker's unscale function:
# scale variable x using center/scale attributes of variable y
unscale <- function(x,y) {
  scale(x,
        center=attr(y,"scaled:center"),
        scale=attr(y,"scaled:scale"))
        }
