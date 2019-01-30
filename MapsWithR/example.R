library(mapview)
library(sf)



#Make a Point for Maptime
# https://www.openstreetmap.org/#map=18/38.53956/-121.74847
pt <- st_sfc(st_point(c(-121.74847, 38.53956)))
proj <- 4326
maptime <- st_sf(title="Maptime",place="360 Shields Library",date="Jan 30, 2019 10:00am", geometry=pt, crs=proj)

m1 <- mapview(maptime
              , map.types="OpenStreetMap"
              , label = "Maptime"
              , col.reg = "purple"
              , cex = 10
              , alpha = 0.8
              )

# plot the map
m1

# Saves out a single html file with everything in it.
mapshot(m1, url="map.html")
