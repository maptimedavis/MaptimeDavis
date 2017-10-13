
# 1. First read chapters 1, 2, 3 and section 6.1 to 6.4 
# Read from http://rspatial.org/spatial/index.html

library(sp)
# 2. Read the file "Operating-Health-Facilities-with-location-2014.csv" (under "data\tza")
setwd("C:/MaptimeDavis/")
d <- read.csv("data/Operating-Health-Facilities-with-location-2014.csv", stringsAsFactors=FALSE)

# 3. Make a plot of the locations
plot(d[,c('LONGITUDE', 'LATITUDE')])

# 4. how many of the records have missing coordinates (absolute number and rounded percentage)?
xy <- na.omit(d[,c('LONGITUDE', 'LATITUDE')])
nrow(d) - nrow(xy)
round(100 - 100* (nrow(xy) / nrow(d)),1)

# 5. Use the data to create a SpatialPointsDataFrame
d <- d[!is.na(d$LONGITUDE), ]
sp <- SpatialPoints(d[,c('LONGITUDE', 'LATITUDE')])
sp <- SpatialPointsDataFrame(sp, d) 

#or
coordinates(d) <- ~ LONGITUDE + LATITUDE

# 6. Plot the SpatialPointsDataFrame object
plot(d)

# plot(d, col=rainbow(7)[as.integer(as.factor(d$ZONE))])
# spplot(d, 'ZONE')


# 6. Coordinate reference system (CRS)
# 6a. what is the coordinate reference system of this object?
proj4string(d)

# 6b. change this to what it should be
proj4string(d) <- CRS("+proj=longlat +datum=WGS84")

#or 
proj4string(d) <- CRS("+init=epsg:4326")

# or
library(raster)
crs(d) <- "+proj=longlat +datum=WGS84"


# 7. Subsetting
# Use the SpatialPointsDataFrame we have to create one for only the Northern zone 
north <- d[d$ZONE == 'Northern', ]
# Use the SpatialPointsDataFrame you just made to create one for only Arusha Region 
arusha <- north[north$REGION == 'Arusha', ]


# 8. How many point objects does the last SpatialPointsDataFrame (for Arusha) have?


# 9. Get a SpatialPolygonsDataFrame for Tanzanian boundaries
library(raster)
tza <- getData('GADM', country='TZA', level=1)
tza

# 10. for all points, determine the Region in which they are, according to the Tanzania polygons
e <- extract(tza[, 'NAME_1'], d)

# or
crs(d) <- crs(tza)
e2 <- over(d, tza[, 'NAME_1'])


# 11. Are these the same as is specificied in the csv file?
# a) find the cases that are different
i <- which(e$NAME_1 != d$REGION) 

# b) how many?
length(i)

# c) plot them
plot(tza)
points(d[i,])

plot(tza, border='gray')
text(tza, 'NAME_1', col='blue', cex=.75)
points(d[i,], pch=20, col='red')
text(d[i,], 'REGION', cex=.5)


# 12. now transform the points and polygons object to a planar coordinate reference system 
# that is appropriate for all of Tanzania, and plot them together on a simple map

# cannot use UTM (would need multiple zones)
# http://www.spatialreference.org/ref/sr-org/8225/

cr <- CRS("+proj=laea +lat_0=-10 +lon_0=35 +x_0=0 +y_0=0 +datum=WGS84 +units=m")
# or 
cr <- CRS("+proj=laea +lat_0=-10 +lon_0=35 +datum=WGS84")

ptza <- spTransform(tza, cr)
pd <- spTransform(d, cr)



# 13. the polygons have regions, but not he higher level "zones". 
# create a SpatialPolyognsDataFrame for the zones. 
# the Health-Facilities data have the information you need
# a. make a data.frame with each REGIONs and its matching ZONE 
x <- unique(data.frame(d)[,c('REGION', 'ZONE')])

# b. combine that with the SpatialPolygons we have
tza <- merge(tza, x, by.x='NAME_1', by.y='REGION')

# c. dissolve the region boundaries into zones
zones <- aggregate(tza, by='ZONE')

# d plot
plot(zones)
text(zones, 'ZONE')



