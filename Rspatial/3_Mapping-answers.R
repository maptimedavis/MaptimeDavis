# Ex 1

v0 <- readRDS('TZA_adm0.rds')
plot(v0, border = "red", lwd = 3, col = 'grey')
title(main = "Tanzania national boundary", sub = "source GADM")


#################################################################################################################

# Ex 2

v2 <- readRDS('TZA_adm2.rds')
# Each region should have different color; we will use the color ramp
n <- length(v2$NAME_2)
plot(v2, col=rainbow(n), main = 'Administrative boundary: level 2')
# you can change the color ramp based on your choice

#################################################################################################################

# Ex 3

plot(v0, border = "grey", lwd = 2,  axes = TRUE)
plot(rv, col='lightblue', add = TRUE)
title(main = "Tanzania rivers")
# Add some more details
legend('bottomleft', legend = 'River', lty = 1, lwd = 2, col = 'lightblue', bty = "n")

#################################################################################################################

# Ex 5

brks <- seq(2,7,0.1)
spplot(ph,
       at = round(brks, digits=2),
       col.regions = cm.colors(length(brks)), colorkey = list(space = "bottom"), 
       main = list(label="Soil pH",  cex = 1))

#################################################################################################################
# Ex 6

pols1 <- list("sp.lines", as(v0, 'SpatialLines'), col = gray(0.4), lwd = 0.5)
pols2 <- list("sp.polygons", as(lake, 'SpatialPolygons'), fill = 'skyblue1',col="transparent", first = FALSE)
pols3 <- list("sp.polygons", as(protarea, 'SpatialPolygons'), fill = 'transparent',col="darkgreen", first = FALSE)

brks <- seq(0,60,0.5)
spplot(orc,
       sp.layout=list(pols1, pols2, pols3),
       at = round(brks, digits=2),
       col.regions = rev(terrain.colors(length(brks))), colorkey = list(space = "bottom"), 
       main = list(label="Soil organic carbon content",  cex = 1))
