# raster data

# Carefully read http://rspatial.org/spatial/rst/4-rasterdata.html
# create raster data examples

# And quickly read 
# http://rspatial.org/spatial/rst/8-rastermanip.html

# We are going to extract annual average rainfall in Tanzania 
# for all years (that we have data for) of Tanzania 
# We are using a raster data that covers Tanzania and more and has monthly data 

# Later on we will use these data to see if variation in rainfall predicts
# variation in maize yield.

# You do not have to fill in very much. But take your time to see
# what is going on

library(_______)
# where is the monthly precipitation data ?
path <- "___________/prec"

# get a vector of all the relevant files
ff <- list.files(___________, pattern='.tif$', full.names=___________)

# we want them in order. In this case, sort works (not always!)
s <- stack(sort(ff))
# you shoul have 132 layers
s

# let's plot
plot(s)
# (by default, only the first 16 are plotted)

# plot the first three:

___________


# let's look at the mean for each month
# we use the stackApply function. We tell it to make 12 layers (by combining the 1st, with the 13th, 25th, etc. layer --- recycling at work).
rainmonth <- stackApply(s, 1:12, mean)
# set the right names
names(rainmonth) <- month.name

rainmonth
plot(rainmonth)

# compute the annual average total rainfall
rain <- sum(___________)
plot(rain)

# and the monthly mean precipitation averaged over all cells
mrain <- cellStats(rainmonth, mean)
barplot(mrain) 

# we want to compare annual maize yield with annual rainfall. 
# the Tanzania dry season is in the middle of the year
# it may be better to have "rain-years" that start in July and run through June
# that is a bit tricky

# we make explicit indices to group months
# 11 years, 12 months
i <- rep(1:11, each=12)
i[1:36]
# but the first 6 months are the last 6 months of the previous rain-year
i <- c(rep(1,6), i+1)
i[1:36]
# and now we need to remove the last 6 months 
i <- i[1:(length(i)-6)]
i

# stackApply again, now with our new indices to get yearly totals
ss <- stackApply(s, i, sum)
# set the layer names
names(ss) <- 2002:______
# the first and the last year are incomplete 
ss <- ss[[ -c(1, nlayers(ss)) ]]

plot(ss)


# We only want Tanzania
# get the extent of Tanzania
tza <- getData('GADM', country='tza', level=1)
ss <- mask(ss, ________)
plot(ss)

# save to file
ss <- writeRaster(ss, 'tza_annual_precipitation.grd', datatype='INT2S')
ss

# compute the average monthly precipitation for the entire country
x <- cellStats(ss, mean)
x

