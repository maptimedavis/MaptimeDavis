## ----setup---------------------------------------------------------------
library(dismo)
library(raster)
library(rpart)
library(randomForest)
library(maps)
library(RColorBrewer)
options(stringsAsFactors = FALSE)

#Change to the path where your data is saved
#datapath <- '/Users/echellwig/Research/Bigfoot/'

#read in data
bf <- read.csv(file.path(datapath, 'bigfoot.csv')) #bigfoot presence
wc <- getData('worldclim', var='bio', res=10) #climate variables


#define color palettes
bfpal <- colorRampPalette(brewer.pal(5,'Greens'))
difpal <- colorRampPalette(rev(brewer.pal(9, "RdBu")))



## ----what_is_bioclim-----------------------------------------------------

#plotting bio1 and bio12
plot(wc[[c(1, 12)]], nr=2, main=c('Mean Annual Temperature (C)',
                                  'Annual Precipitation (mm)'))

####################Bioclim Variable Definitions############################
# BIO1 = Annual Mean Temperature * 10
# BIO2 = Mean Diurnal Range (Mean of monthly (max temp - min temp))
# BIO3 = Isothermality (BIO2/BIO7) (* 100)
# BIO4 = Temperature Seasonality (standard deviation *100)
# BIO5 = Max Temperature of Warmest Month
# BIO6 = Min Temperature of Coldest Month
# BIO7 = Temperature Annual Range (BIO5-BIO6)
# BIO8 = Mean Temperature of Wettest Quarter
# BIO9 = Mean Temperature of Driest Quarter
# BIO10 = Mean Temperature of Warmest Quarter
# BIO11 = Mean Temperature of Coldest Quarter
# BIO12 = Annual Precipitation
# BIO13 = Precipitation of Wettest Month
# BIO14 = Precipitation of Driest Month
# BIO15 = Precipitation Seasonality (Coefficient of Variation)
# BIO16 = Precipitation of Wettest Quarter
# BIO17 = Precipitation of Driest Quarter
# BIO18 = Precipitation of Warmest Quarter
# BIO19 = Precipitation of Coldest Quarter


## ----extract_data--------------------------------------------------------

#extract bioclim variable values at our Bigfoot presence points
bfc <- raster::extract(wc, bf[,1:2])

head(bfc)


## ----plot_missing_values-------------------------------------------------

#any missing bioclim values? 
i <- which(is.na(bfc[,1]))
i
## [1]  862 2667

#plot where the missing values area
plot(bf[,1:2], cex=0.5, col='blue', pch=16, 
     main='Figure 1: Bigfoot presence data locations.')
points(bf[i, 1:2], pch=19, cex=1, col='red')
map(add=TRUE)


## ----plot_bioclim_distribution-------------------------------------------


plot(bfc[ ,'bio1'] / 10, bfc[, 'bio12'], xlab='Annual mean temperature (C)',
         ylab='Annual precipitation (mm)', pch=16, cex=0.5,
     main='Figure 2: Distribution of annual temperature and precipitation \n for Bigfoot presence data.')


## ----creating_absence_points---------------------------------------------

# the bounding box of the bigfoot data
e <- extent(SpatialPoints(bf[, 1:2]))
set.seed(0)

#creating random sample of locations/bioclim vars to serve as absence data
bg <- sampleRandom(wc, 5000, ext=e)
dim(bg)
head(bg)


## ----combinedata---------------------------------------------------------

#combind presence and absense data, pa: presense=1, absense=0
d <- rbind(cbind(pa=1, bfc), cbind(pa=0, bg))
d <- data.frame(d) #convert to dataframe


## ----eastwestsplit-------------------------------------------------------

#now we split the data into east and west along the 102 parallel
de <- d[bf[,1] > -102, ]
dw <- d[bf[,1] <= -102, ]


## ----cartmodel-----------------------------------------------------------

#lets try a cart model (classification and regression tree)
cart <- rpart(pa~., data=dw)

#CP complexity parameter: How much does splitting the node improve the error
printcp(cart) 

plotcp(cart) #plot the CP

#plot the actual Tree
par(mai=rep(0.2,4))
plot(cart, uniform=TRUE, main="Bigfoot Habitat Regression Tree")
text(cart, cex=.8)



## ----tuning_random_forest, warning=FALSE---------------------------------

#converting presence/absence to a factor
fpa <- as.factor(dw[, 'pa'])

#tuning the mtry parameter (how many variables to try at a given node)
par(mai=rep(1, 4))
trf <- tuneRF(dw[, 2:ncol(dw)], fpa)

