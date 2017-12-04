#### OSM data in R: get OSM data ####

install.packages(c('osmdata','sf'), dependencies = TRUE)
# will install lot of packages

library(magrittr)

library(osmdata)
# supply the bounding box or specify the names
bb <- getbb('Davis')
q0 <- opq(bb)


#### Bicycle parkings in Davis from OSM ####
# Construct an Overapss query object
q1 <- add_osm_feature(q0,key = 'amenity', value = 'bicycle_parking')
# Return the result of the query as sf object
osmd <- osmdata_sf(q1)

# Or combine by pipe
osmd <- opq(bbox = 'Davis') %>% 
  add_osm_feature(key = 'amenity', value = 'bicycle_parking') %>%
  osmdata_sf()


####Inspect osmdata object for parkings####
print(osmd)


#### Plot the parkings ####
# plot the polygons; we will use the mapview
# package, should be installed now with osmdata
library(mapview)
mapview(osmd$osm_polygons)

# this will create an interactive map window
# browse the map to check the accuracy of the
# osm tagging


#### Now let’s find the dog parks ####

# Use the key/value pairs from OSM map features
# to download and plot the dog parks in Davis
# Are all the dog parks in Davis mapped?

  
#### Read ‘.osm’ files ####

# You have exported the ‘.osm’ file from the OSM
# website. We can read that file in R with
# sf/gdal routines
#testdata <- sf::st_read('map.osm', layer = 'multipolygons', quiet = TRUE)
testdata <- sf::st_read('campus-12042017.osm', layer = 'multipolygons', quiet = TRUE)
mapview(testdata)
