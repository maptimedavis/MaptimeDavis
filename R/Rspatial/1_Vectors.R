
# 1. First read chapters 1, 2, 3 and section 6.1 to 6.4 
# Read from http://rspatial.org/spatial/index.html

# 2. Read the file "Operating-Health-Facilities-with-location-2014.csv" (under "data\")

# 3. Make a plot of the locations

# 4. how many of the records have missing coordinates (absolute number and rounded percentage)?

# 5. Use the data to create a SpatialPointsDataFrame

# 6. Plot the SpatialPointsDataFrame object

# 6. Coordinate reference system (CRS)

# 6a. what is the coordinate reference system of this object?

# 6b. change this to what it should be

# 7. Subsetting
# 7a. Use the SpatialPointsDataFrame we have to create one for only the Northern zone 
# 7b. Use the SpatialPointsDataFrame you just made to create one for only Arusha Region 

# 8. How many point objects does the last SpatialPointsDataFrame (for Arusha) have?

# 9. Get a SpatialPolygonsDataFrame for Tanzanian boundaries

# 10. for all points, determine the Region in which they are, according to the Tanzania polygons

# 11. Are these the same as is specificied in the csv file?
# a) find the cases that are different
# b) how many?
# c) plot them

# 12. now transform the points and polygons object to a planar coordinate reference system 
# that is appropriate for all of Tanzania, and plot them together on a simple map

# 13. the polygons have regions, but not he higher level "zones". 
# create a SpatialPolyognsDataFrame for the zones. 
# the Health-Facilities data have the information you need
# a. make a data.frame with each REGIONs and its matching ZONE 
# b. combine that with the SpatialPolygons we have
# c. dissolve the region boundaries into zones
# d plot