#selecting the mtry value with the smallest error
mt <- trf[which.min(trf[,2]), 1]

mt

## ----random_forest_classification, warning=FALSE-------------------------


#fitting the model
crf <- randomForest(x=dw[, 2:ncol(dw)], y=fpa, mtry=mt)
crf #model summary

#plotting error vs. number of trees, looks like 500 is enough
plot(crf)

#variable importance plot, 
varImpPlot(crf, main='Variable Importance For Bigfoot Habitat Classification')


## ----random_forest_regression, warning=FALSE-----------------------------

# Now we are going to fit a regression model (ones and zeros are numbers)

#tune the mtry parameter
trf <- tuneRF(dw[, 2:ncol(dw)], dw[, 'pa'])
mt <- trf[which.min(trf[,2]), 1]

#fitting random forest with our tuned mtry
rrf <- randomForest(dw[, 2:ncol(d)], dw[, 'pa'], mtry=mt)

#the error based on the number of trees
plot(rrf)

#relative importance of various parameters 
varImpPlot(rrf, main='Variable Importance For Bigfoot Habitat Regression')


## ----predict_west--------------------------------------------------------

# So now we want to predict how likely it is for bigfoot to be found out west
ew <- extent(SpatialPoints(bf[bf[,1] <= -102, 1:2])) #inside this bounding box

#predicting using our random forest regression
rp <- predict(wc, rrf, ext=ew)

par(mai=rep(0.4,4))
plot(rp, col=bfpal(255))
map(add=TRUE)

## ----threshold_crossvalidation-------------------------------------------

# picking a using cross-validation on confusion matrix
eva <- evaluate(dw[dw$pa==1, ], dw[dw$pa==0, ], rrf)

#plotting the ROC curve (true +/false +)
plot(eva, 'ROC')

#saving optimum threshold
tr <- threshold(eva)

#plotting habitat using optimum threshold
plot(rp > tr[1, 'spec_sens'], col=bfpal(2))
map(add=TRUE)


## ----classification_prediction-------------------------------------------

#predicting bigfoot habitat using the random forest classification model
rc <- predict(wc, crf, ext=ew)

#plotting predictions
plot(rc,col=bfpal(2))
map(add=TRUE)


## ----classification_probabilities----------------------------------------
#predicting probabilities from the random forest classification
rc2 <- predict(wc, crf, ext=ew, type='prob', index=2)

#plotting those probabilities
plot(rc2, col=bfpal(255))
map(add=TRUE)

## ----predict_east--------------------------------------------------------

#removing NAs for east data
de <- na.omit(de)

#assessing model predictive power
eva2 <- evaluate(de[de$pa==1, ], de[de$pa==0, ], rrf)

#plot model quality
par(mai=rep(0.5,4))
plot(eva2, 'ROC')


## ----predict_USA---------------------------------------------------------

#extent for all data points
eus <- extent(SpatialPoints(bf[, 1:2]))


#predict to all of the range
rcusa <- predict(wc, rrf, ext=eus)

#plot all of range
plot(rcusa, col=bfpal(255), zlim=c(0,1))
points(bf[,1:2], pch=19, cex=0.15) #plot presence points
map(add=TRUE)


## ----predict_mexico------------------------------------------------------

#download data to mask raster with
mex <- getData('GADM', country='MEX', level=1)

#predict to mexico and mask
pm <- predict(wc, rrf, ext=mex)
pm <- mask(pm, mex)

#plot Mexico Prediction
plot(pm, col=bfpal(255), zlim=c(0,1))
map(add=TRUE)


## ----climateshifts-------------------------------------------------------

#get data for future climate 70 years from now.
fut <- getData('CMIP5', res=10, var='bio', rcp=85, model='AC', year=70)
names(fut) <- names(wc)

#predict for all of the US
eus <- extent(SpatialPoints(bf[, 1:2]))

futusa <- predict(fut, rrf, ext=eus) #future prediction
curusa <- predict(wc, rrf, ext=eus) #current prediction

#future likelihood of finding a Bigfoot
plot(futusa, col=bfpal(255), zlim=c(0,1), 
     main='Habitat suitability in 2080')
map(add=TRUE)



## ----Bigfoot_Range_Changes-----------------------------------------------

difrange <- futusa - curusa #change in habitat suitability

#plotting chnange in Suitablility
plot(difrange, zlim=c(-1,1), col=difpal(255),
     main='Change in Bigfoot habitat suitability over 70 years.')
map(add=TRUE)



